# Repair report: ProetaleCohomologyOfPAdicCurvesAndTowers, package round 3

Review settled: `reports/REV-PKG-ProetaleCohomologyOfPAdicCurvesAndTowers~2.md` (20 findings, R01–R20). Files changed: `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md`, `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/Suggested.lean` (two docstrings only), and the `needs` string of the existing gap `formal-syntomic-period-comparison` in `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/design/plan.json` (one line; no other change there). `metadata.toml` and `sources.toml` are unchanged: every locator added cites a work already in the manifest (CDN-CURVES, CDN-STEIN, CDN20, CDN23, CDN-DUKE). No source was fetched and no missing reference was requested.

## R01 (P1) — applied

Verified: CDN-CURVES line 4432 prints `λ₁ + p^{deg g₁}λ₂`, line 4437 gives `Ng = p^{deg g}gN`; with `ρ(λ) = exp(λN)` the printed law forces `gNg⁻¹ = p^{deg g}N`, the relation forces `p^{−deg g}`. Conventions: law `→ λ₁ + p^{−deg g₁}λ₂`, plus the `exp(λN)` equivalence, the source misprint, and the witness `Φ = diag(1,q)`, `Ne₁ = e₀`: `ΦNΦ⁻¹ = q⁻¹N`. §4.4 Check adds the Tate module `diag(q⁻¹,1)`, `Ne₁ = µe₀`. Relation `Ng = p^{deg g}gN` and the §4.5 Check (`χ_ℓ(Φ)⁻¹ = q`) left as they were.

## R02 (P1) — applied

Verified: CDN-STEIN line 1936 identifies `Sp_J(Λ)^*` with `lim LC(X_{n,J},Λ)^*`, the dual of `LC(X_J)`. §0.3: `Sp_J(L)^*` → annihilator of the relations in `LC(X_J,L)^*` `= lim_n V_n^*`, `V_n = image(LC(X_{n,J},L) → Sp_J(L))`, nuclear Fréchet conclusion kept. New Check: `δ_a(1) = 1` does not descend, `δ_a − δ_b` does; for `J = Δ` both give `L`.

## R03 (P2) — applied

Verified at the head of EndoscopicTransferAndUnitaryTraceComparison §12.4: levels `M_Dr,m` are `ϖ_E^m`-levels with deck group `O_D^×/(1+ϖ_E^mO_D)`, whereas CDN23 lines 181–197 use `Ǧ_n = 1+m_D^n`. Layer 7 conventions now define `M_n` by `ϖ_D`-levels with the dictionary `M_{2m} = M_Dr,m`, `M_{2m−1} = M_Dr,m/(Ǧ_{2m−1}/Ǧ_{2m})`, plus the witness `q = 2`: orders `12` and `3`, quotient by order `4`. §12.19 already uses CDN23 indexing.

## R04 (P2) — applied

Verified: PadicHodgeTheory §5.4 (at its head) defines rank-two supercuspidal as absolutely irreducible and has a nonsplit-coefficient Check. Layer 7 definition: "`WD(M)` irreducible" → "absolutely irreducible", with `End = L` by Schur. Negative control added: `φe₁ = e₂`, `φe₂ = pe₁`, slopes `1/2`, `End = ℚ_p(√p)`. The same change is made in the §7.4 statement, route and slope-`3/2` Check.

## R05 (P1) — applied

Verified: `M^ϖ_{0,C} = Ω ⊔ Ω`, `f = (0,1)`: nonzero modulo diagonal `C`, `df = 0`, `exp f = 0`. §4.2 gains a product form for countable disjoint unions with `H⁰_dR(Y) = ∏ C` in place of `C`, which extends to §§4.3–4.6 (Weil–Deligne representations induced from component stabilizers). The disjoint-annuli Check now invokes it, and a `(0,1)` Check is added. §7.3: product form, "non-constant" → "not locally constant", componentwise CDN20 Remarque A.2. Same pattern repaired in §7.4 (§4.6 applied to `M_n^ϖ`, which is over `F` with finitely many components) and in the §7.5 route.

## R06 (P2) — applied

