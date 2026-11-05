# GATE-EllipticCohomology~1: answers to human review

Branch head before this job: `f0df48d`. Repair commit: `621dc2a9`. The two reviews by roed-math were written against `941e205` and `641bdc0`. Commits `641bdc0` and `f0df48d` (the second one postdates both reviews) already carry most of the repairs. Each point below was re-verified against `TauCetiRoadmap/EllipticCohomology/README.md` at the current head and against the supplier text at its current location. Line numbers refer to the README after `621dc2a9`.

## H01 (roed-math) — applied

The higher-Toda supplier now exists. BordismFormalGroups F4 on main (merged as the BordismFormalGroups roadmap) builds coherent iterated-cofiber Toda operations for every arity r ≥ 3. They come with value degree `Σ|a_i| + r − 2`, full change-of-system indeterminacy, nested juggling, duality reversal and the forward filtered/cobar comparison (BordismFormalGroups README, F4, "Construct higher Toda operations for every finite arity r≥3" and items 1–3). E4 lines 675–684 and E5 lines 765–777 build the specific six- and seven-fold systems cell by cell. Degree checks: `⟨ν,2ν,ν,4ν,ν,η⟩` gives 16+4 = 20; `⟨κ,4ν,3ν,2ν,ν,κ̄⁴⟩` gives 106+4 = 110; `⟨2ν,5ν,4ν,3ν,2ν,ν,κ̄⁵⟩` gives 118+5 = 123 = |2Δ⁵ν|; `⟨ε,5ν,…,ν,κ̄⁵⟩` gives 123+5 = 128 = |Δ⁵ε|.

## H02 (roed-math) — applied

E4.A (lines 438–443) computes the algebraic cubic and compactified stack cohomology before identifying it with any Adams–Novikov E₂. It then proves the Gap Theorem `π_n Tmf = 0` for `−21 < n < 0` on the E3 descent tower, without using `MU_*tmf`. Line 661 places Mathew's `MU_*tmf`/cubic Hopf-algebroid identification strictly after the Gap Theorem.

## H03 (roed-math) — applied

E5 (lines 780–788) owns the special E1 Thom/quotient refinement for the loop maps `ΩS⁹ → N → ΩS¹³` and its comparison with GeneralizedCohomology G5.3's bundle-diagram Thom spectra (G5 item 3, "Thom spectra from diagrams", on main). It uses StringOrientation S2 only for the particular E∞ `MString` model.

## H04 (roed-math) — applied

E6 (lines 838–854) pins the 2-local Γ₁(3) comparison `tmf_(2)∧DA(1) ≃ tmf₁(3)_(2)` (Mathew, Theorem 1.2), with `π_*tmf₁(3)_(2) ≅ ℤ_(2)[a₁,a₃]`, `|a₁| = 2` and `|a₃| = 6`. It also pins the images `c₄ ↦ a₁⁴ − 24a₁a₃`, `c₆ ↦ −a₁⁶ + 36a₁³a₃ − 216a₃²` and `Δ ↦ a₁³a₃³ − 27a₃⁴`. These three images are proved in `TauCetiRoadmap/EllipticCohomology/Suggested.lean` (`gammaOneThreeCurve_c₄`, `gammaOneThreeCurve_c₆`, `gammaOneThreeCurve_discriminant`), and the file builds.

## H05 (kim-em) — answered

The claims in this comment were checked against BordismFormalGroups as merged on main, which is identical to the copy on this branch. F4 supplies the all-arity coherent systems and the threefold synthetic Moss theorem with explicit hypotheses (r ≥ s ≥ 0 minimal with `τ^r a₁a₂ = τ^s a₂a₃ = 0`). F4 item 3 assigns the application-specific systems to E4/E5, as the comment says. Its statement about CI on the updated head is superseded: the current head builds locally and passes the gate (see the end of this report).

## H06 (roed-math) — applied

