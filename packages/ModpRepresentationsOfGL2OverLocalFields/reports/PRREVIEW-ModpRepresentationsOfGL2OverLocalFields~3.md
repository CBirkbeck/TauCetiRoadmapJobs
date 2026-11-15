# Review of ModpRepresentationsOfGL2OverLocalFields (pull request #2282 at f40e12e)

**Verdict:** needs changes

Full review of the head (568 lines changed since e9433e9). Three P3 findings, none blocking; the gate passes.

## Previous findings

- The previous review (at e9433e9) raised no finding of its own. Its carried item R02 of the first review — not repaired: deferred (D01); see below.

## R01 (P3) — Layer 2 dependency list omits Layer 1

**Location:** TauCetiRoadmap/ModpRepresentationsOfGL2OverLocalFields/README.md:1408 — “Layer 0; PotentialAutomorphyInfrastructure §3.7; CompletedCohomologyAndLocalGlobalCompatibility §0.1 (the `F = ℚ_p` functor of §2.1); …”

**Claim:** The layer's `### Dependencies` names Layer 0 as its only layer of this roadmap, but §2.4 uses §1.2 (the split form of the filtration by compact inductions, stated there for every finite `F/ℚ_p`).

**Witness:** README:1214 “*Needs:* §§0.1, 0.3, 0.4, 0.6, 1.2, 2.3”, and README:1207 “(absolutely irreducible with central character, §1.2)”.

**Repair:** Start the list with “Layers 0 and 1 (§1.2, used in §2.4); PotentialAutomorphyInfrastructure §3.7; …”.

## R02 (P3) — Layer 4 dependency list omits PadicLocalLanglandsForGL2Qp §0.3

**Location:** README:1881–1886 — “Layer 0 (§0.1); NoncommutativeAndEquivariantIwasawa §§0.5, 0.7, 0.8, 0.10–0.11, F.1 … Mathlib commutative algebra; Layer 3 (§3.1).”

**Claim:** §4.1 and §4.6 both need the Pontryagin duality of PadicLocalLanglandsForGL2Qp §0.3 (the dual `V^∨` in the definition of `dim_G V`, and `Proj_U(τ) = (Inj_U(τ^∨))^∨`); the layer's list has no entry for that roadmap.

**Witness:** README:1671 “PadicLocalLanglandsForGL2Qp §0.3 (Pontryagin duality); §0.1.” and README:1832 “SmoothRepresentationsOfLocalGroups *smooth-rep-category*; PadicLocalLanglandsForGL2Qp §0.3; §4.4.”

**Repair:** Insert “PadicLocalLanglandsForGL2Qp §0.3 (Pontryagin duality, §§4.1 and 4.6);” after the CompletedCohomologyPartII entry.

## R03 (P3) — `ℤ/fZ` in the Conventions

**Location:** README:163 — “`F` is unramified of degree `f ≥ 1`, `q = p^f`, `J = ℤ/fZ` indexes the embeddings”

**Claim:** The index set is `ℤ/fℤ`; the same bullet list fixes `Z` as the centre of `G`, so `ℤ/fZ` is a different expression.

**Witness:** README:151 “`Z` the centre”; README:1522 writes the analogous set as `ℤ/2f`.

**Repair:** Replace by “`J = ℤ/fℤ` indexes the embeddings”.

## Deferred findings

- D01 — resolved: packages/ModpRepresentationsOfGL2OverLocalFields/design/plan.json now lists all seven gap slugs the README states, including the two that were missing.

## Verified sound

