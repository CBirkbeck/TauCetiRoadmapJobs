<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/164#issuecomment-6860978408 -->
Red team round 2 pass b (claude) of 96394e9

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §6.16 pushes blocks through root branches that need not land in the fibre

   Location: `packages/LogicAndDefinabilityInNumberTheory/README.md:1794`, "Apply the block-family covering of gap:block-family-covering in coefficient space with exponent smaller than ε/k and push blocks through these root branches."

   Claim: the images are blocks contained in X_t, so that "the number outside X_alg has that bound".

   Witness: n=1, k=2, X=(0,∞). The coefficient vector of t²−1 lies in the projected coefficient family (root 1∈X); the smallest-root branch sends it to −1∉X. `on_the_algebraic_points_of_a_definable_set` lines 390–398 argue the same way.

   Repair: replace the quoted sentence by "For each of the finitely many continuous root-branch tuples φ_i:U_i→ℝⁿ, apply the block-family covering of gap:block-family-covering, with exponent smaller than ε/k, to the definable family {(ξ,t) : ξ∈U_i, (φ_i(ξ),t)∈X}. Its basic blocks lie in U_i, and φ_i carries them to blocks contained in X_t." On the witness: the smallest-root family is {ξ : smallest root >0} and excludes t²−1; the largest-root branch sends t²−1 to 1∈X.

2. **F02** (P2) §4.29(c) asserts a smooth projective model over k[u,1/u] that the cited supplier does not give

   Location: `packages/LogicAndDefinabilityInNumberTheory/README.md:1329`, "let 𝒳 be a smooth projective A-scheme with geometrically integral fibres containing 𝒰 as a dense open subscheme"; README:1332, "build 𝒳 from 𝒰 with Hironaka's resolution over A".

   Claim: ResolutionOfSingularitiesCharacteristicZero §6.2 yields 𝒳 smooth and projective over A=k[u,1/u], at every u.

   Witness: §6.2 (its README:895) compactifies "a smooth quasi-projective finite-type variety U over a characteristic-zero field k". ℙ¹_A blown up at (u=1, x=0) is smooth over k, projective over A, and its fibre at u=1 is reducible.

   Repair: 𝒳 is not needed. Replace the sentence of (c) from "and let 𝒳 be" to "(first Check)." by: "For u∈k× write K_u=k[v]/(v^p−du), the étale k-algebra of rank p, and U_u=U(K_u/k,P) for the fibre of 𝒰 at u. K_u is a field exactly when du∉k×p. Substituting v↦wv identifies U_u with U_(uw^p), so fix one representative u₀ in each class of k×/k×p and let X_u, for u in that class, be one smooth projective model of U_(u₀) over k (ResolutionOfSingularitiesCharacteristicZero §6.2, over the field k). When du∈k×p, K_u≅k^p and X_u is k-rational (first Check)." In the proof paragraph replace "build 𝒳 from 𝒰 with Hironaka's resolution over A, as at the start of CTV §4 (p.14);" by "the models X_u are chosen fibre by fibre; the curve z^p=Q(x)R(x) maps to every U_u by Ξ=z, so the finite set of places below does not depend on u;". In the first Check replace "not the fibre of 𝒳" by "not the fibre of 𝒰". §4.30 already defines D₁ from 𝒰 alone. Tested at u=d⁻¹, p=2, k=ℚ: U_u is Ξ₁Ξ₂=P(x)≠0, of dimension 2, rational, unobstructed.