Verified: `(C̆, σ)` and `(C̆, pσ)` have the same de Rham space; `X¹_st` is `(B_cris^+)^{φ=p}`, resp. `ℚ_p`. The uniqueness Check in §4.2 is replaced by this negative Check. §4.3 now states the comparison with CstConjectureForDaggerVarieties §1.5 as a target. The hypothesis is a semistable model over a finite extension of `K`. The route goes through CohomologyComparisons §4.9a (agreement with the log rigid model complex, compatible with `φ`, `N`, `ι_HK`) and the symbol-compatible middle maps. The same pattern is repaired in §4.7 (comparison with CohomologyComparisons §4.11), in the §5.5 Check and in the Scope paragraph.

## R07 (P1) — applied

Verified: in `A_inf`, `p ∤ [p^♭]` (reduce mod `p`) and `[p^♭] ∤ p` (`θ_0`). §2.1: "complete valuation ring" is replaced by the class of CDN-CURVES §0.4.2: local `O_C̆`-algebras that are `I`-adically complete for a finitely generated `I ∋ p`. The topologies are explicit: `(p)` for `O_C̆, O_C, A_cris`; `(p,[p^♭]) = θ⁻¹(pO_C)` for `A_inf`, a thickening in the sense of §3.2.1. Checks added for divisibility and for `Σ[p^♭]^kT^{−k}`. §2.3 now refers its base `R` to §2.1.

## R08 (P3) — applied

Verified: over algebraically closed `C`, `E[p^∞] ≅ (ℚ_p/ℤ_p)²` extends over `O_C` as the constant étale group. §4.8 Check: "does not extend to `O_C`" is replaced by the correct statement. The generic group extends, but not as the `p`-divisible group of an abelian scheme. The torus gives `μ_{p^∞}`, of height one against two, and the Dimensions `(1,1)` and `(1,2)` are kept.

## R09 (P2) — applied

Verified: FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.25 defines `G̃` on `Nilp_R`, and §R07.2.26 needs a nilpotent kernel. §4.8 defines `G̃(O_C) = lim_m G̃(O_C/p^m)`. Each `O_C/p^m → O_C/p` has nilpotent kernel and `p` nilpotent, so §R07.2.26 makes the transitions isomorphisms. Limits commute, giving `lim_{×p} G(O_C)`, and the route uses that object. A Check records that `O_C ∉ Nilp` and covers `O_C/p²` and `O_C/p³`.

## R10 (P2) — applied

Verified: AbelianSchemesAndArithmeticModuli §A4.CR.7.2 makes `D` contravariant (`D(μ_{p^∞})`: `F = pσ`), and §A4.2 has `Lie E` dual to it. FFG §R07.2.20/§R07.2.28 use the covariant module with `φ = p⁻¹F`. §4.9 now separates `D_contra = H¹_cris`, `D_raw = D_contra^∨(−1)` and `D_norm = D_contra^∨` with `φ = p⁻¹F`, and states the logarithm comparison as a target. Its route maps compatible `A_cris`-lifts to bounded `B_dR^+`-lifts and uses lift-independence, not equality of lifts. The `μ_{p^∞}` Check also rejects raw `F` with `φ = 1`.

## R11 (P2) — applied

Verified: CDN-DUKE Theorem 2.9 and Corollary 2.13 (lines 358–373 and 461–466) are stated for any flat formal model; the proof uses Lemma 2.11, décalage cohomology and Lemma 2.12, none of which needs semistability. §6.7 defines `AΩ_𝔛 = Lη_μRν_*A_inf,X` for every flat `𝔛` from AInfCohomology §§AI.1.2 and AI.3.1, matching §AI.3.2 (smooth) and §AI.6.2 (semistable), and proves the theorem in that generality. The cusp model `y² = x³ + p` (`p ≥ 5`) is added as a Check. Ownership: AInfCohomology has no flat-model fixed-point theorem (its §AI.4.4 is only the μ-inverted comparison), so this roadmap owns it.

## R12 (P2) — applied differently

