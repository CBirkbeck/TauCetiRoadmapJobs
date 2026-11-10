# Review of LatticePackingsAndPerfectForms (pull request #1723 at 75708d3)

**Verdict:** needs changes

Incremental re-review of the 133 lines changed since `ba416b6`. The previous review's R02–R06 are repaired and the repairs introduce no new defect. Its R01 is not repaired and is the only finding left: the branch still pins an older Tau Ceti than the one the README declares, and it can only be closed by merging main into the branch.

## R01 (P2) — The branch pins Tau Ceti `358314d4`, the README declares `2fd255d9`; at the declared revision the Leech covering-radius headline is statable and absent, and `discriminantQuadraticHom` restates a Tau Ceti homomorphism

Re-raised: R01 of the previous review, itself H01/H02 of the earlier repair reports (answered "not actionable inside the roadmap folder").

**Location.**
- `lake-manifest.json` at this head: Tau Ceti `358314d4`, Mathlib `f6090c70`. Main (`4452ffa`) pins `2fd255d9` and `1b1ccf4b`.
- `TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:285–288`: "The pins are Tau Ceti `2fd255d9…` and Mathlib `1b1ccf4b…`. Every Tau Ceti and Mathlib declaration … is cited as it is at those revisions."
- `TauCetiRoadmap/LatticePackingsAndPerfectForms/Suggested.lean:33–38`: "… exists at the Tau Ceti revision `2fd255d9…` that README.md cites and is absent from the earlier revision this file is elaborated against."
- `Suggested.lean:713–735` (`discriminantQuadraticHom`) and `README.md:1922–1924`.

**Claim.** The folder is written against two library revisions. The module docstring describes the branch, not the mathematics, and becomes false at merge: on main `μ(Λ₂₄) = √2` is statable and is not stated. At the declared revision the homomorphism `O(L) →* O(q_L)` that 7.4 builds is already a Tau Ceti declaration, so 7.4 restates it.

**Witness.**
- `TauCeti/LinearAlgebra/IntegralLattice/Rank24/Leech/Basic.lean:236` (`leechLattice`) and `:299` (`isPosDef_leechLattice`) exist at `2fd255d9`; the directory `Rank24/` does not exist at `358314d4`.
- `TauCeti.IntegralLattice.Isometry.discriminantOrthogonalHom`, `TauCeti/LinearAlgebra/IntegralLattice/Discriminant/OrthogonalGroup.lean:249` at `2fd255d9`, with codomain `FiniteQuadraticModule.orthogonalGroup A`, the abbreviation of `QuadraticMap.orthogonalGroup A.quadratic` (`FiniteBilinearModule/OrthogonalGroup.lean:49–50`). The file is absent at `358314d4`.
- `git merge-tree --write-tree origin/main HEAD` is clean.

**Why the settled reason fails.** The reason is true of a repair confined to the two files of the folder. This report is addressed to the pull request, whose author can merge main; after the merge the diff against main is still only the folder, since the manifest then is main's.

**Repair.**
1. Merge `origin/main` into the branch. README 285–288 become true as written.
2. In `Suggested.lean` add `import TauCeti.LinearAlgebra.IntegralLattice.Rank24.Leech.Basic` and, after `kissingNumber_eq_kissingNumber`:

   ```lean
   /-- **3.4.** The Leech lattice has covering radius `√2` in the real model of the Gram matrix of
   any `ℤ`-basis (Conway–Parker–Sloane; Conway–Sloane, Ch. 23). -/
   theorem coveringRadius_gramForm_leechLattice (b : Basis (Fin 24) ℤ TauCeti.leechLattice) :
       (gramForm TauCeti.isPosDef_leechLattice b).coveringRadius = Real.sqrt 2 := sorry
   ```

   Delete the docstring text from "The Leech covering radius" to "indexed by `Fin 24`." and add the theorem's name to README 3.4 under "API and acceptance statements".
3. Add `import TauCeti.LinearAlgebra.IntegralLattice.Discriminant.OrthogonalGroup`, delete `discriminantQuadraticHom`, and define the even branch of `fvIndex` as `(TauCeti.IntegralLattice.Isometry.discriminantOrthogonalHom L he).range.index`. In README 7.4, the 7.4 and 7.5 *Needs:* lines and the *From Tau Ceti* table, cite `discriminantOrthogonalHom` in place of "Bundle … as the homomorphism `discriminantQuadraticHom`".