3. **F03** (P2) analytic cell decomposition of R_an,exp has no owner and no route

   Location: `packages/LogicAndDefinabilityInNumberTheory/README.md:1561`, "Analytic cell decomposition for R_an,exp is stated by van den Dries–Miller §4.2, p.12, citing van den Dries–Macintyre–Marker; it is used for the identity theorem on connected cells in §6.10."

   Claim: §6.3 proves that R_an,exp has analytic cell decomposition, with *Needs:* §§6.1, 6.2 and ShimuraVarieties §3.5a.

   Witness: ShimuraVarieties §3.5a (its README:941) exports o-minimality and the continuous cells of §§3.4c–3.4e only. `geometric_categories_and_o_minimal_structures` line 510 gives a reference, no proof. `roadmaps grep 'analytic cell decomposition'` finds no other owner. Analytic cells do not follow from o-minimality.

   Repair: declare the input. Under `### From TauCetiRoadmap.ShimuraVarieties` add: "What ShimuraVarieties must provide (gap:ran-exp-analytic-cells): §3.5a must state that for finitely many R_an,exp-definable subsets of ℝⁿ there is a cell decomposition of ℝⁿ, in the sense of §3.4c, partitioning each of them, all of whose defining functions are real analytic on their base cells (van den Dries–Macintyre–Marker, as cited by van den Dries–Miller §4.2, p.12)." Add the slug to the `gaps` list of `design/plan.json` with supplier ShimuraVarieties, section 3.5a and that sentence from "for finitely many" as `needs`. In §6.3 replace the quoted sentence by "Analytic cell decomposition for R_an,exp is the contract gap:ran-exp-analytic-cells; it is used for the identity theorem on connected cells in §6.10.", and add the gap to the *Needs:* lines of §§6.3 and 6.10 and to Scope (README:24). Tested on §6.10: for X=ℂ=V₁ in ℝ², the single analytic cell U=ℝ² meets V₁ in a set with interior and the identity theorem gives U⊆V₁; with continuous cells only, a polynomial vanishing on an open part of U need not vanish on U, so the step fails without the contract.

4. **F04** (P3) the Chebotarev contract names the wrong consumer

   Location: `packages/LogicAndDefinabilityInNumberTheory/README.md:136`, "Section 4.30 applies this to the auxiliary cyclic extensions."

   Witness: README:1332 uses Chebotarev in §4.29(d) ("choose primes a,b≡1 mod (1−ζ)^(2p−1) … by Chebotarev and class field theory"); §4.30 (README:1357, *Needs:* README:1369) does not use it; README:11 says §4.29.

   Repair: "Section 4.29(d) applies this to the choice of the auxiliary primes a and b."

5. **F05** (P3) §2.2 uses the large-residue-characteristic transfer without naming it

   Location: `packages/LogicAndDefinabilityInNumberTheory/README.md:373`, "For the selected local-field specialization the same fixed formulas give cells for sufficiently large residue characteristic"; *Needs:* README:379 lists §2.1 and §1.3 only.

   Witness: the clause passes a cell decomposition from K((t)), char K=0, to local fields; §1.3 covers residue characteristic zero only (README:288: "No mixed-characteristic field ℚ_p satisfies the characteristic-(0,0) hypothesis"). The passage is §1.5(b).

   Repair: after the quoted sentence add "(by §1.5(b), applied to the sentence saying that the fixed formulas define a partition into presented cells)", and add "[1.5 Finite-formula transfer for large residue characteristic](#15-finite-formula-transfer-for-large-residue-characteristic)" to the *Needs:* line of §2.2. §1.5 needs only §1.4, so no cycle arises.

6. **F06** (P3) the relative form of §2.12 has no Checks

   Location: `packages/LogicAndDefinabilityInNumberTheory/README.md:597`, "there is a unique nowhere-vanishing relative r-fold top form θ on X satisfying f*ω_Y⊗θ=ω_X". The section has no **Checks.** block; the only computed instance is in the layer Examples.

   Repair: add after the third paragraph of §2.12:

   "**Checks.**

   - For the projection F²→F, (x,y)↦x, with ω_X=dx∧dy and ω_Y=dx, θ=dy; on O_F² the iterated integral is 1·1=1=vol(O_F²).
   - Rescaling ω_Y to π·dx gives θ=π⁻¹dy: the base density is q⁻¹ and the fibre density q, with product 1. The wrong direction θ=π·dy would give q⁻².
   - For r=2, ω_X=(dx∧dy)^⊗2 and ω_Y=π²(dx)^⊗2 give θ=π⁻²(dy)^⊗2, of density |π⁻²|^(1/2)=q, against the base density q⁻¹ of §2.7.
   - For a=xy with ω_X=dx∧dy and ω_Y=da, base-first order gives θ=−dx/x, since da∧(−dx/x)=dx∧dy; the opposite order gives +dx/x, and the two agree only after absolute values."

