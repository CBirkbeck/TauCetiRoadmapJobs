# Review of LocalGaloisDeformationRingsPartII (pull request #2278 at 7f3bea4)

**Verdict:** needs changes

## R01 (P2) — Layers 0–3 narrow rank-`n` statements of the source to rank two

**Location:** `TauCetiRoadmap/LocalGaloisDeformationRingsPartII/README.md` line 102 (0.1): "For `s ∈ S₂^f` and `μ ∈ (ℤ²)^f` put `s_τ = s₀ s_{f−1} ⋯ s₁`"; likewise 0.2–0.4, 1.1–1.4, 2.1–2.3, 3.1–3.9, and line 74 (`gap:rank-two-descent-kisin-modules`).

**Claim:** Tame types, orientation, eigenbasis matrices, shape, gauge bases, the monodromy derivation and condition, good presentations, monomial étale `φ`-modules, `V(w̃,D)`, the classification and the restriction statements are stated for `GL₂` only. The source states all of them for `GL_n`; with the rank-three copy in `LocalGaloisDeformationRings` §6.9 the library would hold two rank-specific copies and no general one.

**Witness:** BHHMS23 lines 630 (`τ(s,μ+η) : I_K → GL_n(𝒪)`), 827 (`M_n(R⟦u′⟧)`), 849, 863, 1008, 1075 (`GL_n(𝔽)`), 1104; `n = 2` starts only at line 1136 (§4.1). Instance lost: `n = 3`, `f = 1`, `s = (123)`.

**Repair:** State 0.1–0.4, 1.1–1.4, 2.1–2.3 and 3.1–3.9 for `GL_n`: `s ∈ S_n^f`, `μ ∈ (ℤⁿ)^f`, `η = (n−1,…,0)`, `r = ord(s_τ)`, `I ⊂ GL_n(𝔽⟦v⟧)`, the minor criterion for `1 ≤ i ≤ n`, goodness with every proper divisor `d` of `d(i)`, depth over all positive roots, and in 0.4 the loss `d − n + 1` of LLHL19, Proposition 2.2.16. The digit argument of 3.7 runs unchanged over all positive roots (`p > n` makes `r` prime to `p`). Keep every present rank-two formula as a Check. Restate the gap as "the §6.9 construction in rank `n` for `K′/K` of degree `r = ord(s_τ)` and every height `h`", the rest unchanged. 0.5 and Layers 4–7 stay at `n = 2`, where the source is.

## R02 (P3) — 3.6: the coefficient extension is not quantified

**Location:** README line 362: "are exactly the classes of `V(w̃, D)`, `D ∈ T(𝔽)^f`, after a finite extension of `𝔽` where needed for the unramified twists".

**Claim:** The statement does not say which field `D` lives over, nor when the extension is needed; read with `D ∈ T(𝔽)^f` it is false.

**Witness:** The README's own Check (line 366): `f = 1`, `s′ = 1`, `a = b`, `ρ = ω^a ⊗ ρ₀` with `ρ₀` unramified and irreducible over `𝔽`; `(1, (a,a))` is good, `ρ` is semisimple with inertia `ω^a ⊕ ω^a`, and is no `V(w̃,D)` over `𝔽`.

**Repair:** Replace the sentence by: "every `V(w̃, D)`, `D ∈ T(𝔽)^f`, is semisimple with `V(w̃,D)|_{I_K} ≅ τ̄(s′, μ′)`; conversely, for every semisimple `ρ : G_K → GL₂(𝔽)` with `ρ|_{I_K} ≅ τ̄(s′, μ′)` there are a finite extension `𝔽′/𝔽` and `D ∈ T(𝔽′)^f` with `ρ ⊗_𝔽 𝔽′ ≅ V(w̃, D)`, and `𝔽′ = 𝔽` when the two characters of `τ̄(s′, μ′)` are distinct". On the witness the two characters coincide and `𝔽′` is the quadratic extension.

## R03 (P3) — 7.5, third Check: the quotient is not a power-series ring

**Location:** README line 769: "leaving a nonzero power-series ring over `𝒪/p`, in which `ϖ ≠ 0` when `e(E/ℚ_p) ≥ 2`".

**Claim:** Modulo `Q₂ + P_{w̃,j,(3,0)}` one has `p = 0` and `t = −p = 0`, so `d₁₁d₂₂ = 0` survives as a relation; the quotient is not a power-series ring.

**Witness:** `Q₂ ∋ d₁₁d₂₂/(d₁₂* d₂₁*) + p`; with `p = 0` this gives `d₁₁d₂₂ = 0`, and the tails vanish modulo `p^{N−8}`. Quotient: `(𝒪/p)⟦d₁₁, d₂₂, x₁₂, x₂₁, …⟧/(d₁₁d₂₂)`.

