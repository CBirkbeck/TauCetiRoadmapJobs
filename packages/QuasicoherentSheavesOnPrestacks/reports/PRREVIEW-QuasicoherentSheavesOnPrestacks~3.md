# Review of QuasicoherentSheavesOnPrestacks (pull request #2450 at 6e816c2)

**Verdict:** accepted

No findings.

## Previous findings

- The previous review of this head listed none. The two of the review before it stay repaired at this head:
  - R01 (7.3 locator): "`QCoh` is the right Kan extension along the Yoneda embedding and so carries colimits of prestacks to limits: GR-I Chapter I.3, §1.1.3, p. 144; SAG Lemma 6.2.1.12, p. 488" — repaired (GR-I line 7354; SAG line 17758).
  - R02 (description): "proved by truncation and comonadicity, and agrees with the descendable descent of EnhancedDerivedSheaves" — repaired; it matches the route of 3.2.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| 1.3 t-structure, flatness | `ℤ → ℚ`; `ℤ → 𝔽_p`; `A = 𝔽_p ⊗ᴸ_ℤ 𝔽_p` | `ℚ ⊗ᴸ ℤ/p = 0`, not conservative; `𝔽_p ↦ 𝔽_p ⊗ᴸ 𝔽_p`, `π₁ = 𝔽_p`, not t-exact; heart `Mod(π₀A) = Mod 𝔽_p` | holds; HA lines 46134 (p. 1202), 47511, 47519, 47532 | none |