Verified: CohomologyComparisonsPartII §4.4 gives `A(e,p,r)` (uniform in chart and `n`, not in `e`), and separately `Nr + c_p` under the enough-roots condition (with dimension dependence at `p = 2`); the old route claimed a universal `N(r)` from the `A(e,p,r)` contract. §5.3's route now explains the colimit over finite `K′ ⊂ C`: `A(e(K′),p,r)` does not survive it, while the enough-roots exponent does, because cyclotomic `K′` are cofinal. A quantifier Check is added. The stronger bound is attributed to §4.4's refined statement. Instead of a new target, the existing gap `formal-syntomic-period-comparison` now asks for both exponents and base changes (README contract and `plan.json` `needs`). The supplier states the refined bound for log schemes, so only the formal transfer is missing.

## R13 (P2) — applied

Verified: `packages/ModpRepresentationsOfGL2OverLocalFields/README.md` §0.7 owns CDN23 Lemme 2.9 for `G′`, and CDN23 §2.1.3 works with that `G′`. §7.6 no longer owns the five-term theorem: it imports §0.7 for `G′ = G/ϖ^ℤ`, and for a general `G′` it records the elementary extension argument inside the proof of the cpcf two-out-of-three property, which remains owned here. Checks were updated.

## R14 (P3) — applied

Verified: CDN-CURVES lines 1689–1692 require any two components to meet in at most one point. §2.2 Check: Tate curve with three skeleton points, three edges summing to `v_p(q)`, rank `H¹(Γ) = 1`, `N_µ = v_p(q)`; the two-point subdivision is kept as a non-fine negative control.

## R15 (P3) — applied

Verified: `y²+y = x³` over `𝔽₂` has 3 points, `a = 0`. §4.6 Check: "`X² − aX + q` on both sides" → twisted polynomial `X² − (a/q)X + 1/q` on both twisted sides, with the untwisted one named. Computed: `X² + 2` untwisted, `X² + 1/2` twisted.

## R16 (P2) — applied

Verified: the disc model `Spwf O_K[ϖ^mT]^†` has special fibre `𝔸¹_k`, and its transition reduces to `0`. §5.1 Check now gives the chain-of-`ℙ¹` model of `𝔸¹_K`, nodes `X₁X₂ = ϖ` with `X₁ = ϖ^{m+1}T`, `X₂ = ϖ^{−m}T⁻¹`, all components proper. For `d ≥ 2`, products of nodes are not semistable, so `𝔸^d` is sent to CstConjectureForDaggerVarieties §1.5. The affine-space Checks of §§5.2, 5.4 and 5.5 now use the affine line, with the CDN-STEIN Example 1.9 locator kept.

## R17 (P3) — applied

Verified the current numbering (`packages/ModpRepresentationsOfGL2OverLocalFields/README.md`; ScholzeFunctorAndModpCohomologyOfTheLubinTateTower at its head; `packages/PadicLocalLanglandsForGL2QpPartII/README.md`). MP.0 → §§0.3–0.5 and 0.7; MP.2/category-c → §2.4; MP.2/ordinary-banach → §2.6 (in Scope, contracts, §§7.6–7.8 and Dependencies). SZ.0 → §0.2; SZ.6 → §6.2, with §5.4 added. The PartII consumer bullet now says it uses §§7.1–7.5 without restating them (§4.1 reads §7.5 at fixed level; §4.9 adds to §7.3). No MP/SZ label remains.

## R18 (P3) — applied

§0.5: the measures `M(𝓗^{r+1}, L)` are defined as the bounded distributions, with API bullets and Checks: Dirac mass, the mass-zero degenerate case at `r = 0`, and an unbounded distribution `Σp^{−n}(δ_{x_n} − δ_{y_n})`. §2.3: API list added, giving source and target of `ι_{a,s}` and the residue `±1` of the image of `T`. The gluing Check now rescales the coordinate instead of the algebra map, and an annulus cocycle Check is added. §3.3: API added plus three Checks (the `1 − φ` normalization, constants mapping to `0`, additivity with residue normalization `c = 1`). `Suggested.lean`: mathematical docstrings on `parabolic_mono` and `steinbergRelations_le_comap`.

## R19 (P2) — applied