**Repair:** Replace by: "leaving `(𝒪/p)⟦d₁₁, d₂₂, x₁₂, x₂₁, …⟧/(d₁₁d₂₂)`, a nonzero flat `𝒪/p`-algebra, in which `ϖ ≠ 0` when `e(E/ℚ_p) ≥ 2`". The conclusion of the Check is unchanged.

## R04 (P3) — Scope defines ownership by a range of the source's sections

**Location:** README line 7: "This Part owns the explicit rank-two tame theory of BHHMS23 §§2.3–4.3: characteristic-zero tame types `τ(s,μ+η)` with their orientation".

**Claim:** A roadmap does not say that it follows a source; the scope is the list of objects that follows the colon.

**Witness:** Layers 1, 2, 3, 4, 7 have exactly the scope of BHHMS23 §3.1.1, §3.1.2, §3.2, §4.1, §4.3 (section headings at BHHMS23 lines 797, 878, 1003, 1136, 1617).

**Repair:** Write "This Part owns the explicit tame theory needed for these rings: characteristic-zero tame types `τ(s,μ+η)` …" and keep the locators at the claims, where they are.

## R05 (P3) — The description omits a supplier that is not on main

**Location:** Pull request description: "Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite."

**Claim:** `ModpRepresentationsOfGL2OverLocalFields` is a supplier, is not on main and is not in the list of open pull requests the prose gives.

**Witness:** README lines 78–81 (`### From TauCetiRoadmap.ModpRepresentationsOfGL2OverLocalFields`, with `gap:deligne-lusztig-reduction`) and the `*Needs:*` lines of 0.1, 0.2, 0.4, 0.5, 3.2, 3.4, 4.1, 4.3, 5.6; the roadmap is open pull request #2282.

