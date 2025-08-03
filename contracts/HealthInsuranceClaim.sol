// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract HealthInsuranceClaimVerifier {
    address public insurer;

    enum ClaimStatus { Submitted, Approved, Rejected, Paid }

    struct Policy {
        uint256 coverageAmount;
        bool isActive;
    }

    struct Claim {
        address hospital;
        address patient;
        uint256 amount;
        string diagnosis;
        ClaimStatus status;
    }

    mapping(address => Policy) public policies;
    mapping(uint256 => Claim) public claims;
    uint256 public claimCounter;

    modifier onlyInsurer() {
        require(msg.sender == insurer, "Only insurer can perform this action");
        _;
    }

    constructor() {
        insurer = msg.sender;
    }

    // Register a new insurance policy for a patient
    function registerPolicy(address patient, uint256 coverageAmount) external onlyInsurer {
        policies[patient] = Policy(coverageAmount, true);
    }

    // Hospital submits a claim for a patient
    function submitClaim(address patient, uint256 amount, string memory diagnosis) external {
        require(policies[patient].isActive, "No active policy for this patient");
        require(amount <= policies[patient].coverageAmount, "Claim exceeds coverage");

        claimCounter++;
        claims[claimCounter] = Claim({
            hospital: msg.sender,
            patient: patient,
            amount: amount,
            diagnosis: diagnosis,
            status: ClaimStatus.Submitted
        });
    }

    // Insurer verifies and approves or rejects the claim
    function approveClaim(uint256 claimId) external onlyInsurer {
        Claim storage c = claims[claimId];
        require(c.status == ClaimStatus.Submitted, "Claim not in submitted state");

        c.status = ClaimStatus.Approved;
    }

    function rejectClaim(uint256 claimId) external onlyInsurer {
        Claim storage c = claims[claimId];
        require(c.status == ClaimStatus.Submitted, "Claim not in submitted state");

        c.status = ClaimStatus.Rejected;
    }

    // Payout to hospital after approval
    function payClaim(uint256 claimId) external onlyInsurer {
        Claim storage c = claims[claimId];
        require(c.status == ClaimStatus.Approved, "Claim must be approved");

        c.status = ClaimStatus.Paid;
        payable(c.hospital).transfer(c.amount);
    }

    // Insurer funds the contract for payouts
    receive() external payable {}
}
