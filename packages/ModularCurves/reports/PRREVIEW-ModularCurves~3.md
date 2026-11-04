# Review of ModularCurves (pull request #1101 at 063c2e1)

**Verdict:** needs changes

Incremental re-review of the 13 lines changed since 37ac678 (README 8C, lines 1882–1891: the homogeneity step of the Axiomatic Isomorphism Theorem, now run on the conjugate algebra arrows rather than credited to Layer 7; `Suggested.lean` unchanged, nothing outside the folder changed). The gate passes every check at this head (`build=0` in the worker's run; my own run of the text scanners and the dependency check: all zero, `depcheck: 209 roadmaps, 1732 edges, 0 problem(s)`, no UPWARD or CYCLE line). `lake env lean` on `TauCetiRoadmap/ModularCurves/Suggested.lean` exits 0 with 49 `declaration uses 'sorry'` warnings and the thirteen `#check` outputs, nothing else. One new finding (P2) on the changed passage; the five P3 findings of the previous report are unrepaired and are carried as R02–R06.

## R01 (P2) — The new homogeneity step uses two unowned inputs: a supersingular closed point exists in the characteristic-`p` fibre of the rigidifier scheme, and the supersingular points are finitely many

Location: `TauCetiRoadmap/ModularCurves/README.md` lines 1884–1888: "every supersingular closed point by (3) and the faithful flatness … hence an open neighbourhood of one such point, hence an ordinary closed point of the characteristic-`p` fibre".

Claim: from (2), (3), (4) and the faithful flatness of the completed strict henselisation, the open isomorphism locus of `Φ` contains every closed point of the rigidifier scheme.

Witness: the chain needs (a) a supersingular closed point of the characteristic-`p` fibre to exist ("one such point"), and (b) that an open neighbourhood of it contains an ordinary closed point, i.e. that the supersingular locus of the one-dimensional fibre has empty interior (it is a finite set). Without (a) the route proves nothing in characteristic `p`: the complement of the isomorphism locus is a closed subset of the characteristic-`p` fibre which, by (4), is a union of the whole ordinary locus or nothing, and only a supersingular point in the fibre rules out the former. Neither statement is a target of this roadmap (every "supersingular" occurrence is at lines 46, 1034, 1621, 1696–1750, 1822, 1863, 1885, 1911, 1915, 2117, 2124, 2587, 2718; none asserts existence or finiteness), neither is in EllipticCurves on main (its Layer 3, lines 716–748, defines the dichotomy and proves the Frobenius-trace criterion, nothing on counts), and neither is a pinned declaration (no `supersingular` in Mathlib or Tau Ceti at the pins beyond `IsSupersingular`-type predicates). The same two facts are the unstated inputs of 7H's proof of the Axiomatic Regularity Theorem through ST-3 (line 1733: "all supersingular characteristic-`p` points or none of them, and all ordinary ones or none" needs an ordinary point in the regular locus, which comes from the same neighbourhood step), so the gap was latent before this change; the changed passage now states the step and must own its inputs.

Computed witnesses: `p = 2`, rigidifier `[Γ(3)]` over `ℤ[1/3]`: the fibre `𝕄(Γ(3)) ⊗ 𝔽̄₂` maps onto the `j`-line with generic degree `|GL₂(𝔽₃)|/2 = 24`; the unique supersingular class is `j = 0` (`y² + y = x³`, automorphism group of order 24), so the fibre has exactly `48/24 = 2` supersingular closed points on a smooth curve: nonempty, finite, empty interior. `p = 3`, rigidifier `[Γ(4)]` over `ℤ[1/2]`: `|GL₂(ℤ/4)| = 96`, unique supersingular class `j = 0 = 1728` (`y² = x³ − x`, automorphism group of order 12): `96/12 = 8` supersingular points on the two components of the fibre. For `p ≥ 5` the number of supersingular `j`-invariants is `⌊p/12⌋ + ε_p` with `ε_p = 0, 1, 1, 2` for `p ≡ 1, 5, 7, 11 (mod 12)`, which is at least `1` for every `p ≥ 5` (`p = 5, 7, 11, 13` give `1, 1, 2, 1`).

Repair: add to 7E a sixth target, say **PD-6, existence and finiteness of supersingular points**: for every prime `p` there is a supersingular elliptic curve over `𝔽̄_p`, and the supersingular `j`-invariants in characteristic `p` form a finite set (Silverman, *The Arithmetic of Elliptic Curves*, Theorem V.4.1(b)–(c): the Legendre curve `E_λ` is supersingular iff `H_p(λ) = 0` for the Hasse polynomial `H_p` of degree `(p−1)/2`, which has distinct roots; `p = 2`: `y² + y = x³`; `p = 3`: `y² = x³ − x`, the curve EllipticCurves line 1556 already uses); then the consequence used: for a representable surjective étale rigidifier `δ` (4C), the supersingular closed points of `𝕄(δ) ⊗ 𝔽_p` form a nonempty finite set, so every open subset of the fibre containing one contains an ordinary closed point. Cite PD-6 at 8C line 1887 ("hence, by PD-6, an ordinary closed point") and in ST-3/7H. Tested on the instance that refuted the route: with PD-6 the `p = 2`, `[Γ(3)]` chain runs: the two supersingular points are in the locus by (3), their neighbourhoods contain ordinary points, and (4) carries the locus to every ordinary point.

## R02 (P3) — Two sorried API theorems, and the carriers around them, are library declarations at main's Tau Ceti pin (previous R01, not repaired)

Location: `TauCetiRoadmap/ModularCurves/Suggested.lean` lines 178–189 (`PointedWeierstrassAtlas.isLocallyWeierstrass`, `nonempty_pointedWeierstrassAtlas_iff`), 133–200; README 251–254, 611–612, 621–622, 780–781. The file is byte-identical to 37ac678.

Witness and repair: as in the previous report. At the pull request's pin `a91d3aaf` none of these exists; at main's pin `358314d4`, `TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/Geom.lean` 94–332 declares the four structures and proves both theorems (274, 285), `GeomBaseChange.lean` 115–140 the base change, `Points.lean` 574 and `FunctionField.lean` 141 the two equivalences. Delete the two sorried theorems now (API lemmas, not headlines); when the manifest moves to main's pin, import the library module and add `baseChange`, `projModelPointsEquiv`, `projModelFunctionFieldEquiv` to §From Tau Ceti.

## R03 (P3) — AlgebraicModuliForArithmeticGeometry §1.3 still builds the finite locally free Plücker immersion (previous R02, not repaired)

Location: README 551–557 and 2697–2700; AlgebraicModuliForArithmeticGeometry at its open head (#853), §1.3 lines 655–668 ("For finite locally free E, chart coordinates are signed maximal minors and the image is defined scheme-theoretically by Plücker relations … proved here by the chart argument below", with the same `((1,0,a,b),(0,1,c,d)) ↦ (1,c,d,−a,−b,ad−bc)` Check as README 569–574), and `rankOneGrassmannComparison` at 356.

Witness: unchanged on both sides since the previous review: two planned owners of the finite-locally-free Plücker immersion and of `Gr_1(E) ≅ P(E)`.

Repair: none in this folder; the matching edit (import both from ModularCurves 0G, keep the coherent extension) belongs to AlgebraicModuliForArithmeticGeometry. Recorded so the human approver sees the open two-owner state.

## R04 (P3) — Unused hypotheses (previous R03, not repaired)

`TauCetiRoadmap/ModularCurves/Suggested.lean` line 699 `[F.IsComm]` in `formalGroup_p_eq_zero_of_pow_mem_span` (the degree-`pⁿ` comparison uses only `F(X,Y) = X + Y + (degree ≥ 2)`); line 812 `[Module.Flat D M]` in `ker_baseChange_of_noZeroSMulDivisors_coker` (`Tor₁(C, R) = Tor₁(I, R) = 0` for the torsion-free cokernel and image over the PID suffices); line 852 `[IsAlgClosed K]` in `irreducibleSpace_of_connectedSpace` (smooth over any field gives normal, hence irreducible when connected). Drop them or keep each as the intended scope; harmless either way.

## R05 (P3) — Residual process wording (previous R04, not repaired)

README 2767 "The current AINTLIB modular-curves development" ("current"); 2800–2808 the listing of files of an external repository (`.mathlib-quality/plan.md`, `decomposition-*.md`, …); 127–128 and 141–142 (Convention 1) "the shape the AINTLIB development states it in" and "AINTLIB's spelling quantifies over `S.affineOpens` directly". Delete or shorten to one sentence naming the repository; nothing mathematical depends on them.

## R06 (P3) — The 5C external contract should name its prospective owner (previous R05, not repaired)

README 1561–1567 ("No roadmap in this repository owns these statements … a GAGA-style development that no roadmap has adopted"): accurate on main, but the open roadmap ComplexComparison (analytification of every finite-type complex scheme) is such a development. Add one clause naming ComplexComparison as the roadmap in whose direction the algebraic-versus-analytic connectedness statement lies; keep the three hypotheses, no `*Needs:*` edge.

## Previous findings

- R01 — not repaired: `Suggested.lean` is unchanged; lines 178–189 still declare `PointedWeierstrassAtlas.isLocallyWeierstrass` and `nonempty_pointedWeierstrassAtlas_iff` with `sorry`. Re-raised as R02.
- R02 — not repaired: AlgebraicModuliForArithmeticGeometry #853 §1.3 lines 655–668 still construct the Plücker immersion for finite locally free `E`; README 551–557 unchanged. Re-raised as R03.
- R03 — not repaired: lines 699, 812, 852 unchanged (`[F.IsComm]`, `[Module.Flat D M]`, `[IsAlgClosed K]`). Re-raised as R04.
- R04 — not repaired: README 141 "AINTLIB's spelling quantifies over `S.affineOpens`", 2767 "The current AINTLIB modular-curves development", 2800 "`.mathlib-quality/plan.md` and the `decomposition-*.md` files". Re-raised as R05.
- R05 — not repaired: README 1561–1567 unchanged, no mention of ComplexComparison anywhere in the README. Re-raised as R06.

## Verified sound

**Gate and tools.** The worker's gate at 063c2e1: every check passes including `build=0`. My run of the gate's text scanners at this head: `set_option=0 … source-material=0 OK`, exit 0. Dependency check: `depcheck: 209 roadmaps, 1732 edges, 0 problem(s)`, no UPWARD or CYCLE line; ModularCurves is on main and is placed after its last supplier. Elaboration: `lake env lean` on `Suggested.lean` exits 0, 49 sorry warnings, 13 `#check` outputs (the file has 13 `#check` lines), no error. `git diff --stat 37ac6784..HEAD` is the single README hunk of 10 insertions and 3 deletions; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ModularCurves'` is empty. Folder contents: `README.md`, `Suggested.lean`, `PROGRESS.md`, `STATUS.md`, `metadata.toml`.

**The changed passage, step by step (README 1882–1891).**
- "The homogeneity argument of 7F (ST-3) on the conjugate arrows … with the same inputs ST-1, ST-2 and PD-5": consistent with ST-3 (line 1729–1733), which is stated for the schemes `𝒫_{E/W(k)[[T]]}`; running it on the arrow is exactly what hypothesis (4) (lines 1866–1874) licenses, and the passage correctly says that objectwise Reg. 3 would not. For the ordinary case only ST-1 and PD-5 are used (as the parenthesis at 1889 says); ST-2 is stated for supersingular `E₀` only and is not needed there.
- "every closed point of residue characteristic different from `p` by (2)": (2) is an isomorphism over `Ell ⊗ ℤ[1/p]`, and the isomorphism locus is open because the kernel and cokernel of a map of coherent algebras have closed support (owned by 4D, line 1348: "the coherent kernel/cokernel support argument used in the homogeneity theorem").
- "every supersingular closed point by (3) and the faithful flatness of the completed strict henselisation over the local ring": the completed strict henselisation of the rigidifier scheme at a closed point `x` with residue field `𝔽_q` has residue field `𝔽̄_q`, is identified by 7B/7D with `W(𝔽̄_q)[[T]]` carrying the universal deformation, so `(𝒫_i)_𝔈` is the base change of `𝒫_i` along `𝒪_{M,x} → Ô^{sh}_{M,x}`; `R → R^{sh}` is flat as a filtered colimit of étale `R`-algebras (4D's colimit description, Tag 04GW), `R^{sh} → (R^{sh})^∧` is flat (4D, Tag 06LJ clause (c), line 1407), both are local, hence faithfully flat; a coherent kernel vanishes at `x` iff it vanishes after this base change. 4D does not name the flatness of `R → R^{sh}` as a separate statement, but it follows from the colimit it owns; no change needed.
- "hence an open neighbourhood of one such point, hence an ordinary closed point": R01.
- "by (4) applied to the universal formal deformations of two ordinary curves": for ordinary `E_x, E_y` over `k = 𝔽̄_p`, PD-5 gives `E_x[p^∞] ≅ μ_{p^∞} × ℚ_p/ℤ_p ≅ E_y[p^∞]`, ST-1 identifies the deformation functors of `E_x`, `E_y` with that of this `p`-divisible group, hence the universal deformation rings and the `p`-divisible groups of the universal curves over `W(k)[[T]]` (an isomorphism of `p`-divisible groups over the complete local ring is a compatible system of isomorphisms of finite flat group schemes, determined by its artinian truncations); (4) with `S = Spec W(k)[[T]]` conjugates `Φ_{𝔈_x}` to `Φ_{𝔈_y}`, so `x` is in the locus iff `y` is, in both directions since `ξ` is invertible.
- "an open set containing every closed point of a scheme of finite type over `ℤ` is the whole scheme": `ℤ` is a Jacobson ring and `LocallyOfFiniteType.jacobsonSpace` (Mathlib `AlgebraicGeometry/Morphisms/FiniteType.lean` line 110 at the pin, with the `Spec`-of-a-Jacobson-ring instances at 105–108) makes the rigidifier scheme a Jacobson space, in which a nonempty closed subset contains a closed point. Pinned; the README may cite it but need not.

**The untouched sampled targets.** *Consumers* (0A, 349–357), *Strict henselisation* (1356–1427), *Geometric irreducibility, conditionally* (1535–1548), *Geometric connectedness remains an explicit external hypothesis* (1550–1570), *Smoothness of finite quotients* (2174–2187), *The class quantified over, fixed once* (2310–2324), *No declaration of this layer is in `Suggested.lean`* (2529–2532): outside the diff, unchanged since 37ac678, and verified in the previous report (its Seeded sample, with the Stacks locators 04GP, 04GQ, 04GF, 08HQ, 04GT, 04GU, 04GW, 06LJ, 07NV, 07NY read at the cache). *The two moduli problems compared*, *The rings of §6.3*, *The proof, as separate named lemmas* (1893–1956) are unchanged in text and follow the changed step; their KM locators remain unverifiable (below) and their mathematics is the recomputed rows 8C.4–8C.9 carried in the table.

**Binder check.** `Suggested.lean` is unchanged since the previous report, whose `#check @name` pass over all declarations found every README binder present; the worker's elaborated signatures (`signatures.md`, 106 entries) flag `IsPointedNeighbourhood` and `Neighbourhood` as having dropped `IsLocalRing R`, which is correct because their types do not mention it. Nothing changed.

**One-tactic probe.** Not repeated: no sorried declaration changed since the previous report, where all 49 failed `first | rfl | infer_instance | assumption | simp | (exact ⟨⟩) | decide`.

**Adversarial table.** Rows for the changed statement carry computed values; the untouched rows are those of the previous report (cited as "r2"), whose statements the diff leaves as they were.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 8C homogeneity chain, existence and density of supersingular points | `p = 2`, `[Γ(3)]/ℤ[1/3]`; `p = 3`, `[Γ(4)]/ℤ[1/2]`; `p = 5, 7, 11, 13` | `48/24 = 2` supersingular points on the fibre over `𝔽̄₂`, finite with empty interior on a smooth curve; `96/12 = 8` on the two components over `𝔽̄₃`; counts `⌊p/12⌋ + ε_p = 1, 1, 2, 1` | true but unowned | R01 |
| 8C Jacobson step | `Spec ℤ_(p)` (not finite type over `ℤ`); `𝔸¹_{𝔽_p}` | the open `{generic point}` of `Spec ℤ_(p)` contains no closed point and is not everything, so the finite-type hypothesis is needed; in `𝔸¹_{𝔽_p}` every nonempty open contains a closed point | hypothesis needed and present; pinned at `FiniteType.lean` 110 | none |
| 8C faithful-flatness step | `R = ℤ_(p)`; `R = 𝔽_p` | `R^{sh}` a DVR with residue field `𝔽̄_p`, completion `W(𝔽̄_p)`, both local and flat over `R`, hence faithfully flat; for `R = 𝔽_p`, `R^{sh} = 𝔽̄_p = (R^{sh})^∧`, faithfully flat | true | none |
| 8C hypothesis (4), non-canonicity | `E = E'`, `ξ = id`; `E = E'`, `ξ = [−1]` on `E[p^∞]` | `c_i = id` works; `c₁ : (P,G,Q) ↦ (−P,G,−Q)`, `c₂ : (P,G,Q) ↦ (−P,G,−Q)` with `Q ∈ Gˣ`, square commutes, and `c_i ≠ id` when `p` odd | comparisons exist, need not be identities: "not unique or canonical" correct | none |
| 8C ordinary transport, direction | `x, y` ordinary, `ξ` and `ξ⁻¹` | `ker(Φ_{𝔈_x}) ⊗ 1 = 0 ⟺ ker(Φ_{𝔈_y}) = 0` via `c₂ ∘ Φ_{𝔈_x} = Φ_{𝔈_y} ∘ c₁` with `c_i` isomorphisms | symmetric, as needed | none |
| 8C.4 surjectivity `A₂ → A₁` | r2 row | `K ⊆ J` | consistent | none |
| 8C.6 determinant | r2 row | `det(Q·) = ±∏[b](P) = ±P^{φ}·unit ≠ 0` | as stated | none |
| 8C.7 snake lemma | r2 row | `0 → Ker/QKer → A₂/QA₂ → A₁/QA₁ → 0` | as stated | none |
| 8C.8 coefficient | r2 row | `e_φ = P^{φ}·unit`, `h̲ ⊆ K̲`, `K̲ ⊆ h̲` | as stated | none |
| 8C.9 units | r2 row | `(a,p) = 1`: unit; `p ∣ a`: in `𝔪_A` | as stated | none |
| `mulBy_eq_one_of_finrank` (0B) | r2 row | `n = 0, 1`, `μ₂/𝔽₂`, `α_p` | true | none |
| `finrank_mulBy`, `finrank_torsion` (2A) | r2 row | `N = 1`; `N = p` in char `p`: `p²` | true | none |
| `etale_torsion_of_isUnit` | r2 row | `p` not a unit over `𝔽_p`; `2` a unit over `ℤ[1/2]` | hypothesis needed | none |
| `isGroupHom_of_mapsZero` (2D) | r2 row | `[−1]`; `t_P` excluded | true | none |
| `IsRigid` (4A) | r2 row | rigid iff `N ≥ 3` | matches 2F, 5C | none |
| `exists_representedBy_of_isRigid` (4C) | r2 row | naive `[Γ(2)]` coarse only | consistent | none |
| `IsRegularOfDimTwo` (4D) | r2 row | `𝒫 = ∅` excluded; `[Γ(1)]` regular of dimension 2 | correct | none |
| `formalGroup_p_eq_zero_of_pow_mem_span` (7G) | r2 row | `n = 0` needs `hn`; `p = 2`, `ℤ/4` versus `𝔽₂` | true, `[F.IsComm]` unused | R04 |
| `IsSupersingular` (7E) | r2 row | ordinary/supersingular/char `≠ p` | correct dichotomy | none |
| `g1`, `g3`, `axiomaticRegularityOfQuotients` degree (9C) | r2 rows | `T = ∅`; `H = 1`; `φ(N)` | correct | none |
| `ker_baseChange_of_noZeroSMulDivisors_coker` (9E) | r2 row | `f = 2 : ℤ → ℤ`, `R = 𝔽₂` | hypothesis needed, `[Module.Flat D M]` unused | R04 |
| `smoothOfRelativeDimension_one_of_isCategoricalQuotient` (9D) | r2 row | `𝔸¹_ℤ/±1`; `W[[x]]`, `x ↦ ζ_p x` | true | none |
| `irreducibleSpace_of_connectedSpace` (5C) | r2 row | `Spec k ⊔ Spec k`; `𝔸¹_k` | true, `[IsAlgClosed K]` unused | R04 |
| `existsUnique_lift`, `existsUnique_algHom_of_etale` (4D) | r2 rows | `r ∈ 𝔪_R`; `A = R` | true | none |
| `torsionInclusion`, `PDivisibleGroupIso`, `mulBy_mul` | r2 rows | `m = n`, `m = 1`, level `0` | consistent | none |
| 0G charts, `Grass_0`/`Grass_n`, Plücker | r2 rows | `y = x⁻¹`; `(1,c,d,−a,−b,ad−bc)` | Checks correct | none |
| 8D degree | r2 row | `N = p`: `p + 1`; `N = 6`: `12` | agree | none |
| L10.1–L10.3 (Mazur) | r2 rows | `N = 11, 13, 37`: `[G:H] = 5, 1, 3` | as stated | none |
| 9E Legendre identity, field degree | r2 rows | `d(jd − 2⁸(d²+3d+3)) = 2⁸`; `24` | as stated | none |
| Convention 5, 0B `ℤ ⋉ V`, 9A(3)–(4) | r2 rows | right action; `V ⊕ V`; `𝔽₂[x²]` | as stated | none |

**Library declarations opened at the pins.** Mathlib `6b7abb3c`: `AlgebraicGeometry/Morphisms/FiniteType.lean` 105–125 (`JacobsonSpace (Spec R)` for `IsJacobsonRing R`, `LocallyOfFiniteType.jacobsonSpace`); `RingTheory/Jacobson/Ring.lean` 60, 102, 116, 422, 576 (`IsJacobsonRing`, quotients, polynomial rings). Tau Ceti `a91d3aaf`: unchanged from the previous report (the `Scheme/` directory still has only `Integral`, `ProjModel`, `Smooth`; R02).

**Cross-roadmap citations resolved.** AlgebraicModuliForArithmeticGeometry at its open head #853: lines 249–256 (defers the Grassmannian scheme construction to ModularCurves §0G), 356, 602–670 (still builds the finite-locally-free Plücker immersion: R03). EllipticCurves on main: 716–748 (ordinary/supersingular dichotomy, no count or existence statement), 1556 (`y² = x³ − x` over `𝔽₃` supersingular). The new passage adds no cross-roadmap citation; its internal references 7F (ST-1, ST-2, ST-3), 7E (PD-5), 4D, 7B, 7D all exist at the lines named above. Ownership of the supersingular count was searched with the roadmaps tool (`finitely many supersingular`, `number of supersingular`, `supersingular j-invariant`): only consumers mention it (ModularCurvesPartII 3152, PadicDifferentialEquationsAndRigidCohomology 6779), neither a supplier of this roadmap. Ownership against open pull requests not reachable by the tool was not checked.

## Not verifiable

- Katz–Mazur, *Arithmetic Moduli of Elliptic Curves* (`km85`): no legal text in the cache or online; the locators of the changed passage's neighbours (KM 6.1, p. 155; 6.3.2, pp. 157–158; 6.3.3–6.3.6, pp. 159–162; 6.2.1; 5.2.1, pp. 132–134) are cited by locator only, and the mathematics was recomputed in the table instead. Whether KM's own proof of 6.2.1 states the supersingular existence/finiteness input explicitly could not be checked.
- Silverman, *The Arithmetic of Elliptic Curves*, Theorem V.4.1 (named in R01's repair): no legal text; the clause numbering is from memory and should be checked by the author when the locator is written.

## Source issues

- none
