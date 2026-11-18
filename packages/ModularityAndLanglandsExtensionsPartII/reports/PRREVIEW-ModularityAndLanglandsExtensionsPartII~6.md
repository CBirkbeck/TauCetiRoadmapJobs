# Review of ModularityAndLanglandsExtensionsPartII (pull request #2449 at 141d7bd)

**Verdict:** needs changes

**Summary.** Changes are needed for one reason, and it is about the plan, not about a statement: this roadmap and its parent ModularityAndLanglandsExtensions supply each other, because the parent states `SP_n`, tensor functoriality lifting and the endpoints over `ℚ` as its own targets, sends their proofs here, and then uses them, while every layer here builds on the parent. The mathematics I checked is sound: the fifteen sampled targets agree with Newton–Thorne II, Newton–Thorne 2026 and Thorne 2024 at their locators, the repairs of printed arguments that the README announces are correct, and the two Lean statements are true as written. There are four small corrections and two format notes, none blocking, and one point for the human reviewers (supplier requests on the board that the text no longer uses).

## R01 (P2) — The roadmap and its parent supply each other: the parent states the theorems proved here as its own targets and then consumes them

A roadmap has one direction of supply, and here there are two. An implementer of the parent cannot finish its Layer 4 before this roadmap is complete, and this roadmap cannot start before the parent's Layers 0–2 and 4 exist; the theorems `SP_n` for all `n`, tensor functoriality lifting and the endpoints over `ℚ` are targets in both texts.

How I know. In this README, "Exact supplier contracts" imports from ModularityAndLanglandsExtensions §§0.2, 1.7, 1.10–1.12, 1.15, 2.1, 2.13, 2.16, 2.25, 4.1, 4.2, 4.13, 4.15 and 4.22, and "Downstream consumers" (line 2072) lists the same roadmap as a consumer: "its statements in §§4.9, 4.12, 4.20, 4.23 …, 4.29 and 4.30 are proved here …, and its consequences (Sato–Tate in §4.34, …) use them". "Scope and ownership" (line 2092) says "The statements stay in that roadmap". At the head of pull request #1180, `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md` states §4.30 as a target with "Proof route: induction on `n` (ModularityAndLanglandsExtensionsPartII §13.10)" (line 2496), likewise §4.23 (line 2381, citing §12.7 and §§13.5–13.6 here), §4.12 (line 2206), §4.20 (line 2341) and §4.29 (line 2484); its §4.34, the Sato–Tate theorem that its Lean file states, is routed through §4.29 (line 2547), and its §§4.35–4.37 through §4.30. So the chain is parent §4.34 → parent §4.30 → §13.10 here → parent §§1.15, 4.15, 4.22: a cycle between the parent's Layer 4 and Layers 9–13 here. The dependency check does not see it, because it reads only the citations this README makes. §§12.7, 13.10 and 14.1–14.3 here restate, with full hypotheses, what the parent's §§4.23, 4.30, 4.9, 4.12, 4.20 and 4.29 state; §§14.4–14.5 are the case `F = ℚ` of the parent's §4.37.

The smallest change is to give each of these theorems one owner, in one direction. Two ways, and the choice is the author's. (a) This roadmap owns the statements it proves (Newton–Thorne 2026 Theorems 3.2, 4.1, 5.5, 5.9 and 6.4 and the endpoints over `ℚ`); the parent stops at what Part II consumes, and its §§4.9, 4.12, 4.20, 4.23, 4.29, 4.30 with the sections that use them (§§4.34–4.37) move here or to a later part. Then the Scope sentence becomes "This roadmap owns the statements and the proofs of …", and the first bullet of Downstream consumers goes. (b) The proofs stay with the statements, in the parent. Either way no section of the parent cites this roadmap in a proof route while this roadmap cites the parent.

## C01 — The request to PotentialAutomorphyInfrastructurePartII for the auxiliary-place lifting theorem is used in §§11.6 and 13.8 but stated nowhere

§11.6 (steps 3 and 4) and §13.8 apply a lifting theorem under the slug `gap:auxiliary-place-reducible-lifting`, and the contract for ModularityAndLanglandsExtensions §4.2 (line 2198) calls it "the auxiliary-place variant requested from PotentialAutomorphyInfrastructurePartII below". Below, the subsection for that supplier has no such request: the four other requests each have their sentence "What … must provide", this one does not. A reader cannot see the hypotheses of the theorem that two layers rest on (in Thorne 2024 Theorem 7.5 they include `p ∤ n`, `F ⊄ F⁺(ζ_p)`, the constituents irreducible and distinct over `F(ζ_p)`, primitivity, and no quotient of order `p`). The supplier's head has the finiteness statement (§8.16) and no lifting statement, so the request is needed.