E4.S (lines 374–436) owns the sphere inputs upstream of the elliptic descent spectral sequence:
- detection of η, ν, ε, κ, with κ in stem 14 at Adams–Novikov filtration 2 and `2κ = 0`;
- `κ̄_S ∈ ⟨κ,2,η,ν⟩` in `π₂₀S_(2) ≅ ℤ/8`, with indeterminacy `⟨ν²κ⟩` and `4κ̄_S = ν²κ`;
- `π₂₉S_(2) = 0`, turned into an actual nullhomotopy of `ν³κ̄_S`;
- at 3, `d₅(β₃/₃) = ±α₁β₁³` from `E₂^(2,36)` to `E₅^(7,40)`.

E4.U (line 597) uses the normalization `unit(κ̄_S) = τ²κ̄_ell`. This job also replaced E4.S item 1's procedure ("enumerate the homogeneous cobar bases and differential matrices … internal-degree≤60 window") with the mathematical statement: compute the Adams–Novikov E₂ in the finite range needed for stems 14, 20 and 29, and prove the filtration bounds that exclude other differentials. The README states mathematics, not algorithms.

## H07 (roed-math) — applied

E4.A (lines 494–555) introduces two categories: C_ℤ, all internally ℤ-graded comodules, and C_ev, its even-degree part. It states the equivalence `E : QCoh(M_FG) ≃ C_ev` with internal degree 2k matching Hodge weight k, and fixes the shift `(T_kM)_n = M_(n+2k)`. It builds the inclusion `i : C_ev → C_ℤ` and keeps odd objects as parity pairs, with S² = T₋₁; the square of the odd unit (0,O) is (ω⁻¹,0), so no square root of ω arises. The pushforwards, Φ and the bigraded formula `π_(n,s)(Smf/τ) ≅ H^s(ω^((n+s)/2))` all go through E and i.

## H08 (roed-math) — applied

E4.A (lines 485–490) names the signature functor `σ : Syn_MU → Fil(Sp)` as lax symmetric monoidal. It keeps σ separate from τ-inversion `Syn_MU → Sp`, which is strong symmetric monoidal, and proves the unit/product comparison diagrams for each functor separately.

## H09 (roed-math) — answered

The branch has since been rebased onto main. At the current head it differs from `origin/main` only inside `TauCetiRoadmap/EllipticCohomology/`, and `git merge-tree` against the current `origin/main` reports no conflict.

## Further repairs made in this job

These were required by the gate; none of them was a review point.
- **README lines 12–14:** the HomotopySpheres citation was a link pinned to a commit plus a pull-request number. It is now a stage citation: Stage 3C for three-fold Toda brackets, Stage 4 for Bott periodicity and J.
- **README line 803:** "PR284's Bott/J contracts and TB's Adams theory" → "HomotopySpheres Stage 4's Bott/J constructions and TangentialBordism's Adams theory".
- **README line 265:** `KO₂^{hG_j}` → `KO₂^(hG_j)`.
- **Suggested.lean imports:** four `Mathlib.<submodule>` imports → `import Mathlib`.
- **Suggested.lean docstrings:** the module docstring now has the "target signatures" form and lists the headline theorems that cannot be stated at the pins, with the missing carrier for each (stacks of stable curves, structured ring spectra, Thom spectra, level moduli). `translateX` and `shearY` are no longer private, and every declaration has a docstring.

Citations checked against their current text: BordismFormalGroups F4 and GeneralizedCohomology G5 on main; StringOrientation S2/S4/S6 and TangentialBordism B4 at their open heads; HomotopySpheres Stages 3C and 4 at both open heads that carry the folder. The roadmap's other prose was not restructured, so as not to widen the scope.

