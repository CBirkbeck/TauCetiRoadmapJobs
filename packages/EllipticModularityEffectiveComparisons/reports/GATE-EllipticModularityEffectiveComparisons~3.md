# GATE-EllipticModularityEffectiveComparisons~3: answers to the human review of `2a7d458`

The review (CBirkbeck, 2026-11-07T04:41:28Z) has two numbered findings, F01 and F02, and a list of
previous findings. F01 makes two distinct points: the duplication of EllipticCurveModularityPartII
with the human choice it forces (H01), and the conditional edit of `README.md` line 1689 (H02). F02
is H03. In the previous-findings list, r2 R01 is F01 again (answered under H01), and r1 R02 records
a repair that was re-checked (H04). The copy of the review supplied to this job is cut off inside
the "Sampled locators" paragraph of its verification record; the visible part makes no further
request and contains no instruction addressed to the worker.

One commit: `951c22c` "EllipticModularityEffectiveComparisons: review repairs (J₀(p)♯ imported from
AnabelianGeometryAndNonabelianChabauty §1.7 generalized Jacobian of a reduced boundary)",
`README.md` only, 11 insertions and 5 deletions. `Suggested.lean` is unchanged.

## H01 (CBirkbeck) — answered

The duplication still holds at the sibling's current head, which has moved from `d2cbd93` (read by the review) to `ad7b092`. It cannot be repaired inside this folder. The move from `d2cbd93` to `ad7b092` changes only its `README.md` (41 insertions, 24 deletions); its `Suggested.lean` is the same. With comments stripped, the `localTerms`/`martinValue`/`newDimension` blocks (this folder's lines 49–85, its lines 61–100) differ only in the theorem names `martin_dimension_formula`/`martin_sharp_bound` versus `dimension_comparison`/`martin_bound`. `NonCM`/`HasCyclicIsogeny` (its lines 141–153) have the bodies of `GeometricallyNonCM`/`CyclicIsogenyDegree`, and `lemos_surjectivity` (its line 251) is `lemos_uniform_surjectivity` (line 265).

The change at `ad7b092` widens the overlap. Its §6.0f now owns the minimal period subvariety and "the explicit Gaudron–Rémond period estimates on its route". In this folder, §5.3a asks ArakelovGeometryAndAbelianHeights for those same estimates (gap:quantitative-abelian-periods).

Merge order: EllipticCurveModularityPartII is at line 187, ErdosProgressionPowers at 188 and this folder at 270. Four open roadmaps now name EllipticCurveModularityPartII as owner, against two in the review:
- ErdosProgressionPowers (head `0a5da24`), lines 76, 574, 918, 934, 1025, 1037, 1049, 1073, 1085, 1107, 1187, 1196, 1304 and 2216;
- AdelicImagesAndModularCurves, line 98;
- EllipticCurvePeriodsAndModularParametrizations, lines 92, 299, 1838, 1888 and 1892 (its §§5.0a–5.0b);
- FaltingsFinitenessAndIsogenyTheoremsPartII, line 13 (its §6.0f).

No roadmap names this folder as a supplier. The only other mentions are prose lists: ModularSymbolsPadicLFunctions line 2695, FaltingsFinitenessAndIsogenyTheorems line 2928, and EllipticCurveModularityPartII line 1057.

The only in-folder fix the planning rules allow is to import Layers 0–5 by section. That would leave the folder no target of its own, so the choice remains the one the review states: close this roadmap, or close the sibling and re-point four consumers.

## H02 (CBirkbeck) — answered

Not applied, because its condition ("if this folder is kept") is still undecided. While both pull requests are open, line 1689 is accurate: ErdosProgressionPowers line 76 says EC.0–EC.5 are "owned by EllipticCurveModularityPartII Layers 1–6". Deleting only that sentence would leave the paragraph presenting ErdosProgressionPowers, at merge-order line 188, as a consumer of this folder at line 270, which is an upward edge. If the folder is kept, the whole Downstream consumers paragraph has to be rewritten at the same time as the consumers are re-pointed and the merge order is changed.

## H03 (CBirkbeck) — applied differently

`README.md` §5.4a (line 1298) no longer constructs the generalized Jacobian. "Define J₀(p)♯ as the generalized Jacobian … The general smooth-curve generalized Jacobian with a reduced rational modulus is constructed here for this curve" → "Let J₀(p)♯ be the generalized Jacobian `J_D=Pic⁰(C,D)` of AnabelianGeometryAndNonabelianChabauty §1.7 (Generalized Jacobian of a reduced boundary) for … C=X₀(p) over ℚ and … D=(0)+(∞)". The extension by `T_D=(𝔾_m×𝔾_m)/𝔾_m` and base change are now imported. The following stay targets here: the Hecke action (with the reason: T_n and its transpose carry cusps to cusp-supported divisors), w_p=−T_p with its toric computation, I♯_e, J♯_e, the Néron lft-model arguments and the cotangent identification at p.