Verified: CDN-CURVES Proposition 3.20 (lines 1923–1929) is a degree-one statement with choice-independence, and Remarque 0.2(ii) (line 136) covers affinoids in degree one. §2.3 now states the degree-one comparison with its cocycle restriction and independence; degree zero is elementary, and no higher degree is claimed. §1.1(a) carries its own route (torsion comparison, `Rlim`, coherence of `X_proét`), cited as the argument of the proof of CDN-STEIN Corollary 3.46 (lines 1420–1433). Remarque 0.2(ii) is kept as the affinoid degree-one case.

## R20 (P2) — applied

Verified: CDN-STEIN lines 327–328 use `N(u_ϖ) = −1`, whereas Layer 1 and §4.3 are `p`-normalized; CohomologyComparisons §4.5 has `N_norm = N_raw/e` and `ρ_{πu} = ρ_π∘exp(−log_K(u)N_raw)`. Changes:
- §4.3: model comparison through `N_p = N_raw/e`, plus a ramified Check (`e = 2`, `q = π²`: raw `2`, normalized `1`).
- §5.2: defines `N_raw` and `N_p`, and states the uniformizer change with the sign of CohomologyComparisons §4.5. Its Check now reads `e₁ ↦ e₁ − log(u)e₀`; it previously said `+`.
- Layer 5 preamble: `u ↦ eu` identifies the raw and `p`-normalized `X^r_st` (witness `e₁ + 2ue₀` against `e₁ + ue₀`).
- New contracts section for CohomologyComparisons §§4.5, 4.9a, 4.11–4.12 and CstConjectureForDaggerVarieties §1.5.

## Checks run

- `lake env lean packages/ProetaleCohomologyOfPAdicCurvesAndTowers/Suggested.lean` from the content checkout: exit 0; one warning, `Suggested.lean:124:8: declaration uses sorry` (the headline `generalizedSteinberg_isIrreducible`). No `TauCeti.*` import, nothing to build.
- `#check @name` for all eight declarations in one scratch file (`flagSubspace`, `parabolic`, `parabolic_mono`, `translation`, `steinbergRelations`, `steinbergRelations_le_comap`, `generalizedSteinberg`, `generalizedSteinberg_isIrreducible`): elaborated with the same single warning. The types are unchanged from the signature ledger and agree with README §§0.3–0.4. No binders were lost, since the file has no section `variable`s. Only docstrings changed.
- Dependency check (exact command of the brief), output:

```text
depcheck: 236 roadmaps, 2155 edges, 0 problem(s)
```

  No UPWARD, CYCLE or moved line. The new edges are to CohomologyComparisons, CstConjectureForDaggerVarieties and AInfCohomology, all earlier in the merge order.
- `roadmaps resolve` on the README flags only two leads: `ModpRepresentationsOfGL2OverLocalFields §0.3` and `PadicLocalLanglandsForGL2QpPartII §4.1`. Both are board packages that exist with those sections (Modp §0.3 at its README line 401; PartII §4.1), not missing owners.
- Ownership against open pull requests was checked for the new objects with `roadmaps grep`/`roadmaps show` at the heads of the supplier PRs: the flat-model `AΩ` fixed points, the product form of the Stein diagram, the comparison with CstConjectureForDaggerVarieties §1.5 and the Jacobian logarithm comparison. No second owner was found; the five-term criterion now has its single owner (R13).

