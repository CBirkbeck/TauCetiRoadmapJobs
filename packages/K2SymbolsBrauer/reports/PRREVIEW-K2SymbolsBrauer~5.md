# Review of K2SymbolsBrauer (pull request #1302 at 607bfa8)

**Verdict:** needs changes

## R01 (P3) — The description states the function-field Brauer equivalence without `ℓ ≠ char F` and `ζ ∈ F`

**Location:** Pull request description, second prose paragraph: "Its only Brauer-group targets are the function-field adapters of §§10.32a–10.32b, which end in the degree-two norm-residue equivalence `K₂ᴹ(F)/ℓ ≃ Br(F)[ℓ]` for global function fields;"

**Claim:** The head constructs `h_(F,ℓ,ζ)` only for a prime `ℓ ≠ char F` with a primitive `ℓ`th root `ζ ∈ F`, and it excludes `ℓ = char F`. The sentence states the equivalence for every `ℓ`, and at `ℓ = char F` it is false.

**Witness:** `README.md:2435`: "`ℓ≠char F` a prime with a fixed primitive root `ζ∈F`". Line 2450 excludes `ℓ=char F`. Take `F=𝔽₇(t)`, `ℓ=7`. Then `K₂ᴹ(F)≅⊕_P κ(P)ˣ` (§10.5) has orders `7^d−1`, so `K₂ᴹ(F)/7=0`. But `Br(F)[7]` contains the class with invariants `1/7` at `0` and `6/7` at `∞`.

**Repair:** "Its only Brauer-group targets are the function-field adapters of §§10.32a–10.32b. They end in the degree-two norm-residue equivalence `K₂ᴹ(F)/ℓ ≃ Br(F)[ℓ]`, sending `{a,b}` to the cyclic algebra `(a,b)_ζ`, for a global function field `F`, a prime `ℓ ≠ char F` and a primitive `ℓ`th root of unity `ζ ∈ F`. Brauer-valued and cyclic-algebra symbols in general belong to the downstream roadmap K2SymbolsBrauerPartII." The repaired sentence asserts nothing at `ℓ=7=char 𝔽₇(t)`. At `ℓ=3`, `ζ=2` it agrees with the Check of §10.32b (row 1 below).

## Previous findings

- R01 — repaired: the description now reads "AlgebraicKTheory (A1–A3 and A5, its Layers 1–3 and 5: finite and stable GL and E, Whitehead's theorem, classical and relative K₁, finite and stable Steinberg groups, classical K₂ and Matsumoto's presentation)".

## Verified sound