Six new findings: three P2 (S01–S03), three P3 (S04–S06). No P1. All sixteen round-1 findings are repaired or correctly settled. Files read in full: `packages/LogicAndDefinabilityInNumberTheory/README.md` (1993 lines) and `packages/LogicAndDefinabilityInNumberTheory/Suggested.lean` (188 lines). No Lean was run; elaborated types are those of the worker's `signatures.md`.

## Round-1 findings at this head

| Finding | Status | Witness at 96394e9 |
|---|---|---|
| 1a/F01 Weil volume, separatedness | repaired | README:538 "Let X be a separated smooth O_F-scheme of finite type"; doubled-origin Check README:548, recomputed: q+1 residue points, image volume 1, chart-glued (1−q⁻¹)+2q⁻¹. |
| 1a/F02 Néron isogeny only on special fibres | repaired | README:558 "on special fibres it restricts to an étale isogeny 𝒜°_k→ℬ°_k … no finiteness is asserted"; Tate Check README:579 recomputed (kernel 4 and 2; 2=2 points over 𝔽₃). |
| 1a/F03 cycle §2.4 ↔ §3.9 | repaired | README:435 "stated in §3.9 … this section uses no result of Layer 3"; §3.9 *Needs:* cites §2.4 "its fixed-field and cell integrals only" (README:805). No cycle among §§2.4, 2.5, 3.7, 3.9. |
| 1a/F04 U is the weight −2 part | repaired | README:1919 "its weight −2 subgroup U (normal in P and central in W …)"; Check README:1933: W=V=𝔾_a², Z(W)=W, U=0. |
| 1a/F05, 1b/F06 §4.29(c) family | repaired; the repair carries S02 | README:1329 uses K_u=k[v]/(v^p−du) and fibres of a family; `le_compl_mentaire_des_puissances_n_i_mes_dans_un_corps_de_nombres` lines 502–515 agree. The asserted model over A is S02. |
| 1a/F06 two absent headlines | settled (disputed); not re-raised | The reason holds: §4.27 is `koenigsmann_defining_z` line 712, a step towards Corollary 22, which is stated; §4.32's remark follows from two stated headlines. |
| 1a/F07, 1b/F05 missing Checks | repaired | §4.12 README:1047–1049, §4.31 README:1388–1390, §4.33 README:1420–1422, §3.11 README:827–829; values recomputed below. |
| 1a/F08 abelian closure condition | repaired | README:1332 "the algebraic closure of the residue field k(M) is an abelian extension of k(M)"; S₃ Check README:1344. |
| 1a/F09 manifest locators | repaired | `sources.toml`:77 "toDiophPoly; toDiophPoly_apply; exists_mvPolynomial"; :93 "dioph_iff_exists_fin_mvPolynomial; dioph_iff_exists_finite_mvPolynomial". |
| 1b/F01 block covering | repaired (declared gap) | README:116 and `design/plan.json` carry `block-family-covering`; the contract matches `on_the_algebraic_points_of_a_definable_set` lines 265–270. |
| 1b/F02 closure theorem | repaired (declared gap) | README:106 and `design/plan.json` carry `definable-remmert-stein`; matches `peterzil_starchenko_agc` lines 596–598 (E arbitrary, A in the category). |
| 1b/F03 §6.8 proof wording | repaired | README:1651 keeps only the reduction Y⊆W; the clause-by-clause passage is gone. |
| 1b/F04 padding | repaired | `rationalDiophantine` and `rational_nonintegers_diophantine` are absent from `Suggested.lean`; README:1253 names `universal_integers` only. |
| 1b/F07 CL locator | repaired | README:459 "pp.43–45". |
| 1b/F07 Pas locator | settled; the dispute is right | `pas_1989` line 288 heads printed p.144 and §3.6 starts at line 299. "pp.144–155" is correct; my round-1 repair was wrong. |

