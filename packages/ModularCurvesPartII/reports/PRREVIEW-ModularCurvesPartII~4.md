# Review of ModularCurvesPartII (pull request #913 at 5d81b10)

**Verdict:** needs changes

Incremental re-review of the 16 lines changed since 82d96e2, with the pull request's title and description read against this head. Four P3 findings; none is blocking, but the gate fails on R01.

## R01 (P3) — `letI` in the signature of `congruenceClasses_invariant` (gate: statement-hygiene)

**Location:** `TauCetiRoadmap/ModularCurvesPartII/Suggested.lean:154`: "`letI : (CongruenceSubgroup.Gamma N).Normal := CongruenceSubgroup.Gamma_normal N`".

**Claim:** The statement elaborates cleanly under the statement-hygiene rule (no `letI`/`haveI` in a signature).

**Witness:** Gate at this head: `statement-hygiene=1 … FAIL`, "line 154: P3 `letI` in the signature of theorem `congruenceClasses_invariant`". Mathlib's `CongruenceSubgroup.Gamma_normal` is a `theorem`, not an instance (`Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean:54`).

**Repair:** Delete the `letI` line and pass the instance explicitly:

```lean
    (∀ g : Matrix.SpecialLinearGroup (Fin 2) ℤ, IsCongruenceCharacter N q
      (ψ.comp (@MulAut.conjNormal _ _ (CongruenceSubgroup.Gamma N)
        (CongruenceSubgroup.Gamma_normal N) g).toMonoidHom.toAdditive - ψ)) →
        IsCongruenceCharacter N q ψ := by
```

Tested on a scratch copy: it elaborates with the same seven `sorry` warnings and `#check @congruenceClasses_invariant` prints the same type as before.

## R02 (P3) — The supplier names cited from CyclotomicClassGroupsAndStickelberger §4.3 are no longer at its head

**Location:** `TauCetiRoadmap/ModularCurvesPartII/README.md:4153`: "CyclotomicClassGroupsAndStickelberger §4.3 (dimension theorem, `modularTate_rank_two`)"; likewise lines 290, 4140, 4180, 4196 (changed lines) and 4121, 4134, 4176.

**Claim:** §4.3 declares `modularQuotient`, `modularQuotientForIdeal`, `abelianSubvarietyQuotient`, `modularQuotient_map/_kills/_lift/_hom_ext/_baseChange/_hecke` and `modularTate_rank_two`, "consumed here by name".

**Witness:** At the supplier's open head (f2e0f0d) none of these names occurs in its README or `Suggested.lean`; §4.3 (README line 755, headed "Shared abelian arithmetic and the modular residual extension") states the same objects in prose only (lines 779–785).

**Repair:** Cite §4.3 by what it states: "the Albanese modular quotient `A_f` with its universal quotient map" (vanishing on the Hecke-ideal images, factorization and its uniqueness, base extension, Hecke equivariance), "the abelian subvariety quotient `B/C`", "the Hecke-ideal quotient", "`dim A_f=[E:ℚ]`" and "rank two of the `E_λ`-factor of the Tate module of `A_f`" (for all `λ∣ℓ` this is freeness of rank two over `ℚ_ℓ⊗K_f=∏_λ K_{f,λ}`). Drop the backticked names in lines 290, 4121, 4134, 4140, 4153, 4176, 4180, 4196 and the words "consumed here by name"; give the heading at line 290 as the supplier has it.

## R03 (P3) — The description still lists Shimura's quotients and dimension theorem among this roadmap's results

**Location:** Pull request description, second prose paragraph: "The final layers give Ihara injectivity and saturation, Shimura's modular abelian quotients and dimension theorem, and finite-level Taylor–Wiles freeness".

**Claim:** Layer 16 constructs `A_f` and proves `dim A_f=[K_f:ℚ]`.

**Witness:** README line 17 and §16.2–16.3 (lines 4121, 4140): the quotient and the dimension theorem are CyclotomicClassGroupsAndStickelberger §4.3's, "consumed here, not proved again"; "this roadmap constructs no quotient of `J₁(N)`". The summary block above the paragraph is already right.

**Repair:** "The final layers give Ihara injectivity and saturation, the `J₀(N)` quotient isogeny, oldform factors and Abel–Jacobi composites for the modular abelian varieties imported from CyclotomicClassGroupsAndStickelberger §4.3, and finite-level Taylor–Wiles freeness".

## R04 (P3) — The description's list of prerequisites by section omits three suppliers and gives one section the README does not cite

**Location:** Pull request description, "Dependencies … Mathematical prerequisites, by section: … ArithmeticGaloisRepresentations (§§6.1, 6.3), …".

**Claim:** The prose list is the README's suppliers with their sections.

**Witness:** README lines 4253, 4263 cite ArithmeticGaloisRepresentations §§2.1–2.2 only. The prose omits CyclotomicClassGroupsAndStickelberger §4.3 (lines 17, 290), JacobianChallengePartII §§1.2–1.4 (line 19, §13.1) and AutomorphicFormsOnReductiveGroups §§5.8, 7.3 (lines 303, 3360).

**Repair:** In that sentence write "ArithmeticGaloisRepresentations (§§2.1–2.2)" and add "CyclotomicClassGroupsAndStickelberger (§4.3: the modular quotient `A_f`, its universal property, the dimension theorem and Tate rank two), JacobianChallengePartII (§§1.2–1.4), AutomorphicFormsOnReductiveGroups (§§5.8, 7.3)".