| Statement | Instances tried | Computed on the roadmap side | Computed on the source / control side | Result; change |
|---|---|---|---|---|
| §0.1 torsion admissibility (sample) | `H = 1`, `V = L/𝒪`; `V = ⊕_ℕ k` | `(L/𝒪)[p^j]` has length `j·e`; `V^H[p]` of infinite length | CDN23 line 430: `π^K[𝔪^j]` of finite length, all `K`, `j ≥ 1` | Agree; none |
| §0.5 coherence, `isFinitelyPresented_ker` (sample, headline) | `ϖ = 0`; compact `H`; finite-rank versus finite-length `W` | `ϖ = 0`: defining set empty, quotient is `G`; `p^a` kills `V`, so `W_i/p^a` still presents | SHOTTON20 lines 469–479, 506–515; SERRE-TREES lines 3281–3289; CDN23 lines 463–474 | Holds; none |
| §0.7 five-term criterion (sample) | `A = B = 0`; `D = E = 0` | `C = ker(D → E)`; `C = coker(A → B)` | CDN23 lines 1148–1154: `0 → coker α → C → ker δ → 0` | Agree; none |
| §1.3 `isFinitelyPresented_of_finite` (headline) | `F ≠ ℚ_p` supersingular; one-tactic probes | Fails for `F ≠ ℚ_p`; Lean is on `ℚ_[p]` only | CDN23 lines 729–736 (“très spécifique au cas `F = ℚ_p`”) | Agree; none |
| §1.5 bounded semisimple quotients (headline) | `V = π ⊕ π`; `V = I(σ)` | Semisimple quotients of length ≤ 2 with one class; unbounded for `I(σ)` | Bound `N` ⇒ `rad V` is a finite intersection ⇒ `V/rad V` of length ≤ `N`; CDN23 line 737 | Equivalent forms; none |
| §1.6 smooth dual (sample, headline) | trivial; Steinberg; `I(σ)`; `⊕_ℕ St` | dims `1`, `0`, `∞`; `0` with infinite length (not of finite type) | CDN23 lines 787–817; KOHLHAASE17 lines 660, 685 | Agree; none |
| §1.4 Ext support | `p = 2, 3, 5` | `dim Hom_cont(ℚ_p^×, k′) = 2` (odd `p`), `3` (`p = 2`); `δ² ≠ 1` exists iff `p > 3`; `δ(4) = 4` at `p = 5` | CDN23 lines 765–783; supplier §5.2 lists blocks for `p = 2, 3` | Holds; none |
| §2.2 Hecke operator on `H¹(N₀, χ∘det)` | `ℚ_p`; `ℚ_{p²}`; `ℚ₅(√5)` with `t = diag(2ϖ, 1)` | Multiplier `q/c`: `1`; `p ≡ 0` on `𝒪_F/p`; `ϖ/2`, value `ℓ(3ϖ) = 3`, square `5/4 ∈ 5𝒪_F` | Transfer of `𝒪_F → c𝒪_F` is multiplication by `q`; EMERTON2 line 1497 is `GL₂(ℚ_p)` only | Nilpotent iff `ef ≥ 2`; none |
| §2.4 `𝒞`, finite length, subobjects (sample, headlines) | `χ∘det`; `Ind_B^G`, `K_n`-invariants; `U = 𝒪`; `F = ℚ_{p³}` | `dim Ind^{K_n} = (q+1)q^{n−1}`; constants not torsion; Le's `π` has `dim π^{K₁} = ∞` | CDN23 lines 820–834, 855–860; VIGNERAS11 line 723; LE19 lines 30–31, 46 | Agree; R01 touches its dependency line only |
| §2.6 `exists_coind_approximation_of_lattice` (headline) | `Θ = 0`; `Π = L` trivial; `F = ℚ_p` supersingular reduction; `σ = 𝒪` | `M = 0` works for the first two (cokernel `0`, `𝒪`); no `σ` for the third; `Σ ϖ_L^n 1_{U_n}` continuous, not locally constant | CDN23 lines 841, 917–920; Mathlib `coindV`: `f (φ g * h) = π g (f h)` | Not vacuous; hypothesis `ef ≥ 2` needed; none |
| §3.2 translation map | `p = 17`, `λ = (5,0)`, `ω = ±1`; `f = 2`, `ω = (1,0)` | `(0,−11)`, `(−1,−10)`; `((6,0),(−1,−10))` | BHHMS23 lines 702–708, branch read from `δ_{j+1}` | Agree; none |
| §3.4 `W(ρ̄)` against `W_BDJ(ρ̄)` | `p = 17`, `ω⁶ ⊕ 1`; `p = 5`, `ω³ ⊕ 1`; irreducible `ω₂⁶ ⊕ ω₂^{102}` | 2 weights each side; `{Sym², det³}` against 3 weights; `r = 5, b ≡ 0` and `r = 11, b ≡ 5` | BDJ10 lines 1106–1116: two solutions iff `n ≡ n_B`; here `3 ≡ −1 (mod 4)`; lines 872–889 | Roadmap's corrected comparison holds; source issue below |
| §3.5 Diamond socle modules (sample) | `𝒟 = ∅`; all weights; `f = 1`, `p = 17`, `s = −1` | `0`; `⊕σ`; `6 + 10 + 12 + 4 = 32`, `dim D₁ = 2`, values `5, 1` (and `6, 13`) at `diag(3,1)` | BP12 lines 3025, 3064 (pp. 75–76), 3302 (p. 83); `3⁵ ≡ 5`, `3^{15} ≡ 6`, `3⁴ ≡ 13 (mod 17)` | Agree; none |
| §4.1 Gelfand–Kirillov dimension (sample) | `V = 0`; `V = k`; `ℤ_p^d`; `U = 1` | `−∞`; `0`; `d` with growth `p^{rd}`; `0 − 0 = 0`, no growth exponent | BHHMS23 lines 2366–2383; supplier §0.11 assigns `−∞` to the zero module | Agree; R02 touches its dependency line only |
| §4.4 graded Iwahori algebra (sample) | `f = 1`; general `f` | `dim gr¹ = 2f`, `dim gr² = f(2f+1) + f`; commutator of `u`, `l` is `(1+p+p², −p; p², 1−p)`, value `1` | BHHMS23 lines 2786–2807 | Agree; none |
| §4.7 multiplicity criterion (sample, headline) | `V` finite-dimensional; `V = C^∞(I/Z₁, k)`, `f = 1` | `dim = 0 < f`; `Hom_I(W_{1,3}, V)` of dimension `7 = 1 + 4f + 2f²` against `1` | BHHMS23 lines 2817–2834 | Agree; none |
| §5.1 multiplicity in `W_{χ,3}` | `q = 5`; `p = 5`, `f = 2` | `e²`, `f²` both of weight `α² = α^{−2}`; exponents `±1, ±5, ±2, ±10, ±6, ±4` distinct mod 24 | BHHMS23 line 2901 asserts multiplicity ≤ 1 for all `p > 3`; `4p^{f−1} < q − 1` iff `q ≠ 5` | Roadmap's exclusion `q ≠ 5` is right; source issue below |
| §6.2 box torsion filtration (sample) | `f = 1`, `B = 3`; `n = 1`; `f = 2`, `ε = (+1, −1)` | `a = 0, 1` invariant, `a = 2, 3` second layer; `d = (0, 1)`, so `B₀` odd, `B₁` even | BHHMS23 lines 3039–3041, 3102–3121: `B_i ≡ (1 − ε_{i−1})/2` | Agree; none |
| §6.7 enlargement of a tame socle (sample) | `f = 1`, `p = 23`; `m = (2, 3)`; `f = 2` | Lengths `8, 4, 4`; `20, 10, 10`; `12` per `V_σ`, `48` and `16` | BHHMS23 lines 3505–3523, 3610–3615; `8 < 11 < 15` | Agree; none |
| §7.4 second radical layer (sample) | `w g w⁻¹` for `g = (a, b; pc, d)` | `(d, c; pb, a)` | BHHMS23 lines 3711–3735, 3774–3777 | Agree; none |
| §7.6 local bound (headline, not statable) | `f = 1`; `f = 2` | `≤ 1`; `≤ 2` against `dim G = 8` | BHHMS23 lines 3816–3828: hypotheses (i)–(iii), central character, 8-deep | Agree; docstring names the missing carriers |
| §8.5 coinvariants of the lattice (sample) | dimension count | `dim R/pR = (3f + 1) dim P_σ` | BHHMS23 lines 4107–4110, 4144–4146, 4161–4164 | Agree; none |
| §8.6 radical truncation (sample, not statable) | `f = 1`, `p = 11` | `4 dim P_σ` | BHHMS23 lines 4197–4229; three `K₁/Z₁` subscripts at lines 4206, 4208 | Agree; misprint recorded below |
| §9.3 relative projectivity (sample, not statable) | `Q = T_σ`; `Q = σ`; bounds | `5 < r_i < p − 7` forces `p ≥ 17`, `r_i ∈ {6, …, 9}` at `p = 17` | BHHMS23 lines 4256–4278 | Agree; none |
| Conventions, Artin normalisation | `F = ℚ₅`, `u = 2` | `ω_1(geometricArtinMap u) = 2`; arithmetic would give `3` | Tau Ceti `localCyclotomicCharacter_artinMap_unit`: `N(u)⁻¹`; `geometricArtinMap = (artinMap)⁻¹` | Agree; R03 is a notation slip in the same list |