No repair introduced a false statement. One repair introduced an unsupported construction (S02).

## Declarations of Suggested.lean (16)

| Declaration | Context | README | Instances and values | Result |
|---|---|---|---|---|
| `ax_kochen_ring` | no variables; `Fact p.Prime`, two `CompatibleRing` binders | §1.5(a), O=ℤ | ∃x,x²+1=0: p=2 false/true, p=3 false/false, p=5 true/true; N≥2 | true as typed |
| `igusa_poincare_rationality` | all binders explicit | §2.6 | m=0, f=c≠0: counts 1 for n≤v(c), then 0; f=0: 1/(1−T); f=x, m=1: count 1 at every level, series 1/(1−T); n=0 quotient has one element; the algebra map is injective since O is a domain of characteristic 0 | true; generality equals README |
| `Diophantine.mrdp` | implicit n | §4.15 | n=0: S=∅ or univ, both r.e. and Diophantine | true |
| `hilbert_tenth_integers` | none | §4.16 | arity 0, p=a: computable, so existence form needed | true |
| `rationalIntegers` | none | §4.17 | 0, −7 in; 1/2 out | body real |
| `universal_integers` | none | §4.24 | negation gives ℚ∖ℤ Diophantine | true |
| `forall_exists_rational_undecidable` | none | §4.25 | n=0: equation P(a)w−1=0; integer z with P=0: product −1≠0 | true |
| `one_universal_variable` | none | §4.28 | `koenigsmann_defining_z` line 875 | true |
| `twoUniversalIntegerPolynomial` | none | §4.33 | a=b=1,t=0,u=(1,0,0,0),v=0: 2·2·0=0; equals the formula at `koenigsmann_defining_z` lines 268–272 | matches |
| `two_universal_integer_formula` | none | §4.33 | a≤0: guard a+A=0 solvable; a=b=3: Δ={2,3}, 1/2 rejected, 1/5 accepted | true |
| `nonpowers_diophantine` | `Field`, `NumberField`, hr | §4.30 | x=0 excluded twice (0=0^r); ℚ, r=2: −1 in, 4 out | true |
| `IsOMinimalExpansion` | `[L.Structure ℝ]` in type | §6.1 | ℤ: frontier ℤ infinite; (0,1): {0,1}; empty language: order not definable | body real |
| `algebraicPart` | implicit n | §6.11 | (0,1): all; {0}: ∅ | body real |
| `rationalTupleHeight` | implicit n | §6.12 | −3/4: 4; (−3,2): 3; (): 1; 0: 1 | body real |
| `pila_wilkie` | hL, hX explicit | §6.14 | n=0: count ≤1≤C; X_t=(0,1): count 0; C independent of t, T | true |
| `bounded_degree_counting` | hL, hX, hk explicit | §6.16 | √2: degree 2, height √2; transcendental: junk height 1, excluded by `IsAlgebraic`; set finite by `TauCeti.finite_setOf_absMulHeight₁_le` | true |

No declaration lost a binder; every Lean name occurs in the README and every backticked name of this roadmap in the README is declared. Headlines not statable are each named in the module docstring with the missing carrier. No padding found by the one-tactic probe.

## Adversarial pass (README targets)