The supplier is the review's: AnabelianGeometryAndNonabelianChabauty (open head `227f000`, merge-order line 165 < 270), section "Generalized Jacobian of a reduced boundary", a `####` target inside its §1.7 "Fields and the projective line". It covers smooth proper geometrically connected C over a characteristic-zero field and nonempty reduced finite étale D. X₀(p)/ℚ with its two distinct rational cusps is an instance.

The suggested repair is not followed in one place: the "Filtered de Rham comparison for the generalized Jacobian" is not cited for the identification with 𝔽_(p²)^S. That section is characteristic-zero, and its p-adic part needs "C extends to a smooth proper model and D to a reduced finite étale relative divisor". For p>11, p≠13, X₀(p) has positive genus and J₀(p) has purely toric reduction at p (for example J₀(17) is the curve 17a, of conductor 17). So X₀(p) has no smooth proper model over ℤ_p, and the cotangent space of the special fibre at p stays a target here, as the review's own keep-list says.

The other edits:
- Line 9 (Scope and ownership): adds the ownership sentence.
- Lines 84–86: new supplier contract `### From TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty`, which states the consumed hypotheses and why the Hecke action and the cotangent identification at p are not covered.
- §5.4a: the *Needs:* line (line 1321) gains the §1.7 citation.
- Layer 5 Dependencies (line 1691): gains §1.7.
- §5.4a gains two Checks (lines 1311–1312). The first pins the toric coordinate f(0)/f(∞) against the supplier's Abel map z↦z. The second fixes the toric Hecke exponents ℓ+1 (ℓ≠p) and 1 (T_p) in both the pushforward and the transpose convention.

The same pattern was searched by object for the other Layer 5 constructions (projective inertia, Runge inequality, winding quotient, Heegner–Gross vectors, Gaudron–Rémond estimates, Néron lft-models). Apart from the EllipticCurveModularityPartII overlap of H01, it found no earlier owner. "Runge" hits are Runge's approximation theorem. ArithmeticGaloisRepresentations' projective-inertia passage is the bad-dihedral criterion. ReductiveGroupsPartII owns lft Néron models of tori only.

## H04 (CBirkbeck) — answered

The r1 R02 repair still holds after this commit, which changes no `gap:` token. `README.md` has 53 tokens:
- 8 `What … must provide (gap:…)` headers;
- 45 references, 18 of them in *Needs:* lines.

Per slug: optimized-elliptic-weight-two 9, weight-two-local-reduction 4, mixed-cusp-charts 5, chen-winding-comparison 3, positive-characteristic-support 4, all-embedding-frobenius 2, modular-rank-zero 22, quantitative-abelian-periods 4. The review's per-slug counts are the same, but they sum to 53, not the "46 occurrences" it states.

## Build, gate and dependency check

- `lake build TauCetiRoadmap.EllipticModularityEffectiveComparisons.Suggested`: "Build completed
  successfully (9205 jobs)". The only warnings are the 14 "declaration uses `sorry`", at lines 79, 84,
  93, 104, 118, 135, 182, 188, 194, 201, 238, 246, 256 and 265.
- Gate at `951c22c`: `gate EllipticModularityEffectiveComparisons: set_option=0 blob=0 latex=0 tex=0
  prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0
  no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0
  empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0
  stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (exit 0).
- `--depcheck --movable`: `depcheck: 239 roadmaps, 2361 edges, 0 problem(s)`. There is no UPWARD,
  CYCLE or `moved:` line. The new edge, to AnabelianGeometryAndNonabelianChabauty, goes from line 270
  to line 165.
- `roadmaps resolve` on `README.md`: no cross-roadmap citation and no Lean name found nowhere.

## Lean signatures

`Suggested.lean` is byte-identical to `5778fc4`: `git diff 5778fc4 HEAD` on it is empty. It has 24
declarations, and no `variable`, `include` or `set_option` line, so no section binder can be dropped.
No `#check @name` scratch file was elaborated this round, because the Lean commands this job may run
are the module build only. The review's own `#check` elaboration of all 24 declarations at
`2a7d458` therefore applies to identical bytes. No Lean statement changed.

## Ownership, citations and sources