Add the sentence to the subsection "From TauCetiRoadmap.PotentialAutomorphyInfrastructurePartII": the lifting form beside §8.16, with the hypotheses of ModularityAndLanglandsExtensions §4.2, its cyclotomic clause replaced by the unobstructed place, and the added hypothesis of §8.16.

## C02 — §11.9 takes the Hecke map of the Steinberg problem from a supplier section that excludes Steinberg conditions

The proof sketch of §11.9 (lines 978–980) gives "the surjection `P → 𝕋` for problems whose local rings are fixed-type or unipotent rings (PotentialAutomorphyInfrastructurePartII §3.10)", and the *Needs:* line cites §3.10 and §7.11 only. That covers `J_{𝒮_{F_3}}` (unipotent conditions). The inclusion `J_{𝒮_{F_3}} P_{𝒮′_{F_2}} ⊂ J_{𝒮′_{F_2}}` also needs `P_{𝒮′_{F_2}} → 𝕋_{F_2}` for the Steinberg problem, on the unitary group of the algebra ramified at `T_{F_2}` (nt26 line 1078). §3.10 of the supplier says that a Steinberg choice is outside its comparison (its last-but-one Check, line 654 at the head of pull request #2135). The map is the `η : P₁ → 𝕋₁` of "The ANT set-up" in the supplier's Layer 8 (line 1397 there), with Steinberg conditions at `B`.

Cite that set-up for `𝕋_{F_2}` in the sketch and in the *Needs:* line of §11.9.

## C03 — The proof sketch of §6.9 cites "Propositions 6.7 and 6.9" of Thorne 2024; 6.9 is a lemma, and the step is Corollary 6.8

Line 135 says that Propositions 6.7 and 6.9 reduce the local constituents at `ṽ_0` to Steinberg or the two-block constituent. In th24, 6.9 is a lemma about filtrations (th24 line 1719), and the statement that the only Iwahori-spherical subquotients are `π_n` and `π_{n_1,n_2}` is Corollary 6.8 (th24 line 1678), which the proof of Theorem 6.11 uses with Proposition 6.7 and Corollary 6.6 (th24 p. 41). Write "Proposition 6.7 and Corollaries 6.6 and 6.8 (with Lemma 6.9)".

## C04 — The description does not say that five supplier contracts are requests

The description says "The README's supplier contracts cite every supplier by name and section". Five of them ask a supplier for something it does not state yet: Taylor–Wiles primes with the tensor and symmetric-power distinctness conditions (GlobalGaloisDeformations), the formal-torus actions in simultaneous patching (DeformationAndDerivedPatchingAlgebra), Artinian points as quotients of crystalline lattices (FiniteFlatGroupsAndIntegralPadicHodgeTheory), the inputs of Thorne 2024 §§3–6 (CompletedCohomologyAndLocalGlobalCompatibility) and the auxiliary-place lifting theorem (PotentialAutomorphyInfrastructurePartII). Three of these suppliers are on main. A sentence naming the five requests and their suppliers would tell a reader what the roadmap is conditional on. The same paragraph says "The roadmaps under Downstream consumers consume this one", which includes the parent that the task list names as a supplier (R01).

## N01 — The numbering has gaps that the text does not explain

Layer 6 has the single section 6.9, Layer 13 goes from 13.8 to 13.10, and there are no Layers 7, 8 and 10. One sentence in "How to read the build" saying that the numbers are kept because other roadmaps cite them would stop a reader looking for the missing sections.

## N02 — `F(S)` is used in §§13.1–13.2 before it is explained

The field `F(S)` (maximal abelian extension of exponent two unramified outside `S`) appears in hypothesis (2) of §13.1 and (7) of §13.2; the only explanation is in the supplier contract for ArithmeticGaloisDuality at the end. A clause at first use would do.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §6.9 (th24 Thm 6.11; C03) | `𝔽_5`, `q = 2`, `(ψ_1, ψ_2)(ϖ) = (2, 1)`; `𝔽_7`, pair `{3, 1}` | `2·2 = 4 ≠ 1`; swapped `3·2 = 6 = 1`; ratios `3, 5 ∉ {2, 4}` | hypotheses (1)–(5) equal th24 lines 1758–1775; Checks true |
| §9.2 (nt21b Lemma 2.2) | `n = 2`, `3`; `1 ⊕ ε^{−1}` and its dual | weights `{0,1}`; `Sym²`: `{0,1,2}` against `{0,−1,−2}` | quotient `L ↠ A²` as nt21b lines 322–329 |
| §9.3 (nt21b pp. 8–9) | `n = 2`, `3`, `4`; `α/β = ζ_3` | exponents `1, −1`; `1, 0, −1`; `α³ = β³` for `n = 4` | equals nt21b lines 338–368 |
| §9.6 (nt21b Prop. 2.8, Lemma 2.9) | `g = 2q + 1`, `γ = 2 − |S∪S_∞| + q` | `1 + 3|S∪S_∞| + g = 2q + 3|S∪S_∞| + 2 = q + 4|S∪S_∞| + γ` | equals nt21b lines 789–869 |
| §9.7 (nt21b pp. 12–13, 17–18) | `p > 2` dimensions; `n = 3`, `a = 2`, `i`, `−1` | `1 + 3[F:ℚ] + 3|S| + g = q + 4|S∪S_∞|`; `4, 1, 1/4`; `−1, 1, −1`; `1, 1, 1` | no domain claim at `p = 2`, as nt21b lines 824–857 |
| §11.2 (nt26 Lemma 3.1) | determinants; `r = 2` | `ε̄^{−2}ε̄ = ε̄^{−1}`; `ε^{−1}·ε^{−1}ω_p = ε^{−2}ω_p`; `{0,1}+{0,2} = {0,1,2,3}` | properties (1)–(5) as nt26 lines 576–582; twist `χ_v` repairs a gap |
| §11.3 (nt26 Lemma 3.5) | `s^c` against `s^∨` | `ε^{2r−1}ω_p^{1−r}` from the duals, `(y y^c)^{1−r} = ω_p^{1−r}`: `s^c ≅ s^∨ ⊗ ε^{1−2r}` | agrees |
| §11.4 (nt26 Lemma 3.7) | `n = 4`, `[F′:ℚ] = 2`; `r = 3` | `dim Λ = 9`; `4 + 2 = 6` | equals nt26 lines 866–911 |
| §11.5 (nt26 Lemmas 3.6, 3.8) | `r = 2` | `dim R_v = 17`, special fibres pure of dimension `16` | equals nt26 lines 820–863, 912–929 |
| §11.6 (nt26 Prop. 3.9) | `𝔽_7`, `q = 3`, `Φ = diag(1, 2)`; `λ·diag(ν, 1)` | `3, 3, 6, 5`; `det = λ²ν = 1`, square `diag(ν, ν^{−1})`; index divides `(|k| − 1)²` | uses supplier §8.16 as stated: one Steinberg place, `l > 3`, `l ∤ 2r` |
| §11.7 | `𝒪[[T]]`, `Q = (0)`, `𝔭 = (ϖ)` | dimensions `2` and `1`; `(0) ⊂ (ϖ)` | equals nt26 lines 980–1053 |
| §11.8 (nt26 Props 3.12, 3.13) | scalar `1` | trivial restriction is the scalar case | equals nt26 lines 1060–1067, 1110–1113 |
| §11.9 (nt26 Prop. 3.14; C02) | the two Hecke algebras | `𝕋_{F_2}`: `S(B) = T_{F_2}`; `𝕋_{F_3}`: `R = T_{F_3}` | statement equals nt26 lines 1123–1141; supplier citation corrected in C02 |
| §12.4 (nt26 p. 32) | `r = 1`, `(α, β, γ_1) = (2, 3, 5)` | `η = (10, 15)`; `η_1η_2 = 150 = αβγ_1²`; printed formula gives `αβγ_1 = 30` | README's correction of the printed generator is right |
| §12.6 (nt26 Props 4.8, 4.9) | `n = 2`; `q = |S∪S_∞| = 3` | `dim W′_∞ − dim W_∞ = (n − 1)q`; `γ = 2`, `|{±1}²| = 4` | bound `q ≥ |S∪S_∞|` as nt26 line 1643 |
| §12.7 (nt26 Thm 4.1) | `r = 1`, `2` | weights `{0,…,2r − 1}`; component dimension `qn + 4|S∪S_∞| = dim W′_∞` | (1)–(9) equal nt26 lines 1187–1202 |
| §13.1 (nt26 Prop. 5.4) | characteristic `2`: `M = 6`; `M = 16`, `t_1 = 17` | `q ∈ {2, 4}`, `q ± 1 ∈ {1, 3, 5}`; `17 | 16 + 1` with `16 ≯ 16` | one place does not give `q > M`; two places do (`t_1 = t_2 = q + 1` is excluded) |
| §13.2 (nt26 Thms 5.5, 5.9) | `p = 5`; `r = 3`; `M > p^{a₀(p)}` | `11, 16, 31, 41 ≡ 1`; `max(12, 5) = 12`; `p^a > M` gives `a > a₀(p)` | equals nt26 lines 1855–1868, 2058–2075 |
| §13.4 (nt26 Lemma 5.8) | `r = 4`: `q = 17`, `x = 2`, `y = 3`; `q = 43` | forbidden set `{1,2,4,8,9,13,15,16}`; eigenvalues `7,6,10,11,14,12,3,5`; `y³ = y^{−3}` | Checks true |
| §13.7 (nt26 Cor. 6.2) | `Δ`; `M` between `p^{a₀(p)}` and `t_i` | weight `11 ≠ 1`; `2·5 − 11 = −1`; `p^{a₀(p)} + 1` is even, so `t_i ≥ p^{a₀(p)} + 2` | equals nt26 lines 2296–2308; misprints noted correctly |
| §13.8 (nt26 Prop. 6.3; th24 Prop. 7.4, Thm 7.5) | `p = 5`, `r = 1`; `p = 7`, `a` odd | `4 + 2 = 6`; `p ∤ p + r`; `7^a ≡ 3 mod 4`, scalars `±1`; `−(α/β)^0 = −1 ≠ 1` | equals nt26 lines 2311–2324, th24 lines 1915–1975 |
| §13.10 (nt26 Thm 6.4; R01) | `n = 6, 7, 11, 12` | `(5,1)`; `(5,2)`; `(7,4)` only; `(7,5)` or `(11,1)`; indices all `< n` | true; Bertrand at `⌊n/2⌋` gives `n/2 < p < n` |
| `symPowerEulerFactor` | `n = 0`, `1`; `Δ`, `n = 2`, `p = 2` | `1 − x`; `1 − (α+β)x + αβx²`; `576 − 2048 = −1472` | real body; symmetry proved in the file |
| `HasQuadraticSelfTwist` | `M = 0`, `1`, `2`; `Δ` with `χ_{−4}`; level `32` | `p ⊥ 0` iff `p = 1`; trivial groups; `252·(−1) ≠ 252`; `a_5 = 6 − 8 = −2` | real body; `M > 0` needed; equals CM for `k ≥ 2` |
| `symPowerEulerProduct_levelOne_entire` (§14.4) | `n = 0`; `n = 1` | `ζ(s)`, pole at `1`; region `Re s > (k+1)/2`; shift `s′ = s − n(k−1)/2`, `Re s′ > 1` | true; not closed by `simp`, `rfl`, `infer_instance`, `exact?` |
| `symPowerEulerProduct_entire_of_not_hasQuadraticSelfTwist` (§14.5) | CM form of level `32`: `n = 2`, `4`; weight one; `n = 0` | inert `p`: `(1+px)²(1−px)`, entire; `(1−p²x)³(1+p²x)²`, `ζ(s−2)` pole at `3 = 4/2 + 1` | true; both hypotheses needed; not closed by one tactic |
| Supply with the parent (R01) | chain of citations | parent §4.34 → §4.29 → §4.30 → §13.10 here → parent §§1.15, 4.15, 4.22 | cycle between two roadmaps |

- Source locators checked against the text: those of the 15 sampled targets, of §§6.9, 11.1, 11.3, 11.7, 11.10, 12.1–12.5, 12.7, 13.3–13.6, 13.10 and of Layer 14, about 60 in nt21b, nt26, th24 and nt21; all at the cited pages.
- Library declarations opened at the pin: 14 (`Mathlib/NumberTheory/Bertrand.lean:225`, `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:275`, `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:65, 79, 88, 107`, `Mathlib/NumberTheory/MulChar/Basic.lean:130`, `Mathlib/NumberTheory/LegendreSymbol/ZModChar.lean:42`, `Mathlib/Data/ZMod/Units.lean:29`, `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:84, 104`, `TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean:91, 117, 161, 191`, `TauCeti/NumberTheory/ModularForms/LFunction/Basic.lean:192`); all exist as cited.
- Cross-roadmap citations resolved: 140 section or layer ids in 26 roadmaps, each found as a heading on main or at the open head; the text of PotentialAutomorphyInfrastructurePartII §§1.2, 1.3, 3.10, 8.7, 8.8, 8.15, 8.16, 9.7 and of the parent's §§4.23, 4.29, 4.30, 4.34–4.37 was read.
- Requests to suppliers: 5 used by the README; none is already provided at the supplier (GlobalGaloisDeformations §§5.7, 8.5; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.40, R07.4.20; DeformationAndDerivedPatchingAlgebra §5.4; CompletedCohomologyAndLocalGlobalCompatibility §0.7; PotentialAutomorphyInfrastructurePartII §8.16).
- Dependency check: `depcheck: 217 roadmaps, 2352 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line (it reads this README's citations only, see R01).
- Elaboration of `Suggested.lean`: `sorry` at lines 93 and 112 the only warnings; `#check @name` on the four declarations: no binder lost, types equal to §§14.4–14.5; single `import Mathlib` and one Tau Ceti module; no `set_option`, no sorry'd data.
- Automatic checks: all passed; no change outside the roadmap folder.
- Overlap check: read PotentialAutomorphyInfrastructurePartII, OrdinaryAutomorphicFormsAndModularityLiftingPartII, ModularityAndLanglandsExtensions, PotentialModularityAndCompatibleSystems, GL2ModularityLifting, GlobalGaloisDeformations, LocalGaloisDeformationRings, GL2AutomorphicRepresentationsAndTransfer; shared: `SP_n`, tensor functoriality lifting and the endpoints over `ℚ` with ModularityAndLanglandsExtensions (two owners, R01); the companion of nt26 Lemma 3.1 is owned by PotentialModularityAndCompatibleSystems §9.2 and cited; no declaration name of `Suggested.lean` occurs in another roadmap.

Source independence: 24 passages compared with 4 sources (nt21b, nt26, th24, nt21), none shared beyond lists of hypotheses that can be written one way; largest share nt26, 43 of 83 locators; contents compared with nt26: Layers 11, 12, 13 correspond to its §3, §4, §§5–6, Layer 13 after both is forced by §13.3 needing §11.10 and §13.4 needing §12.7, Layers 6, 9, 14 come from th24, nt21b, nt21: independent.

Research link: Layers 11–13 prove Newton–Thorne 2026 (Theorems 3.2, 4.1, 5.5, 5.9, 6.4), symmetric power functoriality for Hilbert modular forms, with Thorne 2024 level raising (Layer 6) and Newton–Thorne 2021 II patching (Layer 9); Layer 14 gives Newton–Thorne 2021 I Theorems A, B, E. Rests on the sources read.

## Not verifiable

- bbm82 Théorème 3.1.1 (Raynaud's embedding) and kw09 Proposition 9.3: cited by locator only, texts not readable; nt21b lines 324 and 827 cite them for the same purposes.
- The published pagination of nt26 (Ann. of Math. 203): the README cites the arXiv v2 pages, which is what was read.
- The content of the supplier sections other than those listed under "Verified sound" was checked by heading only.

## Source issues

- **Gap** in nt26 at proof of Lemma 3.1, p. 13: the source takes, among lifts of determinant `ε^{−2}ω`, the component through the local representation of `π`, whose determinant is `ε^{−1}`; it should be its twist by the unramified square root of `ε^{−1}ω`; affects the proof.
- **Misprint** in nt26 at Lemma 3.4(5), p. 16: the source says the embeddings are of a field `K` that is not defined; it should be `K_1`; affects nothing.
- **Gap** in nt26 at proof of Theorem 4.1, conditions (12)–(13), p. 26, and the level `V_0`, p. 31: the source puts only the ramification of `π` into `S` and the Iwahori level, while `σ` may be ramified elsewhere; it should include the ramification of `σ`; affects the proof.
- **Misprint** in nt26 at the definition of `𝔪_{G,Q}`, p. 32: for `i > r` the source's generator has `α^r β^{i−r}` times the first `i − r` of the `γ`; it should also carry the product of all `r` of them; affects the proof.
- **Gap** in nt26 at proof of Proposition 5.4, p. 39: the source deduces `p^a > M` from one element of order `t_1 > M`; for `p = 2`, `t_1 = 17`, `M = 16` this allows `p^a = 16`; it should use both places; affects the proof.
- **Misprint** in nt26 at proof of Proposition 6.1, p. 47: the source takes the prime `t` prime to the conductor of `π`; it should be the conductor of `π_a`; affects nothing.
- **Misprint** in nt26 at Corollary 6.2(2), p. 49: the source says places of `F` above `p`; it should be places of `E`; affects nothing.
- **Error** in th24 at proof of Lemma 7.3, p. 43: the source bounds the group above by `k^× SL_2(𝔽_{p^b})`; when the projective image is `PGL_2(𝔽_{p^b})` it should be `k^× GL_2(𝔽_{p^b})`; affects the proof.

## For the human reviewers

- The board's plan for this roadmap declares 14 requests to suppliers; the README at this head uses 5. The other 9 (among them Deligne–Lusztig transfer, Mœglin's packets, equivariant K-theory of the Steinberg variety) belong to routes the text no longer contains.