| Statement | Instances | Values | Result |
|---|---|---|---|
| §0.3 fractions | (−1,2)+(1,2) over ℤ | (0,4)~0 | holds |
| §1.2 ac under π′=επ | x=π | res(ε)⁻¹ | holds |
| §1.5 Checks | ℤ[i], p=5 and 13 | ι=2,3: 1+ι=3 (nonsquare), 4; p=13: 6 (nonsquare), 9 | holds |
| §2.5 char-2 control | h=t^(2n), t^(2n+1) | quotients t and t⁻¹; s∘s=id | holds |
| §2.6 tail identity | f=0, 1, x | 0=0; T=T; (1−q⁻¹)T/(1−T/q) both sides | holds |
| §2.6 raw versus normalized | substitution | raw(T)=A(q^m T) | holds |
| §2.10 Check | S₃ on 𝔽₃³/diag | M^G=0; (M*)^G = constants, order 3 | holds |
| §2.12 base-first | a=xy | da∧(−dx/x)=dx∧dy | holds |
| §3.11 | 𝔾_m, ℙ¹, χ | [ℚ(1)]−1; 1+[ℚ(1)]; 1−[ℚ(−1)]↦0 | holds |
| §4.12 | P(11,4), P(5,2), P(1,2) | 95; 17; 3; diagonal s fills T(s)+1..T(s+1) | holds |
| §4.20 dyadic row | a=6, b=15 | −6−15+90=69≡5; −21≡3 mod 8 | holds |
| §4.21 | R³₃, R³₅, R⁵₅, R⁷₇, R¹₁,₃ | supports {3}, {2}, {5}, {7}, ∅ by Hilbert symbols | holds |
| §4.21 presentation | (−p,−p)=(−1,−p), etc. | equals `koenigsmann_defining_z` lines 281–284 | holds |
| §4.24 | R̃ for S={ℓ} | x∉R̃ iff v_ℓ(x)<0 | holds |
| §4.25 | product equation | P≠0: w=1/P; z_i∉ℤ: g=0; both fail: −1·∏≠0 | holds |
| §4.27 | 35 | needs Φ₅·Φ₇; 25 needs Φ₅·Φ₅ | holds |
| §4.29(c) | u=d⁻¹ | split fibre, dimension p | holds; S02 on 𝒳 |
| §4.30 | u=1; u=d⁻¹ | u=1∈E by (d); d⁻¹∈D₁ | holds |
| §4.33 degree | a²b²u₄⁸ | coefficient 1, degree 12; existential degree 8 | holds |
| §5.4 | series | q²(1−x)²((1−x)⁻²−1)=2q−1, x=1/q | holds |
| §6.4(b) | [0,∞), hyperbola | one component from two cells; two components | holds |
| §6.5 | sin(tx), t=2πk | k intervals | holds |
| §6.14 via gap | singleton blocks | ≤cT^ε points outside X_alg | holds |
| §6.16 | n=1, k=2, X=(0,∞), t²−1 | smallest root −1∉X | S01 |
| §6.17 | exponents | cD^δ > C′D^(Aε) for Aε<δ, D large | holds |
| §7.1 g=1 | reduced form | 3a²≤\|D\|, 2a≤\|D\|, Im τ quadratic | holds |
| §7.5 | class-number-one list | 13 values; 1 absent | holds |
| §7.6 | codimensions | codim U<dim X+dim Ď≤codim(X×Z)+codim W | holds |
| §7.7 | δ | N^δ≤N^(1−ε); D^(Bδ)≤D^(1/b) | holds |
| gap:block-family-covering | against source | lines 265–270 | precise, minimal |
| gap:definable-remmert-stein | against source | lines 596–598 | precise, minimal |
| gap:neron-pairing-perfect-finite-residue | against source | `torsion_and_tamagawa_numbers` lines 1544–1556 | precise |

## Dependency check