## Previous findings

- R01 — repaired: line 3 now reads "the `J₀(N)` quotient isogeny, oldform factors and Abel–Jacobi composites for the imported modular abelian varieties"; it agrees with line 17 and the Lean module docstring.
- R02 — repaired: §16.5 names "self-adjoint for the pairing twisted by the Fricke map `w_N` of §9.4 (§13.4) … and §14.5 and §14.13 at level `Γ₀(N)`"; the `*Needs:*` line carries §9.4, §13.4, §14.5, §14.13; all four anchors resolve.
- R03 — repaired: §16.3 states the identification by `q_f` as "this roadmap's own one-line consequence" of A6.5 and A4; "rational Tate exactness" is gone from lines 290 and 4153; line 147 now names §16.3. The names it keeps are R02 of this report.
- R04 — repaired (no change was asked of this folder): at their open heads EllipticCurveModularity cites §§16.2–16.7, §16.3, §16.5, §16.6, §16.7 and AutomorphicGaloisRepresentations §§16.2–16.3, §16.4, in the present numbering.

## Verified sound

| Statement/target | Instances tried | Values computed on each side | Result/change |
| --- | --- | --- | --- |
| §0.2 (reworded) | trivial G; `k[[x]]`, `x↦−x`; `k[[x,y]]`, `−1`, char ≠ 2 | `A^G=A`, image trivial; `k[[x²]]` regular, `rank(1−σ)=1`; `k[[x²,xy,y²]]` singular, `rank(1−σ)=2` | same three hypotheses as before the reword; sound |
| §16.3 identification `V_ℓ(A_f)=V_ℓ(J₁(N))/p_f` | N=11; N=23, trivial character | `p_f=0`, both sides of dimension 2; `dim V_ℓJ₁(23)=24=2·(2+10)`, quotient `2·2=4=2 dim A_f` | follows from A6.5 (complement D, `B_f×D→J` isogeny) and A4.1; sound |
| §16.3 imported rank two | supplier's per-`λ` statement against `ℚ_ℓ⊗K_f` | `ℚ_ℓ⊗K_f=∏_{λ∣ℓ}K_{f,λ}`; rank two on each factor gives free of rank two, dimension `2[K_f:ℚ]` | equivalent; names are R02 |
| §16.5 route on `X₀(N)` | N=11; N=22 old block | `T₀(11)=ℤ`, `dim H¹=2`; `U₂` with characteristic polynomial `X²+2X+2`, `ℚ⊗T₀(22)=ℚ(i)`, `dim H¹=4=2·2` | free of rank two; inputs now named; sound |
| §13.4 as cited by §16.5 | good p on `Γ₀`; `Γ₁` | diamond trivial so `T_p^†=T_p`; `T_p^†=⟨p⟩⁻¹T_p`, twisted pairing self-adjoint | RibetStein lines 2856–2873, 2964, 2988–2994 (printed pp.66, 68–69); sound |
| `congruenceClasses_invariant` (R01) | ψ=0; N=3, q=3; N=3, q=5 | hypothesis and conclusion hold with M=N; `Γ(3)/Γ(9)≅(ℤ/3)³`, every ψ congruence; no congruence character mod 5, invariants `=Hom(SL₂(ℤ),𝔽₅)=0` since 5∤24 | true in each; repair leaves the elaborated type unchanged |

Rows for all other statements stand as in the previous review, of `82d96e2`.

- Gate at this head, run by this review: every counter 0 except `statement-hygiene=1`; `FAIL` (R01). Dependency check: `depcheck: 245 roadmaps, 2225 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on a scratch copy with `#check @name` for the 10 declarations: 7 `declaration uses sorry` warnings, nothing else; the 10 types equal those of the previous round (the diff changes no Lean).
- Source locators checked against the text: 5 (Edixhoven Theorem 1.1.4.1 and Remark 1.1.4.2, lines 169–178, printed p.35; RibetStein Theorem 5.2 and Corollary 5.3, Lemma 5.7, Theorem 5.8, Definition 5.13 and Theorem 5.14 with its proof, lines 3162–3185, printed p.73). Of the seeded sample only §13.4 touches the changed passages (cited by §16.5).
- Cross-roadmap citations resolved in the changed passages: AbelianSchemesAndArithmeticModuli A4.1, A6.5 (`poincareReducibility`), A3.2 (`multiplicationAndDensity`) at its open head; CyclotomicClassGroupsAndStickelberger §4.3 at its open head (R02). None of the 50 resolver leads falls in a changed line.
- Overlap check: read EisensteinIdealAndRationalTorsion, HilbertModularVarietiesAndShimuraCurves, AlgebraicModularFormsAndSerreWeights, ModularCurves, ModularForms, EtaleCohomologyFoundations; nothing shared in the changed passages (the modular quotient is CyclotomicClassGroupsAndStickelberger §4.3's, cited). No overlap fact is listed for this roadmap.
- Files changed outside the folder: none. Title: agrees with the README heading.
- Source independence: changed passages only; 6 passages compared with 2 sources (Edixhoven, RibetStein), none shared (the reworded §0.2 no longer follows Edixhoven lines 169–176 clause by clause); no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- Nothing new. The items of the earlier rounds are untouched by the diff.

## Source issues

- none

## For the human reviewers

- none
