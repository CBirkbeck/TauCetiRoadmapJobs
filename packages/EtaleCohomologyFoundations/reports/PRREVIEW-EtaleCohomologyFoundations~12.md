# Review of EtaleCohomologyFoundations (pull request #1891 at 0cefadf)

**Verdict:** needs changes

## R01 (P3) — The description imposes invertibility where the head does not

**Location:** PR description, “Approach and generality” (quoted in `scratch/pull-request.md:26`): “everything is stated over a qcqs or locally Noetherian base with ℓ invertible”.
**Claim:** This misstates the coefficient range of the retained affine Artin vanishing headline.
**Witness:** `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:1102` explicitly permits all torsion orders; `Suggested.lean:156` has no invertibility hypothesis. On `𝔸¹_𝔽̄₂`, constant `ℤ/2` has `H²=0` although `2=0` in the field.
**Repair:** Replace the quoted clause with: “Geometric and coefficient hypotheses are stated separately for each result; affine Artin vanishing permits arbitrary torsion, including residue-characteristic torsion, while the prime-to-characteristic dimension and ℓ-adic bounds require invertibility.”

## R02 (P3) — The summary omits the removed Frobenius signatures

**Location:** PR description, `roadmap-summary` block (`scratch/pull-request.md:15`): “The headline signatures drop duplicate compactification, lattice and trace constructions”.
**Claim:** The account of signature removals omits the finite-field Frobenius block and does not convey the extent of the Lean-file replacement.
**Witness:** `TauCetiRoadmap/EtaleCohomologyFoundations/Suggested.lean:416` on `origin/main` declares `frobeniusFixedPoints`; the head does not. Its arithmetic/geometric Frobenius definitions and fixed-field cardinality theorem also disappear. The computed declaration diff removes 39 declarations and adds seven.
**Repair:** Add to that block: “Suggested.lean is largely replaced: 39 declarations are removed and seven added, leaving eight. The finite-field Frobenius definitions, fixed-field cardinality theorem and fixed-point equivalence signatures are removed in favour of pinned library interfaces; §F.10.1 retains their conventions and the extension-count comparison.”

## R03 (P3) — The description omits supplier changes

**Location:** PR description, change summary and merge-order prose (`scratch/pull-request.md:15`, `:28`); omitted additions and removals in `TauCetiRoadmap/EtaleCohomologyFoundations/README.md`’s supplier table.
**Claim:** Saying that no open PR is required does not disclose which suppliers this revision adds or drops.
**Witness:** The base supplier table names AdicSpacesPartIII at `README.md:44` and JacobianChallenge at `:52`; neither remains at head. The head adds GrothendieckEulerForms at `:76` and uses it for Gauss–Bonnet at `:2024`.
**Repair:** Add: “Supplier changes: GrothendieckEulerForms Layers 2 and 5 supply triangulated K₀ and Euler characteristics. AdicSpacesPartIII is dropped because projective trace comes from pinned Tau Ceti. JacobianChallenge is dropped because §0.11 constructs smooth trace by the diagonal argument instead of the Jacobian route.”

## Previous findings

The preceding report accepted this same head and contained no open findings. Its recorded closures remain:

- R01 — repaired: the description still names WeilConjectures’ extensionPointCount and DeligneWeightsAndPurity’s finiteFieldPointCount, their replacements and the ownership of §F.10.1.
- R02 — repaired: `README.md:633` still passes from the algebraic closure to the separable closure by universal-homeomorphism invariance before finite-extension descent; §F.0.4 remains an explicit prerequisite.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Affine Artin vanishing (§F.3; R01) | `X=𝔸¹_𝔽̄₂`, `F=ℤ/2`, `q=2` | `dim X=1`; `2>1`; `H²=0`. `[t]≠0` in `H¹=k[t]/(g²−g)`: nonconstant images have even degree. | Bound holds for noninvertible torsion. | Correct description only. |
| Removed fixed-point equivalence (§F.10.1; R02) | `X=𝔸¹_𝔽₂`, algebraic closure, `r=1,2` | Rational-point counts: `2,4`. Roots of `x²−x`, `x⁴−x`: `2,4`; derivatives are `−1`. | Both sides agree. | Disclose signature removal. |
| Euler characteristic in Gauss–Bonnet (§F.6; R03) | `X=ℙ¹_𝔽̄₂`, `ℓ=3` | `deg c₁(T_X)=2`; cohomology ranks `(1,0,1)`; `χ=1−0+1=2`. | Equality retained. | Disclose supplier addition. |
| Projective trace supplier (§F.10.3; R03) | Identity on `ℚ²`, standard basis | Diagonal sum `1+1=2`; evaluation contraction `e₁*(e₁)+e₂*(e₂)=2`. | Same trace. | Disclose supplier replacement. |
| Smooth trace route (§0.11; R03) | Identity; `ℙ¹_k`, algebraically closed `k`, invertible `n>1` | Identity sends `1↦1`; `c₁(O(1))↦1∈ℤ/n`, its degree. | Normalization retained. | Disclose dropped Jacobian supplier. |

Untouched statements’ adversarial rows stand as in the previous review of `0cefadf`.

- Incremental scope: 0 changed folder lines; 0 outside-folder changes; title and description checked against the full base-to-head diff.
- Source check: 1 locator reopened, Stacks 0F0V, Proposition 59.95.6, printed p. 197 (`stacks-0F0V line 9332`); no seeded target has a changed folder passage.
- Pinned interfaces opened: `TauCeti/AlgebraicGeometry/RationalPoint/FixedField.lean:212` and `:256`, supplying fixed-field point equivalence and its cardinality statement.
- Signatures: all 8 worker-elaborated types compared with the retained statements; 0 binder changes. The previous one-tactic probes concern the identical file.
- Gate: all reported checks zero, `OK`, exit 0; worker gate additionally reports `build=0`.
- Dependency-check output: `depcheck: 245 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Targeted build and direct `lake env lean` elaboration: both exit 0; only the 6 expected `sorry` warnings.
- Overlap data: 0 conflicting heads or dropped-id entries; both point-count consumer declarations named in the description remain at the supplied open heads.

Overlap check: read ClassicalAdicEtaleCohomology, EtaleDualityAndPerverseSheaves, AdicCoefficientsAndComparisons, LefschetzPencilsAndVanishingCycles, InverseGaloisAndArithmeticFundamentalGroups, SchemeAndStackFoundations, AdicEtaleGeometry and AbhyankarLemma; shared scheme coefficient, support, trace and basic duality inputs belong to EtaleCohomologyFoundations; scheme-site foundations to SchemeAndStackFoundations; analytic sites/cohomology, v-sheaf comparisons, extended perverse theory, nearby cycles, arithmetic specialization and tame-cover extension retain their respective named owners. No ownership change arises in this zero-line increment.

Source independence: changed passages only; 0 changed roadmap passages to compare with sources, no changed source locators or layer arrangement; wording, reuse and contents comparison are not reopened. The PR prose check uses the retained statements and the single source locator above.

## Not verifiable

- No new item; settled uncertified sources are unchanged and were not requested again.

## Source issues

- none

## For the human reviewers

- none