- Ownership was checked by object over main (`eaf17b1`) and the 466 open heads (index of
  2026-11-07T07:34:53Z), for the generalized Jacobian and the Layer 5 objects listed under H03.
- The new citation was read at the open head of AnabelianGeometryAndNonabelianChabauty:
  - "Generalized Jacobian of a reduced boundary", README line 4004, inside §1.7 (line 3988);
  - "Filtered de Rham comparison for the generalized Jacobian", line 4523, inside §2.0 (line 4479).
- No supplier of a later merge-order position is named, and no notion moved down.
- No source was added. The locator of §5.4a (bilu-parent-rebolledo lines 731–833) was re-read: line
  757 names J₀(p)♯ the generalized Jacobian of X₀(p) with respect to the cusps, and lines 775–781 put
  the 𝔽_p^S identification on the fibre at p. `needs-references.toml` was not written.

## Adversarial pass

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §5.4a: X₀(p) with D=(0)+(∞) is an instance of the supplier's pair | p=17; one-point D; conjugate pair D | g(X₀(17))=1, r=deg D=2, so dim J_D=g+r−1=2 and the torus has rank r−1=1, matching the existing Check "J₀(17)♯ has dimension two". Both cusps are ℚ-points, so Res_(D/ℚ)𝔾_m=𝔾_m², and the torus is 𝔾_m²/𝔾_m=𝔾_m, split. With one point, r−1=0 and J_D=J_C, so the toric direction is lost; a conjugate pair would give a nonsplit torus, which does not occur here | instance holds | construction replaced by citation |
| Toric coordinate f(0)/f(∞) | (ℙ¹,(0)+(∞)), x=2; f scaled by 3; f≡1 on D | f=(z−2)/(z−1): f(0)=(−2)/(−1)=2, f(∞)=1, coordinate 2=x, the supplier's Abel map z↦z; the reciprocal convention gives 1/2. 3f gives 6/3=2; f≡1 gives 1/1=1 | well defined, direction agrees with the supplier | Check added |
| Hecke action on the torus, and w_p=−T_p there | p=17; ℓ=2; T_p and its transpose; w_p | T_2: (0)↦3(0), (∞)↦3(∞), exponent 3. T_17: (0)↦(0)+16(∞), (∞)↦17(∞), exponent 1−0=1; transpose w T_17 w: (0)↦17(0), (∞)↦(∞)+16(0), exponent 17−16=1. w_17: exponent −1=−(1) | w_p=−T_p on the torus in both conventions | Check added |
| Toric character is not cuspidal | p=17, ℓ=2; general ℓ | 17a1 over 𝔽₂: y²=x³+x²+x+xy+y has 4 points (x=0: 2, x=1: 1, ∞), so a₂=2+1−4=−1≠3. In general \|a_ℓ\|≤2√ℓ<ℓ+1 (2√2≈2.83<3) | distinct for every ℓ≠p | Check added |
| Contract: no smooth proper model of X₀(p) over ℤ_p for p>11, p≠13 | p=17, 19, 23; p=13; p=11 | X₀(p) has genus 0 exactly for p∈{2,3,5,7,13}, so g≥1 for p≥17; J₀(17)=17a has conductor 17, hence bad reduction. X₀(13)≅ℙ¹ does have the model ℙ¹ over ℤ_13, which is why p≠13 is stated. p=11 lies outside "p>11" | holds on the stated range | sentence scoped to p>11, p≠13 |
| Kept target: cotangent of the fibre at p ≅ 𝔽_(p²)^S has the dimension of J₀(p)♯ | p=17; p=37 | p=17: S={0,8}, \|S\|=2=g+1=dim J₀(17)♯. p=37: S={8,3±10t}, \|S\|=3, g(X₀(37))=2, dim=3 | consistent with the imported dimension g+r−1 | none |
| Supplier's p-adic de Rham section for the 𝔽_(p²)^S identification (the review's suggestion) | p=17 | Its hypothesis "smooth proper model and reduced finite étale relative boundary" fails, because J₀(17) has multiplicative reduction at 17 | not applicable at p | not cited |
| H01: identical Lean blocks at the sibling's new head | `localTerms`, `martinValue`, `newDimension` with comments stripped; `NonCM`, `HasCyclicIsogeny` | diff shows only the two theorem names; the bodies of `NonCM`/`GeometricallyNonCM` and `HasCyclicIsogeny`/`CyclicIsogenyDegree` coincide line for line | duplicate confirmed at `ad7b092` | none |
| H04: gap tokens | every `gap:` in `README.md` after the commit | 9+4+5+3+4+2+22+4=53=8 headers+45 references; 18 in *Needs:* lines | unchanged by the commit | none |