- Source locators checked against the text: 116, in 13 sources (CDN23 19, BHHMS23 37, SHOTTON20 10, EMERTON1 11, HU12 10, BP12 7, HW22 6, VIGNERAS11 5, LE19 3, BDJ10 2, KOHLHAASE17 2, SERRE-TREES 2, EMERTON2 2); all 15 seeded targets among them; the README flags no locator as unverified.
- Library declarations opened at the pins: 47 (29 Tau Ceti, 18 Mathlib), each found in the file the README names; statements read for 15 (for example `TauCeti/Algebra/Module/ProjectiveCover/Multiplicity.lean:158`, `TauCeti/Algebra/Module/Injective/Envelope/Existence.lean:109`, `TauCeti/NumberTheory/ClassFieldTheory/Local/ExplicitCyclotomicSymbol/ArtinMap.lean:311`, `Mathlib/RepresentationTheory/Continuous/Basic.lean:541`).
- Cross-roadmap citations resolved: 31 sections of 11 roadmaps (7 at their open heads, 4 on main) and the 14 named targets of SmoothRepresentationsOfLocalGroups; none missing. All 34 former `MP.*` identifiers cited by HilbertModularVarietiesAndShimuraCurvesPartII and ScholzeFunctorAndModpCohomologyOfTheLubinTateTower are in the README's mapping table.
- Declared gaps: 7, each with the same slug in the plan and the README, a named supplier and section, and a single statement with its hypotheses. LocalGaloisDeformationRingsPartII declares `gap:deligne-lusztig-reduction` on this roadmap (§3.2); not raised, under the gap rules.
- Gate at f40e12e: every check 0, `OK`. `lake env lean` on `Suggested.lean`: 7 `sorry` warnings (lines 103, 133, 145, 163, 178, 192, 214), nothing else. Elaborated signatures compared with the README statements for all 12 declarations: no binder lost, generality equal.
- Dependency check: `depcheck: 244 roadmaps, 2233 edges, 0 problem(s)`; no UPWARD or CYCLE line. Files changed outside the folder: 0.
- Headlines and padding: the 7 statable headlines are stated; 5 not statable are named in the module docstring with the missing carriers. One-tactic probe (`simp`, `rfl`, `infer_instance`, `trivial`, `simp_all`, `exact?`) on a scratch copy: none of the 7 theorems closes. No declaration name is shared with another roadmap's `Suggested.lean` or the pins.
- Pull request text: title and description read against the head; it adds the roadmap, lists the open suppliers, and no sentence is contradicted.