## Adversarial pass on new and changed statements

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| WD group law, Conventions | `Φ = diag(1,q)`, `Ne₁ = e₀`; `q = 2` | `ΦNΦ⁻¹e₁ = q⁻¹e₀ = e₀/2`; `+deg` law needs `2e₀` | `−deg` law kept, misprint recorded |
| §4.4 Tate WD witness | `Φ = diag(q⁻¹,1)`, `Ne₁ = µe₀` | `NΦe₁ = µe₀`, `qΦNe₁ = q·q⁻¹µe₀ = µe₀` | consistent |
| §4.5 twist cocycle | `g(u) = χ⁻¹(u+c)`, `N = d/du` | `Ng = χ⁻¹gN`, `χ_ℓ(Φ_geo)⁻¹ = q = p^{deg Φ}` | unchanged, consistent with the law |
| `Sp_J(L)^*`, §0.3 | `d=1, J=∅`; `J=Δ` | `δ_a(1) = 1`, `(δ_a−δ_b)(1) = 0`; relations `0`, dual `L` | annihilator form |
| Measures, §0.5 | `r=0`, `δ_a`, `δ_a−δ_b`, `μ = Σp^{−n}(δ_{x_n}−δ_{y_n})` | mass `1`, `0` (degenerate); `μ` on ball at `x_n` = `p^{−n}` unbounded, finite sum on each compact open | definition separates |
| §1.1(a) qcqs | point; closed disc `ℓ≠p`; open disc | `H⁰ = ℚ_ℓ(1)`, `H¹ = 0 = 0`; open disc not qc, comparison fails (CDN-STEIN Remark 1.4) | route covers all degrees |
| §2.1 base class | `A_inf` with `(p)` vs `(p,[p^♭])` | `[p^♭]^k ∉ pA_inf` (image `(p^♭)^k ≠ 0`); `→ 0` for `(p,[p^♭])` | topology fixed per ring |
| §2.1 divisibility | `p`, `[p^♭]` in `A_inf` | `A_inf/p ∋ p^♭ ≠ 0`; `θ_0([p^♭]) = 0`, `θ_0(p) = p` | incomparable, not a valuation ring |
| §2.2 Tate pattern | 3 vertices, lengths `a,b,c`; 2 vertices | each pair meets once, `rank H¹ = 1`, `N = a+b+c = v_p(q)`; 2 vertices meet twice | three-vertex Check, two as negative |
| §2.3 gluing | `T ↦ αT`; algebra map times `α` | leg `T₁T₂ = αp^µ`; `1 ↦ α ≠ 1` | rescaling only |
| §2.3 degree one | closed annulus | cocycle `dT/T` everywhere, `0` on ghost circles ↦ `[dT/T]`; `H⁰ = C` | degree-one statement |
| §3.3 normalization | `1−φ/p` vs `1−φ` on `F¹A_cris` | `ℤ_pt` vs `A_cris^{φ=1} ∩ F¹ = ℤ_p ∩ F¹ = 0` | Check added |
| §3.3 regulator | constant `c`; `(T)²`; rescaled `c·df/f` | `0`; `2dT/T`; residue `c` vs Kummer residue `1` | additive, `c = 1` |
| §4.2 product form | `Ω⊔Ω`, `f = (0,1)` | `df = 0`, `exp f = 0`, `f ≠ 0` mod diagonal `C`, `f = 0` mod `C²` | `H⁰_dR` replaces `C` |
| §4.2 HK non-uniqueness | `(C̆,σ)`, `(C̆,pσ)` | slopes `0,1`; `X¹_st = (B_cris^+)^{φ=p}`, `ℚ_p` | uniqueness argument removed |
| §4.3 adapter | `e = 2`, `q = π²`, I₂ model | raw `N e₁ = 2e₀`; `v_p(q) = 1`, `N_p e₁ = e₀`; `e = 1`: equal | adapter `N_raw/e` |
| §4.6 twisted polynomial | `y²+y = x³/𝔽₂` | `#E = 3`, `a = 0`; `X²+2` → `X²+1/2` | twisted on both sides |
| §4.8 domain | `O_C`; `O_C/p²`, `O_C/p³` | `p^m ≠ 0` all `m`; kernels square/cube zero | limit definition |
| §4.8 Tate curve | `E[p^∞]` over `O_C`; torus | constant `(ℚ_p/ℤ_p)²` extends; `μ_{p^∞}` height 1, Dimension `(1,1)` vs `(1,2)` | corrected negative control |
| §4.9 variance | `μ_{p^∞}`: `D_contra`, `D_raw`, `D_norm` | slopes `1, 0, −1`; `(B⊗D_raw)^{F=p} = (B_cris^+)^{φ=p}`; contra or raw-with-`φ=1` give `ℚ_p` | three objects kept apart |
| §4.9 ordinary `g = 1` | `μ × ℚ_p/ℤ_p` | `D_contra` slopes `{1,0}`, `D_raw` `{0,1}`, `H¹_HK` `{0,1}` | variance fixed by cup product |
| Layer 5 `u ↦ eu` | `e = 2`, `N_raw e₁ = 2e₀` | raw kernel `e₁+2ue₀`, normalized `e₁+ue₀`; mixed `(N_p⊗1+1⊗N)(e₁+2ue₀) = −e₀` | identification stated |
| §5.1 chain model | node `m`; disc models | `X₁X₂ = ϖ`, `|X₁|,|X₂| ≤ 1` on the closed annulus; disc transition `ϖT_m ↦ 0` | chain model, `d ≥ 2` to §1.5 |
| §5.2 HK of chain | tree, `ℙ¹`s, one leg per `U_s` | `H¹(Γ) = 0`, `H¹_rig(ℙ¹) = 0`, one-leg residue `0`; `H⁰ = F` | `H¹_HK = 0 = H¹_dR` |
| §5.2 uniformizer sign | `N_raw e₁ = e₀`, `ϖ ↦ ϖu` | `exp(−log(u)N)e₁ = e₁ − log(u)e₀`; `u = 1` identity; `N = 0` identity | sign of CohomologyComparisons §4.5 |
| §5.3 uniformity | `A(e(K′),p,r)` as `e(K′) → ∞`; cyclotomic `K′` | unbounded vs `Nr + c_p`; `v_p(Diff(K F_m/F_m)) → 0`, `[K′:F_i]/e(K′) → 0` | enough-roots exponent, gap widened |
| §5.3 lattice | `p=2, r=2` | `a = 2`, `p^a a! = 8`, `(1/8)ℤ₂(2)` | unchanged |
| §6.7 general model | `y² = x³ + p`, `p ≥ 5`; `Spf O_C`, `i=1` | generic singular point needs `x=y=0`, so `p = 0`; special fibre is a cusp; `H¹_ét(Spa C) = 0` | flat-model theorem |
| §6.7 décalage sequence | `j = 0` | `H⁰(AΩ) = H⁰(T)` as `A_inf` is `μ`-torsion-free | consistent |
| Layer 7 dictionary | `q = 2`, `m = 1`, `n = 1` | `|O_D^×/(1+ϖO_D)| = 3·4 = 12`; `|Ǧ_0/Ǧ_1| = 3`; `|Ǧ_1/Ǧ_2| = 4` | dictionary stated |
| Layer 7 abs. irreducibility | `φe₁=e₂`, `φe₂=pe₁` | `φ² = p`, slopes `1/2`; char. poly `X²−p` irreducible over `ℚ_p`; `End = ℚ_p(√p)` | excluded |
| §7.3 bounded functions | locally constant `(0,1)`; non-locally-constant `f` | `exp(0,1) = 0` étale; componentwise Remarque A.2 | "not locally constant" |
| §7.6 elementary step | `A=B=0`; `D=E=0` | reduces to kernel / cokernel closure | import §0.7 for `G′` |
| §7.8 level Check | `n = 1`, level 2 | `Ǧ_1` acts trivially on `M_1 = M_Dr,1/(Ǧ_1/Ǧ_2)` | consistent with the dictionary |
| Lean docstrings | `#check @parabolic_mono`, `@steinbergRelations_le_comap` | types unchanged | docstrings only |

## Notes for the maintainer

- No section, layer or Lean name was renumbered or renamed. Sections cited by consumers keep their numbers: ScholzeFunctorAndModpCohomologyOfTheLubinTateTower cites §§7.1, 7.2, 7.6–7.7; PadicLocalLanglandsForGL2QpPartII cites §§0.3–0.4, 6.2, 6.5, 6.9, 7.1–7.5.
- §7.6 no longer owns the five-term criterion: ModpRepresentationsOfGL2OverLocalFields §0.7 is its single owner.
- The §5.2 uniformizer Check changed sign, to match CohomologyComparisons §4.5.
- The gap `formal-syntomic-period-comparison` now asks CohomologyComparisonsPartII for the enough-roots exponent `Nr + c_p`, as well as `A(e,p,r)`, on formal and weak formal schemes and their base changes.
- Source errors confirmed while settling the findings, none copied into the roadmap:
  - CDN-CURVES line 4432: sign of the Weil–Deligne exponent.
  - CDN-STEIN line 1936: the dual of `Sp_J` is stated as all inverse-limit distributions.
  - CDN-STEIN Example 1.9 applies the semistable theorem to `𝔸^d` without a model.