**Repair:** Add "#2282 (ModpRepresentationsOfGL2OverLocalFields)" to the list "In open pull requests of ours", and say that the README declares eight supplier gaps under `## Exact supplier contracts`.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1 tame type | `f=1`, `s=w`; `p=5`, `μ=(1,0)`; `p=7`, `s=1`, `μ=(0,0)` | `α′₀=(μ₁+1,μ₂)`, `α′₁=(μ₂,μ₁+1)`; `a′^(0)=(2,10)`; reduction `ω ⊕ 1` | agrees with BHHMS23 lines 618–640 | R01 |
| 0.3 orientation | `f=1`, `s=w`, `p=5` | `s′_or = (w, 1)`; `w⁻¹(2,10)=(10,2)` dominant; identity (13) reduces to `s_{j′}⁻¹(μ+η)` | holds | R01 |
| 0.4 depth loss | `n=2`, `N=13`; `N=1` | LLHL19 Prop. 2.2.16 (p. 14): `d−n+1 = N−1`; `13 → 12`; `1 → 0` | holds for `N ≥ 2`, `N=1` by definition | R01 |
| 0.5 weights | `f=1` principal series; scalar type; twist `f=2`, `c=1` | dimensions `(r+1)+(p−r)=p+1`; root coordinate `p−1`, not 1-deep; `q−1 ∤ p` | holds; hypothesis of BHHMS23 line 722 kept | none |
| 1.1 minors | `λ=(2,1)`, `(3,0)`; `P`, `D=diag(1,2)`, `C=E₁₂` | exponents `(1,3)`, `(0,3)`; `Ad(P⁻¹D)C=E₂₁/2`, `Ad(DP⁻¹)C=2E₂₁` | holds | R01 |
| 1.2 shape | `diag(v²,v)`; `w·diag(v²,v)`; `[[ev²,0],[βv,dv]]`, `β≠0` | first two: `t^(2,1)`, `wt^(2,1)`; third lies in the `w`-coset, so excluded | definition discriminates | R01 |
| 1.3–1.4 gauge | `U₁`, `U₂`, `U₃` degree bounds; `R=𝔽[ε]` | degrees `(2,≤0;≤2,1)`, `(≤1,1;2,≤1)`, `(1,≤1;≤1,2)`; ambiguity `(1+ε𝔽)^{2f}` | matches Tables 1–3 and BHHMS23 line 863 | R01 |
| 2.1 derivation | trivial rank one, `u′e` | both sides `−p(u′)^p λ e` using `λ=(E/p)φ(λ)`; without `E`: differs | holds | R01 |
| 2.2–2.3 | `h=1,2,3`; `N=12` | orders `0,1,2`; `L−(h−1)−t = 9, 8`; `2h−3=3 ≤ 11` | holds | R01 |
| 3.1–3.2 good | `f=1`, `s=w`: `μ=(a,a)`, `(1,0)`, `(3,1)` with `p=5` | exponents `(p+1)a`; `1, p`; `8 ≡ 2 (mod 6)` | holds | R01 |
| 3.5 twists | `λ=(c,…,c)`; `(c,c⁻¹)`; rank-one variance | `nr(c^f)`; trivial; `V*` gives `α`, `T_𝔽` gives `α⁻¹` | holds | R01 |
| 3.6 classification | `f=1`, `s′=1`, `a=b`; `a≢b`; `s′=w` | `ω^a⊗ρ₀` not a `V(w̃,D)` over `𝔽`; other two cases need no extension | statement imprecise | R02 |
| 3.7 cyclotomic free | 2-deep digits; `ρ̄=ω⊕1`; normalized data | `2 ≤ \|δ_j∓1\| ≤ p−2`, sum `< p^{f′}−1`; `a−b=1` fails; `a−b=r+1 ∈ (12,p−12)` | holds; `p ≥ 7` | R01 |
| 4.2 residual module | `N=12`; `U₂` | coordinates `r_j`, `r_j+2 ∈ [12, p−12]`; pivots of degrees `1`, `2` | holds | none |
| 4.3 `θ` | `f=1`, `s=1` | `W(ρ̄)={Sym^r⊗det, Sym^{p−3−r}⊗det^{r+2}}`; each lies in exactly two of the three twisted reductions | holds | none |
| 5.1 union | two kernels `I, J` | union `I∩J`, intersection `I+J` | holds | none |
| 5.2 charts | `det A_i − unit·z³` for `i=1,2,3` | `z²`, `z¹` coefficients vanish on `G₁..G₄`; `z⁰` is a multiple of `G₅`; chart 2: `z¹ = ud(a²−a+1)G₅` | consistent with finite height | none |
| 5.3 `crossing_prime` | `d=0`; `u=x₁`; `u₂=1+x₁x₂`; `n+2=2` | unit; reducible; ideals differ; Krull dimension 3 | holds; no one-tactic proof | none |
| 5.4 Jacobian | chart 2 identity in `s=xy`; outer charts; `e₁₁*=0` | coefficients `0,0,0`, constant `κp³(κ−1)²`; `pH_X+cY(XH_X−2YH_Y)=−2p²`; zero row | holds | none |
| 5.5 Newton | `N=12`; `n=6`; `e₁₁*=X=p³` | `n=7`, step `p⁴`; `2(n−3)=6`; `v(G₅)=7`, no zero nearby | holds; unit hypothesis needed | none |
| 5.7–5.8 | `f=1`; `N=9` | `8−5=3`, `3+4−2=5=f+4`; `ψ ≡ id (mod p)` | holds | none |
| 6.1 single type | `f=1`; `f=2`, `λ=((3,0),(2,1))` | kernels `P_{0,(3,0)}`, `P_{0,(2,1)}`; `P_{0,(2,1)}+P_{1,(3,0)}` | agrees with BHHMS23 line 1319 | none |
| 6.3 special fibre | `m ≤ f`; `U₂`, `λ=(2,1)` | free variables `3f−m ≥ 2f`, so `2f` cancel; `𝔽⟦U₁..U₆⟧/(U₁U₂)` | holds | none |
| 7.1 substitutions | `U₁→`Table 4, `U₂`, `U₃→`Table 5 | `v·M₁₁ = z²d₁₂*+z(c₁₂−pd₁₂*)+(b₁₂−pc₁₂)`; `c₁₁=−pd₁₁`; `A₂·w·diag(1,v⁻¹)` | matches Figure 2 | none |
| 7.3 multiple types | pole bound; `a₁+a₂` | `(p−1)k ≤ p−2 ⇒ k ≤ 0`; `a₁+a₂ ≡ 2` | holds | none |
| 7.4 `Q` ideals | images of `P^poly_{(2,1)}` under 7.1; `p=5` points | six generators each, equal to the displayed `Q₁`, `Q₂`, `Q₃`; all three vanish at the listed points | holds | none |
| 7.5 membership | elimination; `ϖ` in place of `p` | `c₂₁+(2p/a₂)d₂₁*`; `a₂ ≡ r+2` or `−r`, unit; quotient `(𝒪/p)⟦…⟧/(d₁₁d₂₂)` | theorem holds; Check wording wrong | R03 |