Overlap check: read HilbertModularVarietiesAndShimuraCurvesPartII, PadicLocalLanglandsForGL2Qp, LocallyAnalyticRepresentationsOfLocalGroups, ScholzeFunctorAndModpCohomologyOfTheLubinTateTower, LocalGaloisDeformationRingsPartII, SmoothRepresentationsOfLocalGroups. Weight coordinates, `W(ρ̄)`, Diamond modules, the Gelfand–Kirillov bound and the gluing lattice: owner this roadmap, the first and fifth cite it. Torsion admissibility and the finite-presentation calculus: owner this roadmap, the fourth cites it. Smoothness, the contragredient and induction: owner SmoothRepresentationsOfLocalGroups, cited. Blocks and the `GL₂(ℚ_p)` classification: owner PadicLocalLanglandsForGL2Qp, cited. Nothing shared with LocallyAnalyticRepresentationsOfLocalGroups.

Source independence: 16 passages compared with 8 sources (CDN23, BHHMS23, SHOTTON20, HU12, BDJ10, LE19, HW22, SERRE-TREES), none shared beyond statements the mathematics forces (longest common run 5 words); largest share BHHMS23, 46 of 154 locators; contents compared with BHHMS23: independent (its §§3–4 and 8 are absent, Layer 3 joins its §2 with BP12 §13 and BDJ10 §3, Layer 5 joins its §6.1–6.2 with LMS22, HW22 §2 and SERRE-LRFG, and the order of Layers 4–9 is forced by the *Needs* lines of §§4.7, 6.6, 7.5–7.6, 8.6 and 9.1).

## Not verifiable

- SERRE-LRFG, Part III, Chapters 14–15: settled as uncertified; cited by locator only.
- BARTHEL-LIVNE94, Proposition 18, Theorem 30, Theorems 33–34, Corollary 36: settled as waived; read only through the citations in HU12, BP12 and CDN23.

## Source issues

- **Error** in BHHMS23 at Proposition 2.4.2, p. 16: the source says the Buzzard–Diamond–Jarvis set equals the `2^f` translated weights whenever `μ − η` is 1-deep; it should be their regular part, with equality for irreducible `ρ̄` or 2-deep `μ − η` (`f = 1`, `ω^{p−2} ⊕ 1` has three weights); affects a stated result.
- **Error** in BHHMS23 at Lemma 6.1.1(i), p. 56: the source says every character other than `χ` occurs at most once in `W_{χ,3}` for all `p > 3`; it should exclude `q = 5`, where `e²` and `f²` have the same weight `α²`; affects a stated result.
- **Misprint** in BHHMS23 at the proof of Corollary 7.3.4, p. 84: the source writes the projective envelope over `K₁/Z₁` three times; it should be the envelope over `K/Z₁` of the statement; affects nothing.
- **Gap** in CDN23 at Proposition 1.30(b), proof, p. 21: the source derives the Steinberg clause for `F ≠ ℚ_p` from a theorem of Emerton stated for `GL₂(ℚ_p)` only; it should give an argument valid for every `F`, as the README's §2.2 does; affects the proof.

## For the human reviewers

- SERRE-LRFG is uncertified and BARTHEL-LIVNE94 waived: their wording could not be compared with the README (§5.4; §§1.1, 2.4). BHHMS23, the source with the largest share, was read with its contents.
- The README corrects two statements of BHHMS23 (Proposition 2.4.2 at README:1529–1533, Lemma 6.1.1(i) at README:1906–1908) and replaces one proof step of CDN23 (README:1140–1141); each was recomputed here, and a specialist may wish to confirm them.