```
depcheck: 239 roadmaps, 2175 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

## Verified sound

- Declarations read: 16 of 16, each compared with its elaborated type in `signatures.md` and its README statement.
- README targets read: 93 sections (Layers 0–7), with every Checks block.
- Locators verified against the cached texts: 74, in `koenigsmann_defining_z` (17), `ax_lindemann_for_a_g` (9), `le_compl_mentaire_des_puissances_n_i_mes_dans_un_corps_de_nombres` (7), `on_the_algebraic_points_of_a_definable_set` (6), `integrability_of_oscillatory_functions_on_local_fields_transfer_p` (6), `the_andr_oort_conjecture_for_a_g` (5), `geometric_categories_and_o_minimal_structures` (4), `geometric_stabilisation_via_p_adic_integration` (4), `ax_schanuel_for_shimura_varieties` (3), `bkt` (3), `peterzil_starchenko_agc` (2), `torsion_and_tamagawa_numbers` (2), and one each in six further texts. All agree with the README.
- Checks tested by computation: 72; none false or vacuous.
- Sibling citations checked: 47 section or target ids in 18 roadmaps, on main or at the open head. All exist. GlobalQuadraticForms §4.4 resolves through that roadmap's name map (its README:83–84).
- Pinned declarations: all 86 backticked Mathlib and Tau Ceti names occur at the pins (the 87th foreign name, `exists_oMinimalStructure_definable_iff`, is ShimuraVarieties §3.4b's); `Rat.mulHeight₁_eq_max` is at line 532 and `NumberField.absMulHeight₁` at line 136 of the cited file, with junk value 1.
- Ownership: `roadmaps grep` for analytic cell decomposition, basic blocks and the algebraic part finds no second owner. No declaration shares a fully qualified name with another roadmap.
- Policy: single `import Mathlib` plus one existing Tau Ceti module; no `set_option`, `lemma`, `#eval`; no pull-request numbers or process narrative in the README or docstrings.
- Arrangement: the layers do not follow a source's contents (see `Source independence:`).

## Not verifiable

- The waived texts `vd_dr_tame`, `vd_dr_macintyre_marker`, `pila_wilkie`, `cl_addenda` and the uncertified texts `hilbert_s_tenth_problem_is_unsolvable`, `bosch_lutkebohmert_raynaud`, `schneider`, `hodges`, `denef_1984` were not read; their locators stand as recorded.
- The elaboration of `Suggested.lean` was not rerun in this read-only pass.
- The open roadmap pull request listed in `overlaps.md` carries an older text of this roadmap (162 differing lines against this package, including the pre-repair §§2.4, 2.9 and 4.29). It must be rebased on this package before either merges; this was not otherwise examined.
- Layer 7 input hypotheses were checked for locator and statement, not for the proofs in their sources.

## Source issues

- **Gap** in on_the_algebraic_points_of_a_definable_set at Theorem 5.3, proof, author p.8: the source says the covering theorem is applied to the projected coefficient family and the root sections are then applied; it should apply it to the pullback family of each section, since a section can leave the fibre; affects the proof.
- **Gap** in le_compl_mentaire_des_puissances_n_i_mes_dans_un_corps_de_nombres at §4, opening construction, p.14: the source says resolution gives a scheme smooth and projective over the punctured line with every fibre smooth; it should use fibrewise models or an equivariant compactification twisted by the torsor; affects the proof.
- **Misprint** in on_the_algebraic_points_of_a_definable_set at Definition 1.3, author p.2: the source says the rational counting function counts points over K; it should count points over ℚ; affects nothing.
- **Misprint** in on_the_algebraic_points_of_a_definable_set at Proposition 3.4, proof of part 2, author p.6: the source says the preimages lie in U and names the path's start by a capital letter; it should place them in the basic block V and write g(0); affects nothing.

Source independence: 24 passages compared with 10 sources, none shared beyond formulas and statements of about a dozen words; largest share cluckers_loeser_2008, 43 of about 256 source mentions; contents compared with cluckers_loeser_2008: independent (Layer 3 draws on its §§2, 4, 5, 6, 10–14, 16 in a different order and grouping, its §§3, 7–9 have no section of their own, and the order 3.5→3.6→3.7→3.8 is forced by the *Needs:* lines).

## For the human reviewers

- Licence: README §§4.1–4.9 describe constructions of the public formalization cameronfreer/hilbert10 (`hilbert10_polynomial_bridge`, `hilbert10_finite_diophantine_normal_form`), stated Apache-2.0 at README:1956–1957. No `Suggested.lean` declaration shares a name or statement with it.
- Licence: `bkt`, `geometric_categories_and_o_minimal_structures`, `peterzil_starchenko_agc` and `on_the_algebraic_points_of_a_definable_set` are read from author-hosted copies; pagination in the README is theirs.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "96394e97605cbec0be380fc78c6bbe13adadb3c0", "job": "RT-LogicAndDefinabilityInNumberTheory~2b", "model": "fable", "worker": "chris-x55"} -->