## Adversarial pass on the statements touched or re-verified

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `unipotentCoordinateChanges_noncommute` | (1,1,0,0)·(1,0,1,0) and the reverse order, with t = tv³ + rSv² + T | 0+1·1·1+0 = 1 versus 0+0+0 = 0 | the two products differ | docstrings added |
| translateX/shearY docstrings | x = u²x′+r, y = u³y′+su²x′+t | x = x′+1; y = y′+x′ | match | added |
| E(P⊗ω^k) ≃ T_kE(P), (T_kM)_n = M_(n+2k) | P = O, k = 1 | generator of T₁MU_* sits in degree −2 ↔ ω; Ext^(s,2k)(MU_*,E(P)) = Ext^s(MU_*,T_kE(P))₀ = H^s(P⊗ω^k) | consistent | none |
| Parity pairs, S² = T₋₁ | (S²M)_n = M_(n−2) = (T₋₁M)_n; (0,O)⊗(0,O) | S²iE(O) = iE(ω⁻¹) | (ω⁻¹,0), no square root of ω | none |
| Tot braiding sign | x ∈ C_a^i, y ∈ D_b^j | (−1)^(ib+ab+ij+ja) = (−1)^((a−i)(b−j)) | equal mod 2 | none |
| 2-primary sphere inputs | π₁₄S, π₂₀S_(2), π₂₉S_(2) | ℤ/2⊕ℤ/2 (σ², κ); ℤ/8 generated by κ̄ with 4κ̄ = ν²κ; 0 (π₂₉^s ≅ ℤ/3) | consistent with E4.S | item 1 reworded |
| `κ̄_S ∈ ⟨κ,2,η,ν⟩` | degree 14+0+1+3+(4−2) | 20 | correct | none |
| `τ^Nν³κ̄_S = 0` in π_(29,5−N) | filtrations ν = 1, κ̄ = 2 | ν³κ̄ in (29,5); τ ∈ π_(0,−1) | correct | none |
| `d₅(β₃/₃) = ±α₁β₁³` at p = 3 | t(β_(s/j)) = 16s − 4j | β₁ in (2,12), β₃/₃ in (2,36), α₁β₁³ in (7,40), stems 34 → 33 | correct | none |
| Elliptic `d₅(Δ)` | p = 2: h₂ (1,4), g (4,24); p = 3: α₁β₁² | stem 24 → 23, filtration 0 → 5 in both cases | correct | none |
| Six- and seven-fold brackets | value degree Σ+r−2 | 20, 110, 123, 128; ⟨2ν,Δ⁴ν,κ̄⟩ = 123; ⟨ε,Δ⁴ν,κ̄⟩ = 128; ν₆ in 99+3+3+40+2 = 147 | correct | none |
| Γ₁(3) invariants | a₂ = a₄ = a₆ = 0 | b₂ = a₁², b₄ = a₁a₃, b₆ = a₃², b₈ = 0 give the three images stated in H04 | proved in Lean | none |
| Gap range | n = −21 versus −20…−1 | π₋₂₁Tmf ≠ 0, so the bound is strict | correct | none |

The elaborated signatures were checked mechanically: `#check @name` for all 14 declarations of `TauCetiRoadmap/EllipticCohomology/Suggested.lean`, in one scratch file elaborated once. Every type matches its README statement and no binder was dropped. The only changes since the supplied signatures are that `translateX` and `shearY` are no longer private.

**Ownership.** Ownership was checked by object against BordismFormalGroups, GeneralizedCohomology, StringOrientation, TangentialBordism and HomotopySpheres. The specific sphere calculations of E4.S and the elliptic-specific higher systems do not appear as targets in any of them; BordismFormalGroups F4 item 3 explicitly assigns them to this roadmap. No declaration in `Suggested.lean` uses the qualified name of another roadmap's declaration.

**Sources.** No new source was cited and none was fetched; `needs-references.toml` was not created.

## Build and gate

- `lake build TauCetiRoadmap.EllipticCohomology.Suggested`: `Build completed successfully (8976 jobs).`
- Depcheck: `depcheck: 148 roadmaps, 1002 edges, 0 problem(s)`. There are no UPWARD or CYCLE lines; EllipticCohomology is not yet in the merge order.
- Gate: `gate EllipticCohomology: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