- Source locators checked against the text: 52 (BHHMS23 37, GHLS17 2, Elkik73 2, Hamann75 2; LLHL19 5 and LLHLM18 4, read through the sources service); statement, hypotheses and printed page agree in each.
- Library declarations opened at the pins: `PowerSeries.exists_isWeierstrassFactorization` (`WeierstrassPreparation.lean:814`), `isWeierstrassDivision_weierstrassDiv_weierstrassMod` (`:561`), `IsRegularLocalRing` (`RegularLocalRing/Defs.lean:52`, PID instance `:80`), `MvPowerSeries.finSuccEquiv` (`MvPowerSeries/Equiv.lean`), `TauCeti.PowerSeries.isRegularLocalRing` (`PowerSeries.lean:157`), `TauCeti.IsRegularLocalRing.uniqueFactorizationMonoid` (`UniqueFactorization.lean:59`, dimension `≤ 2` only), `TauCeti.inertiaTameCharacter`. No deformation ring, Kisin module, étale `φ`-module or Serre weight exists at either pin.
- Cross-roadmap citations resolved at the open heads or on main: 39 section citations in 8 roadmaps, all present with the content cited; fundamental-character normalization agrees with `ModpRepresentationsOfGL2OverLocalFields` (geometric Artin map, `ω₁ ∘ Art(u) = ū`).
- Gate: every check passed. Dependency check: `depcheck: 237 roadmaps, 2141 edges, 0 problem(s)`. Nothing changed outside the folder.
- Elaboration: `sorry` the only warning; `#check @crossing_prime` equals the first assertion of 5.3; `simp`, `infer_instance`, `aesop` and `exact Irreducible.prime _` do not close it.
- Gaps: the eight in the README are precise and none is provided by an earlier roadmap. The design plan also lists `kummer-tower-tame-quotient` and `regular-local-factorial`; the README proves the first as 3.4 and cites `PurityForFlatCohomology` §7.4 for the second.
- `HilbertModularVarietiesAndShimuraCurvesPartII` (open) cites this roadmap as `T.0–T.7` and declares `gap:tame-types`, `gap:single-type-rings`, `gap:breuil-mezard-pbt` against it; its `gap:power-series-cancellation` and this roadmap's `gap:power-invariance` ask `DeformationAndDerivedPatchingAlgebra` for the same theorem.
- Overlap check: read HilbertModularVarietiesAndShimuraCurvesPartII, LocalGaloisDeformationRings, PotentialAutomorphyInfrastructurePartII, EllipticCurveModularityWild3Adic, CompletedCohomologyAndLocalGlobalCompatibilityPartII (the other two lists are empty); nothing shared: rank-three charts are owned by LocalGaloisDeformationRings §§6.9–6.33, the rank-two charts here.

Source independence: 29 passages compared with 6 sources, none shared beyond 9 consecutive words that the mathematics forces; largest share BHHMS23, 60 of 76 locators; contents compared with BHHMS23: Layers 1, 2, 3, 4, 7 have the scope of §3.1.1, §3.1.2, §3.2, §4.1, §4.3, Layers 0, 5, 6 do not, and the order is forced by the `*Needs:*` lines of 1.1, 2.1, 4.2, 5.2, 6.1, 7.1 except for the position of Layer 3: not a one-to-one mapping.

## Not verifiable

- Kisin06, Corollary 1.3.15 (2.1): not in the sources cache and not fetched; cited through BHHMS23 line 904.
- LLHLM23, Lemma 7.2.10(3) (`gap:kummer-restriction-invariants`): not fetched; cited through BHHMS23 line 1103.
- Ownership against open pull requests was checked only on the 206 heads listed for this job.

## Source issues

- **Error** in BHHMS23 at Proposition 3.2.7, p. 23: the source says the semisimple `ρ` over `𝔽` with the given inertia are exactly the `V(w̃,D)` with `D ∈ T(𝔽)`; it should allow a finite extension of `𝔽` when two inertial characters coincide; affects a stated result.
- **Gap** in BHHMS23 at §3.1.2, p. 20, used in the proof of Proposition 4.2.1, pp. 28–29: the source states the monodromy derivation for algebras topologically of finite type and applies it to complete local rings; it should state it for those rings; affects the proof.
- **Misprint** in BHHMS23 at Proposition 3.1.9, p. 21: the source says the remainders lie in two-by-two matrices in a section written for rank `n`; it should be `n`-by-`n` matrices; affects nothing.
- **Misprint** in BHHMS23 at Table 5, final note, p. 45: the source says the constants and tails come from Tables 1–2; it should be Tables 2–3; affects nothing.

## For the human reviewers

- **Licence.** README 5.2, 7.1 and 7.4 restate the chart matrices, generators and change of variables of BHHMS23 Tables 1–5 and Figure 2 (pp. 38, 41–45) in the roadmap's own notation; the arXiv licence of v7 was not read.
- **Scope.** 60 of 76 locators are to one article (BHHMS23, Invent. Math. 2023); five of eight layers have the scope of one of its sections (`README.md` lines 171, 237, 288, 432, 660).
- **Licence.** The package's `sources.toml` records four of the eight references; Kisin06, LLHL19, LLHLM18 and LLHLM23 have no entry, and Kisin06 and LLHLM23 were not read.