Step 2 was elaborated at main's pins in an earlier review (exit 0, 53 `sorry` warnings). This review may elaborate only at the worktree's pins, where both modules are missing; steps 2 and 3 were checked here by reading the three declarations at `2fd255d9`.

## Previous findings

- R01 — not repaired: the manifest pins `358314d4`; README 285–288 still names `2fd255d9`; the docstring still says the carrier "is absent from the earlier revision this file is elaborated against". Raised again as R01.
- R02 — repaired: `quadraticIsometryGroup` is deleted; `discriminantQuadraticHom` is valued in `TauCeti.QuadraticMap.orthogonalGroup (L.discriminantQuadraticModule he).quadratic`; README 7.4, *Conventions* and the *From Tau Ceti* table cite both Tau Ceti names. The after-merge step is R01, step 3.
- R03 — repaired: "`ENNReal.ofReal (coveringRadius A) = GoN.latticeCoveringRadius (stdLattice A)`" and "for `1 ≤ i ≤ n` … `λᵢ = SM.successiveMin … (i − 1)`", for `n ≥ 1`, with the I₂ and rank-zero Checks.
- R04 — repaired: 2.2's *Needs:* line and table row read "L 0.3, 1.1, 1.9, 2.1" without GoN 4.5.1; the GoN contract lists §4.3, 4.4.1, 4.4.2 with their consumers; the four unused names are gone.
- R05 — repaired: "every lattice of prime rank is indecomposable … a lattice whose determinant has a prime factor `p` with `p² ∤ det L` is indecomposable, in every rank", with the `2I₃`, diag(1,1,2,3) and diag(1,1,1,1,1,12) Checks.
- R06 — repaired: all five passages read as requested (the stray `)`, "(*Conventions*, Tensor products)", the `isExtreme_iff` and `isHalfUniversal_iff_twoNinety` bullets, the rank-one sentence of 2.2).

## Verified sound