| Statement (changed or touched) | Instances tried | Values on one side | Values on the other side | Result |
|---|---|---|---|---|
| Description, Brauer sentence against §10.32b (R01) | `F=𝔽₇(t)`, `ℓ=3`, `ζ=2`; then `ℓ=7` | `[2,t]₀=2^((7−1)/3)=4=ζ²`, so `2/3`; `[2,t]_∞=4⁻¹=2=ζ`, so `1/3`; the sum is `1≡0` | §10.32b Check: `2/3` at zero, `1/3` at infinity. At `ℓ=7`: `K₂ᴹ/7=0`, but `Br[7]≠0` | the head is right at `ℓ=3`; the description is false at `ℓ=7` (R01) |
| Description, AlgebraicKTheory clause (previous R01) | layers that A1–A3 and A5 name on main | main `README.md:235, 316, 379, 550` are A1, A2, A3, A5; §5.2 has `matsumoto` | this README cites §§1.1–1.4, 2.1–2.3, 3.1, 5.1–5.2 | agrees |
| Description, the three open suppliers | sections cited here, against the open heads `43e9df6`, `101144f`, `1dfb7dd` | GeneralAlgebraicKTheory §§3.2, 3.12–3.14, 4.6, 4.8, 4.14, 7.2–7.4, 7.7, 7.8, 8.1, 8.11–8.13, 10.12; KTheoryLowDegrees §§6.1–6.2, 8.1, 9.1, Layers 10–11, §§13.1–13.5; SchemeKTheoryOperations §3.6 | "Layers 3, 4, 7 and 8, and §10.12"; "Layers 6, 8–11 and 13"; "§3.6". None of the three is on main `e6f6358` | agrees |
| Description, StableHomotopyKTheory "Layers 1–4" | sections cited here | §§1.30, 1.32, 2.4–2.10, 3.12, 3.15, 3.26–3.33, 4.14 | highest cited layer is 4 | agrees |
| Description, "other suppliers are on main" | the suppliers this README names, on main `e6f6358` | QuadraticFormInvariants, ClassFieldTheory, ClassicalArithmeticCompletion, AlgebraicCurves, EllipticCurves, ReductiveGroups, RootSystems, AlgebraicTopology, GeneralizedCohomology | LocalFieldsRamification is under `Completed/` | agrees |
| Description, summary block: Lean names and count | `Suggested.lean` at the head | `Steinberg.centralExtension_splits` (line 74), `MilnorK` (line 111); 10 `sorry` warnings | "ten headline theorems"; the same names | agrees |
| Description, "Why Tau Ceti wants it" | `README.md:3442`–3453 | PartII, EllipticCurves (§10.31), KTheoryFiniteLocalFields, MotivicEtaleKTheory, HigherLocalFields…, ArithmeticKTheory, SpecialValuesBirchTate, RefinedTraceMethods | the same consumers with the same objects | agrees |
| Description, Maazen–Stienstra and integral-coefficient clauses | §13.13; Conventions | `README.md:3445`: §13.13 uses neither Maazen–Stienstra nor double excision; `2∈Rˣ` is needed only for `Ω¹` | `README.md:28`: `{a,a}={a,−1}`; over `ℝ`, `{−1,−1}` has real sign `1≠0` | agrees |

The rows for untouched statements, including the ten sorried headline theorems, stand as in the previous review, of `607bfa8`.

- **Gate:** a re-run at this head gives every count 0 and `OK`; the worker's run adds `build=0`. `git diff origin/main...HEAD` outside the folder is empty.
- **Dependency check:** `depcheck: 245 roadmaps, 2216 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives ten `declaration uses sorry` warnings (lines 74, 131, 137, 150, 160, 190, 199, 212, 220, 256) and nothing else.
- **Citations resolved:** GeneralAlgebraicKTheory, KTheoryLowDegrees and SchemeKTheoryOperations resolve at their open heads; AlgebraicKTheory Layers 1–3 and 5 resolve on main. The resolver's 13 name leads are all declarations of `Suggested.lean`.
- Overlap check: read K2SymbolsBrauerPartII, EllipticKTheory, KTheoryFiniteLocalFields, K3BlochGroups, HomologicalStabilityOfGeneralLinearGroups (open), AlgebraicKTheory, StableHomotopyKTheory, ClassicalArithmeticCompletion (main). No id is dropped and no other open pull request changes this roadmap. The owners stand as in the review of `902ff2b`. K2SymbolsBrauerPartII consumes §§10.32a–10.32b, so this roadmap owns the prime-to-characteristic function-field equivalence.
- Source independence: 0 passages compared with 0 sources (changed passages only: the folder is unchanged since `607bfa8`). The largest share is `weibel`, 171 of 246 locators, as counted at `902ff2b`. Contents were not compared again, since no layer was added, removed or reordered.
- **Seeded sample:** with 0 changed lines, no sampled target falls in a changed passage, so none was checked again.

## Not verifiable

- `weibel`: not fetched this round, because no changed passage cites it. The previous round's fetch failed with network trouble.

## Source issues

- none

## For the human reviewers

- Not tested: `weibel` has the largest share of the locators (171 of 246) and was not read this round or the previous one. The review of `902ff2b` compared it, and no locator has changed since.