| 1.5 limits of categories | empty diagram; pairs in `D∞(ℤ)²` | terminal category; `(ℤ, ℚ)`: ℚ not perfect, not dualizable; `(ℤ, ℤ[1])`: both evaluations iso; `(ℤ, ℤ²)`: evaluation rank 4 → 1 | holds; HA lines 26640, 23655, 26834, 26863, 31630 | none |
| 2.1 prestacks, points | zero ring; `Spec 𝔽_p ×_{Spec ℤ} Spec 𝔽_p` | `Spec 0` has 1 point at 0, ∅ has none; `CRing`: `Spec 𝔽_p`; `AnRing`: `π₁ = 𝔽_p` | holds; SAG lines 17853, 17867 (p. 491) | none |
| 2.3 formal properties | `BΓ × Spec 𝔽₂`, `Γ = ℤ/2`; `Spec ℤ` | `π₀ Map(O, O[1]) = H¹ = 𝔽₂`, pointwise `π₋₁A = 0`; `Ext¹_ℤ(ℤ/p, ℤ/p) = ℤ/p` both sides | holds; SAG lines 17905, 17758; GR-I lines 7322, 8013 | none |
| 2.4 change of test rings | `ι_!` on `Spec 𝔽_p ×_ℤ Spec 𝔽_p`; `ι^*Spec(𝔽_p ⊗ᴸ 𝔽_p)` | `Spec 𝔽_p` vs `Spec(𝔽_p ⊗ᴸ 𝔽_p)`; `Hom(π₀B, R)` gives `D∞(𝔽_p)`, unit of `QCoh(Y)` has `π₁ = 𝔽_p` | holds; SAG line 17845; GR-I line 7379 (pp. 145–146) | none |
| 3.1 fpqc topology, hypercovers | empty family; `ℤ → 𝔽_p × ℤ[1/p]`; `𝔽_p → 𝔽_p ⊗ᴸ 𝔽_p` | covers only 0; `𝔽_p` factor has p-torsion, not flat; `π₁(B ⊗ B) = 𝔽_p²` vs `π₁B = 𝔽_p` | holds; SAG lines 79377–79409, 64259, 64326, 65837, 65851 | none |
| 3.2 flat hyperdescent | identity; `ℤ → ℤ[1/2] × ℤ[1/3]`; `ℤ → 𝔽_p × ℤ[1/p]` | constant nerve; `I = ℤ[1/6][−1]`, `I^{⊗2} → ℤ ∈ Ext²(ℤ[1/6], ℤ) = 0`; `B ⊗ B = B`, equalizer `B ∋ (1,0)` | holds; SAG line 79502 (p. 2177) | none |
| 3.3 sheafification, Čech | `∅ → Spec 0`; `Spec 𝔽_p → Spec ℤ` | `0 = 0`; totalization kills ℚ, not `D∞(ℤ)` | holds; SAG lines 17889–17903; GR-I lines 7463, 7474 | none |
| 4.2 affine pushforward | `R → R[t]`; classical `ℤ → 𝔽_p` twice | `f_*O = R[t]`, base change `R′[t]`; `𝔽_p ⊗ᴸ 𝔽_p` (`π₁ = 𝔽_p`) vs `𝔽_p` | holds, flatness needed classically; SAG lines 18368, 18458; GR-I line 7740 | none |
| 5.3 `QCoh(h_X) ≃ Dqc(X)` | `ℙ¹_k`; `⨿_ℕ Spec ℤ` | coker of `k[t] ⊕ k[t⁻¹] → k[t,t⁻¹]` is `k·t⁻¹ = H¹(O(−2))`; `∏_ℕ D∞(ℤ)` both sides | holds; SAG line 17929; Stacks lines 86, 102, 145 | none |
| 5.4 schematic pushforward | `ℙ¹_k → Spec k`; `Spec 𝔽_p → Spec ℤ` twice | `H⁰(O(−2)) = 0`, `H¹ = k`, so `k[−1]`; Tor-dependent: `π₁ = 𝔽_p` vs 0 | holds; Stacks lines 311, 2312, 2351 | none |
| 6.2 t-structure | `𝔽_p` on `Spec ℤ`; `BG_m`; doubled-origin plane | pullback to `𝔽_p` has `π₁ ≠ 0`; heart ℤ-graded groups; `U ∩ U′ = 𝔸² ∖ 0`, quasi-affine, not affine | holds; SAG lines 18017, 18025, 26667, 26690; GR-I lines 7581, 7600; tags 023Q, 02JR | none |
| 6.3 perfect = dualizable | `ℤ ⊕ ℤ[3]`; ℚ; `ℤ/p`; `O ⊕ O` | dual `ℤ ⊕ ℤ[−3]`; ℚ not compact; dual `ℤ/p[−1]` not connective; evaluation rank 4 → 1 | holds; SAG lines 18072, 18088, 10219; GR-I lines 8201, 8209 | none |
| 6.4 almost perfect | k over `k[ε]/(ε²)`; `⊕_{i≥0} k[−i]` over k | `Tor_i = k` for all i, `π₀` finitely presented; `∏_i` vs `⊕_i`: criterion forces bounded below | holds; SAG line 26798; HA lines 48428, 48432, 48556; Stacks line 1059 | none |
| 7.1 group prestacks | `G = 1`, `X = ∅`; constant `ℤ/2`; `O(G) = ℤ × 𝔽_ℓ` | `Spec 0`; fibre at `ℤ × ℤ`: 2 points vs 4 for an affine; `ℓ(e + e′ − 2ee′) = 0`, ℓ-torsion so not flat | holds; HTT lines 25224, 24717, 25589, 25890 | none |
| 7.2 realizations, quotients | `G = 1`, `X = ∅`; `ℤ/2` over `𝔽₂`; `G_m` | `0 = 0`; `H¹(ℤ/2; 𝔽₂) = 𝔽₂` both sides, invariants see `H⁰`; graded objects | holds; GR-I lines 7354, 7463, 7474; SAG lines 17758, 17889 | none |
| 7.3 discrete quotients | `Γ = 1`; ℤ trivial on `Spec C`; `σ(x) = 2x` | `QCoh(X)`; `H¹(ℤ; C) = C` vs 0 coarse; `id(x) = x ≠ 2x`, not semilinear | holds; agrees with HabiroCohomologyFoundations §1.27 Checks | none |
| 7.4 classical quotient stacks | `G = 1`; `ℤ/p` over `𝔽_p`; `Gal(ℚ̄/ℚ)`; `μ_n ⊂ G_m` | reduces to 5.3; `Ext^i = 𝔽_p` all i; `Spec ℚ̄` trivial over no fppf cover; `G_m/μ_n = G_m` by `t ↦ t^n` | holds; GR-I lines 7872, 7883; SAG lines 33959, 33965; HNR line 807 | none |
| 8.1 qcqs schemes | `Spec A`; `⨿_ℕ Spec ℤ` | `C₀ = Perf(A)`; `Hom(O, ⊕ O_i) = ∏ ℤ ≠ ⊕ ℤ`, quasi-compactness needed | holds; Stacks lines 1806, 1969; SAG line 29408 | none |
| 8.2 perfect stacks | `Spec 𝔽₂`; `BG_m`; `⨿_ℕ Spec ℤ` | `Map(O, 0 ⊕ 0)`: 1 point vs 2; weight-n part preserves colimits; fibre over (0,1) empty, not affine | holds; BZFN lines 834, 970 | none |
| 8.3 permanence | `A = k[ε]/(ε²)`; doubled-origin line | `Tor₁^{A⊗A}(A, A) = Ω_{A/ℤ} ↠ Ω_{A/k}`: `k·dε` (char ≠ 2), `A·dε` (char 2); loci of `L_{±1}` are the two charts | holds; BZFN lines 1149, 1189, 1209, 1216; Stacks lines 1897–1914 | none |
| 8.4 `[X/G]` in characteristic 0 | `B(ℤ/p)` over ℚ; `K(ℤ,2) × Spec ℚ`; `ℙ¹` twisted by `ℚ(i)` | `Hⁱ = 0`, `i > 0`; `H² = ℚ` vs heart `Ext² = 0`; invariants `ℚe₁ ⊕ ℚ·ie₂`, twist `≅ ℙ¹_ℚ` | holds, conditional on the two declared gaps; BZFN line 1200; SGA1 line 6972 | none |
| 8.5 `O` not compact | `ℤ/p` over `𝔽_p`; `S₃` over `𝔽₃`; `Γ = 1` | `∏ 𝔽_p` vs `⊕ 𝔽_p`; `H¹ = 0`, `H² = (𝔽₃)^{sign} = 0`, coinduced `Hⁱ = 𝔽₃`; compact | holds; HR-perf line 29; HNR lines 23–47 | none |
| 8.6 `not_preservesCoproducts_trivial` | `p = 0`; `Γ = 1`; arbitrary `w`; `Γ = ℤ` | `0 ∣ card` false (card ≥ 1); `p ∤ 1`; `J = ULift ℕ`: `Hom = ∏ k` vs `⊕ k`; `Nat.card ℤ = 0`, excluded by `Finite` | holds; body equals StableHomotopyKTheory `IsCompactForCoproducts` (`Suggested.lean:250–252`) | none |