**Gate, build and order.**
- The gate, re-run on this head with the merge-order candidate, passes: every check 0, OK. The worker's gate reports `build=0`.
- No file changes outside the folder (`changes.md`: none; the diff stat excluding the folder is empty).
- Dependency check: `depcheck: 234 roadmaps, 2263 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Merge-order lines: GoN 55, PMNT 62, WeightsInEtaleCohomology 147, this roadmap 148.
- `overlaps.md`: no open pull request changes this roadmap or drops an id it cites.

**Elaboration.**
- `lake env lean` on `Suggested.lean`: exit 0, 52 `declaration uses sorry` warnings, nothing else.
- The diff changes no theorem statement: it deletes one instance, changes the codomain and proof of the definition `discriminantQuadraticHom`, and adds one import, present at the branch pin. The elaborated type in `signatures.md` is `L.Isometry L →* ↥(TauCeti.QuadraticMap.orthogonalGroup (L.discriminantQuadraticModule he).quadratic)`, with `[L.IsNondegenerate]` and `he : L.IsEven` in its signature, as README 7.4 states. No sorried theorem was added, so the padding probe of the previous review stands.

**Library declarations opened (3 at the branch pin, 3 at `2fd255d9`).**
- `TauCeti.QuadraticMap.orthogonalGroup`, `TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup/Basic.lean:186` at `358314d4` (`:190` at `2fd255d9`): a `Subgroup (M ≃ₗ[R] M)` with carrier `{f | ∀ m, Q (f m) = Q m}`, so its product is composition, as README 7.4 says.
- `orthogonalGroupEquivIsometryEquiv` (`:217`) and `coe_orthogonalGroupEquivIsometryEquiv_symm` (`:231`).
- At `2fd255d9`: `discriminantOrthogonalHom`, `FiniteQuadraticModule.orthogonalGroup`, `leechLattice` (R01).

**Cross-roadmap citations resolved for the changed passages (4).**
- GoN at its open head: §4.3 has `polynomialLaplacian`, `polynomial_fischer_decomposition`, `polynomial_sphere_harmonic_span` and `fourier_harmonic_gaussian`; 4.4.1 `latticePackingRadius`; 4.4.2 `latticeCoveringRadius` "with values in `[0,∞]`, through Mathlib's `Metric.infEDist`", finite for a full lattice, zero in dimension zero.
- SuccessiveMinima on main, `README.md:318`: the value at every index `≥ d` is `sInf ∅ = 0`.
- The scope line "LLL … cited by GoN 5.1" (172) is a deferral, not a consumed supplier, and stays valid.
- This README's own 1.2 (index `0` is the first minimum), 1.9 (reduced-Gram bounds used by 2.2) and *Conventions*, **Tensor products** (line 257) exist where the changed text cites them.

**Seeded sample.** Of the fifteen targets, the diff touches 7.3, 7.4 and one parenthesis of 3.4; they are checked above and in the table. 7.3 has no external locator. The other twelve are untouched and were verified in the previous report.

**Adversarial pass.** Rows for the changed statements, computed this round:

| Statement | Instances | Values computed on each side | Result |
| --- | --- | --- | --- |
| 2.2 rank-one sentence, *Needs:* | [a], a > 0; n = 2, η = 1/4 | `min/det^(1/1)` = a/a = 1 for every a, so γ₁ = 1 is attained; the compact set is 1.9's reduced representatives, now in *Needs:* | Pass |
| 3.3 identification with GoN | rank 0; [4] | `ENNReal.ofReal 0 = 0`, GoN's value in dimension zero; [4]: `ofReal 1 = 1`; both sides in `[0, ∞]` | Pass |
| 3.3 Jarník, `n ≥ 1`, index `i − 1` | [4]; I₂; diag(1,4); I₂ read at index `n` | 1 ≤ 1 ≤ 1 ≤ 1; 0.5 ≤ 0.70711 ≤ 1 ≤ 1; 1 ≤ 1.11803 ≤ 1.5 ≤ 2; junk reading gives `1 ≤ 0`, false, as the new Check says | Pass |
| 6.4 bullet | 2I₄; [2] | half-norms of 2I₄ are sums of four squares, all 29 represented; [2] has half-norms k², misses 2; the bullet's list is README 1743–1745, 29 entries, equal to the Lean `Finset` | Pass |
| 7.3 prime rank | `2I₃`; A₂ | rank 3, det 8 = 2³ not squarefree, indecomposable; rank 2 | Pass |
| 7.3 simple prime factor | diag(1,1,2,3); diag(1,1,1,1,1,12); ℤ⁴; A₂⊗A₂; A₂⊗D₄ | det 6 against `d₁²d₂²`; det 12 = 2²·3 against `d₁³d₂²`, exponent of 3 is `3a + 2b ∈ {0, 2, 3, …}`, never 1; det 1 decomposable, test silent; 81 = 3⁴; 1296 = 2⁴·3⁴ | Pass |
| 7.4 `O(q_L)` as `orthogonalGroup`, composition order | [8]; [12]; 2I₃ with f = (12), g = (23) | u² ≡ 1 mod 16: {1,7} of ℤ/8, against {1,3,5,7} bilinear; u² ≡ 1 mod 24: {1,5,7,11}, image {±1}, index 2; (f·g)(e₁/2) = f(e₁/2) = e₂/2, (g·f)(e₁/2) = g(e₂/2) = e₃/2; `Subgroup (M ≃ₗ M)` product is `f ∘ g`, and `bilinearIsometryGroup` has `mul f g := g.trans f` | Pass |
| 7.5 `fvIndex` through the new codomain | m = 8, 12 | 2/2 = 1; 4/2 = 2; elaborates unchanged | Pass |

The rows for the untouched statements (0.4, 0.5, 1.1, 1.3, 1.6–1.8, 2.1, 2.3, 3.1, 3.2, 3.4, 4.1, 4.2, 4.5–4.7, 4.9–4.11, 5.2–5.7, 6.1–6.3, 7.1, 7.2 and the worked examples) carry forward from the previous report's table (review at `ba416b6`), all Pass there; 3.4's Leech row is subject to R01.

**Remark on untouched text.** The description says "9 layers"; the README has Layers 0–7.

## Not verifiable

- Conway–Sloane, *SPLAG*, Ch. 21 §3, Ch. 23, Ch. 25 (3.1, 3.4) and Gruber–Lekkerkerker, Ch. 2 §13 (3.3): behind a paywall, no legal open copy, as in the previous report. Jarník's inequalities were checked on the instances above only.
- Steps 2 and 3 of R01's repair cannot be elaborated at this worktree's pins; they were checked by reading Tau Ceti at `2fd255d9`.

## Source issues

- none