- Source locators checked against the texts, number and page: HA 29, SAG 46, HTT 15, GR-I 17, BZFN 8, Stacks 18 (10 in the cache, 8 tags on the Stacks website), HNR 3, HR-perf 1, SGA1 1; all agree.
- Library declarations opened at the pins: 48 Mathlib and 14 Tau Ceti `file:line` locators of the supplier contracts; each line carries the named declaration.
- Cross-roadmap citations resolved: over 90 EnhancedDerivedSheaves names and section ids, 41 SchemeAndStackFoundations, 6 DerivedModuleAlgebra, 2 StableHomotopyKTheory, ReductiveGroups Layers 1 and 3, BordismFormalGroups F6.5 (main); 18 PrismaticCohomologyPartII §4.0 names, LanglandsParameterStacks §§1.7–1.8, HabiroCohomologyFoundations §§1.27–1.28, AnalyticStacks §§1.1–1.2 and 41 sections of the InfinityCategoryTheory Parts (open heads), including the cited steps inside InfinityTopoi §§8.4.1, 9.1.1 and 9.2.3.
- Declared gaps: both slugs are in `design/plan.json` and the README with the same supplier and section; each `needs` is one statement with its hypotheses, and Tau Ceti has only the algebraically closed, reduced case of the first.
- Gate at `6e816c2`: every check 0, OK. Dependency check: `depcheck: 258 roadmaps, 2463 edges, 0 problem(s)`; no UPWARD or CYCLE line. The diff outside the folder is empty.
- Elaboration: `lake env lean` on `TauCetiRoadmap/QuasicoherentSheavesOnPrestacks/Suggested.lean` gives `sorry` at line 79 as the only warning. `#check @not_preservesCoproducts_trivial` carries every binder of README 8.6; `simp`, `rfl` and `infer_instance` do not close it.
- Headlines: the statable one (8.6) is stated; the docstring names 3.2, 2.4, 3.3, 4.2, 5.3, 6.2, 6.3, 7.2–7.4, 8.1, 8.2–8.4 and 8.5 with the carrier each lacks. Pull-request text: title, summary block and prose agree with the head.
- Stacks tag 0BQR is used in 8.3(b) for an ample family: its proof (Stacks lines 1902–1914) uses quasi-compactness, affine diagonal and one affine `X_s` through each point, as the README says.

Overlap check: read EnhancedDerivedSheaves (main), SchemeAndStackFoundations, SchemeKTheoryOperations, HypercompletenessAndCoherence, InfinityCategoryTheory, AnalyticStacks; classical `QCohPrestack` — PrismaticCohomologyPartII §4.0; animated Čech descent and parameter stacks — LanglandsParameterStacks §§1.7–1.8; lattice quotient — HabiroCohomologyFoundations §§1.27–1.28; `DQCoh` and its perfect generator — SchemeAndStackFoundations §2.18; all cited, and `QCoh` on animated and `E∞` prestacks, flat hyperdescent and perfect stacks are stated nowhere else.

Source independence: 14 passages compared with 7 sources, none shared beyond statements the mathematics forces (longest common run 10 words, BZFN line 972); largest share SAG, 70 of 211 locators; contents compared with SAG (§§6.2.1–6.2.6, 6.3, 9.1, D.6): independent — Layer 3 draws on D.6 before §6.2.3, Layer 6 merges §§6.2.5, 6.2.6, 9.1.3 and 9.1.5, and Layers 1, 7 and 8 have no SAG counterpart.

## Not verifiable

- None.

## Source issues

- **Gap** in BZFN at Corollary 3.22, p. 24: the source says, without argument, that the map from the quotient to the classifying stack is quasi-projective; it should cite effective descent of schemes with a relatively ample linearized bundle, torsors not being Zariski-locally trivial; affects the proof.

## For the human reviewers

- Licence: SAG (70 of 211 locators) and HA (37) are author-posted PDFs of unpublished books; SAG's title page (SAG line 5) reads "Under Construction". GR-I, BZFN, HR-perf and HTT are published.
