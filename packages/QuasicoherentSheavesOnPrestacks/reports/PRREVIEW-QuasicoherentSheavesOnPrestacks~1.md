# Review of QuasicoherentSheavesOnPrestacks (pull request #2450 at 6130027)

**Verdict:** needs changes

## R01 (P3) — The 7.3 locator does not cover its main equivalence

**Location:** `TauCetiRoadmap/QuasicoherentSheavesOnPrestacks/README.md` line 767: "No finiteness of Γ and no covering property of `X → X/Γ` is assumed (GR-I Chapter I.3, Corollary 1.3.8, p. 147)."

**Claim:** The only locator in 7.3 supports the last clause, `QCoh([X/Γ]) ≃ QCoh(X/Γ)`. The main statement, `QCoh(X/Γ) ≃ QCoh(X)^{hΓ}`, has no source.

**Witness:** GR-I line 7463: Corollary 1.3.8 is only `QCoh(L(Y)) ≃ QCoh(Y)`. Colimits going to limits is GR-I §1.1.3 (line 7354, p. 144) and SAG Lemma 6.2.1.12 (line 17758, p. 488).

**Repair:** Replace the parenthesis with: "(the first equivalence because `QCoh` is the right Kan extension along the Yoneda embedding and so carries colimits of prestacks to limits: GR-I Chapter I.3, §1.1.3, p. 144; SAG Lemma 6.2.1.12, p. 488; the last by GR-I Chapter I.3, Corollary 1.3.8, p. 147)".

## R02 (P3) — The description misstates how flat hyperdescent is proved

**Location:** Pull-request description, summary block: "Descent holds along flat hypercovers over every connective test ring with no finiteness or descendability hypothesis, reusing the enhanced derived categories and descendable descent of EnhancedDerivedSheaves."

**Claim:** At the head, the proof of flat hyperdescent does not use descendable descent. EnhancedDerivedSheaves' `moduleDescent` appears only in an agreement bullet and in the Checks of 3.2.

**Witness:** README line 443 says the route "does not pass through descendability". The 3.2 proof route (line 477) uses `tot_filteredColimit_of_bounded`, the descent criterion of 1.5 and `spectra`. It does not use `moduleDescent`.

**Repair:** Replace the sentence with: "Descent holds along flat hypercovers over every connective test ring with no finiteness or descendability hypothesis, proved by truncation and comonadicity on the enhanced derived categories of EnhancedDerivedSheaves, and agreeing with its descendable descent where both apply."

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| 1.1 θ, ι, test rings | `𝔽_p ⊗ 𝔽_p` pushout; zero ring; free `CAlg^cn` on `ℤ[0]` | AnRing `π₀=π₁=𝔽_p`, CRing `𝔽_p`; `θι(0)=0`; `π₁ (ℤ⊗ℤ)_{hΣ₂} = ℤ/2 ≠ 0` | holds; SAG 6.2.2.1–2 pp. 490–491, HA 7.1.3.18 p. 1219, 3.2.4.7 p. 371 match | none |
| 1.3 t-structure, flatness | `ℤ→ℤ[1/p]×ℤ_p`; `ℤ→ℚ`; `ℤ→𝔽_p` | `(p)` under `pℤ_p`, so faithfully flat; `ℚ⊗ᴸℤ/p=0`; `π₁(𝔽_p⊗ᴸ𝔽_p)=𝔽_p` | holds; HA 7.1.1.13 p. 1202, 7.2.2.10/13/15 pp. 1240–1241 match | none |
| 1.5 limits of module categories | empty diagram; `(ℤ,ℤ[1])`, `(ℤ,ℤ²)`; unit on `B(ℤ/p)×Spec 𝔽_p` | limit 0; evaluations equivalence vs rank 4→1; compact on each factor, not compact globally | holds; HA 4.7.4.18 p. 699 (used in SAG p. 506), 4.6.1.11 p. 620, 4.7.5.2–3, 5.2.2.36 match | none |
| 2.2 `QCoh` as a limit | `BΓ×Spec 𝔽₂`, `Γ=ℤ/2`; `∅` | `π₀Map(O,O[1]) = H¹(ℤ/2;𝔽₂) = 𝔽₂`; at every point `π₋₁A=0`; `QCoh(∅)=0` | holds; SAG 6.2.2.1–7, 6.2.6.1 pp. 490–497; GR-I §§1.1.3–1.1.4 pp. 144–145 | none |
| 3.1 fpqc topology, flat hypercovers | empty family; `ℤ→ℤ[1/p]×ℤ_p`; `𝔽_p→𝔽_p⊗ᴸ𝔽_p` | covers only 0; uncountable `ℤ_p` not a quotient of a countable algebra, so not fppf; `π₁(B⊗B)=𝔽_p²` vs `π₁B=𝔽_p` | holds; SAG D.6.1.1/D.6.1.4 pp. 2173–2174, HTT 6.2.2.6–7 PDF p. 597 | none |
| 3.2 flat hyperdescent (headline) | `ℤ→ℤ[1/2]×ℤ[1/3]`; `ℤ→𝔽_p×ℤ[1/p]` | `Ext²(ℤ[1/6],ℤ)=0` and `I→ℤ` not null, so index 2; equalizer `ℤ`; the non-flat equalizer contains `(1,0)` | holds; SAG D.6.3.1–4 pp. 2177–2178 (complete prestable) | none |
| 3.3 invariance under sheafification | `∅→Spec 0`; `Spec 𝔽_p→Spec ℤ`; `BΓ` vs the stack of Γ-torsors | `QCoh=0` on both; the totalization kills `ℚ`; both are `Fun(BΓ,Mod_k)` | holds; SAG 6.2.3.1–3 p. 492; GR-I 1.3.7, 1.3.8, 1.3.11 p. 147 | none |
| 4.2 affine pushforward, base change | `id`; `Spec R[t]→Spec R`; classical `Spec 𝔽_p→Spec ℤ` | `f_*O=R[t]` of infinite rank; base change: source `𝔽_p⊗ᴸ𝔽_p` vs target `𝔽_p`, equal in AnRing | holds with the flat hypothesis; SAG 6.3.4.1/6.3.4.3 pp. 505–507; GR-I 2.2.2 p. 153 | none |
| 5.2 Zariski descent for `Dqc` | `ℙ¹_k` charts; `⨿_ℕ ℙ¹`; `j_!O_U` on a DVR | `H¹(O(−2))=k·t⁻¹`; product `∏Dqc(ℙ¹)`; `j_!O_U` has zero global sections, so it is not quasi-coherent | holds; Stacks 0A0J, 08D3 (36.3.2–3) are the route's inputs | none |
| 5.3 `QCoh(h_X) ≃ Dqc(X)` (headline) | `ℙ¹_k`; `⨿_ℕ Spec ℤ`; the empty scheme | `k` on both sides; `∏_ℕ D∞(ℤ)` on both; `h_∅ = Spec 0`, `QCoh=0` | holds; SAG 6.2.4.1 p. 493, 2.1.2.3, 2.2.6.2 p. 208; GR-I 1.4.4 p. 149 | none |
| 5.4 schematic pushforward | `ℙ¹_k→Spec k`; `ℙ¹_ℤ` with `g: Spec ℚ→Spec ℤ`; the closed point | `f_*O(−2)=k[−1]` (cohomological degree 1); `ℚ[−1]`; base change fails without Tor-independence | holds; Stacks 08DZ, 08EU, 08IB match | none |
| 6.1 pointwise properties | n-truncatedness; `⊕_ℕO`; `BΓ×Spec k` | `𝔽_p⊗ᴸ𝔽_p` has `π₁≠0`, so excluded; flat and not perfect; perfect iff the underlying module is perfect | holds; SAG 6.2.5.3–7 p. 495, 2.8.4.2 p. 275, the paragraph before 6.2.6.3 | none |
| 6.3 perfect = dualizable (headline) | `ℤ⊕ℤ[3]`, `ℚ`; `O⊕O`; `ℤ/p` | dual `ℤ⊕ℤ[−3]`; evaluation of rank 4→1, not invertible; `RHom(ℤ/p,ℤ)=ℤ/p[−1]`, not connective | holds; SAG 6.2.6.2–3 p. 497; GR-I 3.6.4–5 p. 163 | none |
| 7.3 `QCoh(X/Γ) ≃ QCoh(X)^{hΓ}` | `Γ=1`; `ℤ` acting trivially on `Spec C`; `σ(x)=2x` | `QCoh(X)`; `H¹(ℤ;C)=C` vs 0 for the coarse quotient; `id(x)=x ≠ σ(x)·id(1)=2x` | the mathematics holds; the locator covers only the last clause | R01 |
| 8.1 qcqs compact generation (headline) | `Spec A`; `ℙ¹` with `O⊕O(−1)`; `⨿_ℕ Spec ℤ` | `C₀=Perf(A)`; `Hom(O,⊕O_i)=∏ℤ ≠ ⊕ℤ`, so quasi-compactness is needed | holds; Stacks 09IS, 09M1; SAG 9.6.1.1 p. 807 | none |
| 8.2 perfect stacks, BZFN 3.9 | `⨿_ℕ Spec ℤ`; `BG_m`; `Spec 𝔽₂` | compact ⊊ dualizable, so not perfect; graded, finitely many weights; `Map(O,0⊕0)` one point vs two points | holds; BZFN Def 3.2 p. 17, Prop 3.9 p. 20 | none |
| 8.3 permanence | `k[ε]/ε²` diagonal over ℤ; the line with doubled origin | `Tor₁=Ω¹_{A/ℤ}↠Ω¹_{A/k}`: `k·dε`, or `A·dε` in characteristic 2; sections `(t,1)`, `(1,t)` have loci `U′`, `U` | holds; BZFN 3.20–3.24 pp. 23–25 | none |
| 8.4 quotient stacks in characteristic 0 (headline) | `B(ℤ/p)/ℚ`; `K(ℤ,2)×Spec ℚ`; `P=Spec ℚ(i)`, `X=ℙ¹` | Maschke gives `Hⁱ=0`; `H²(K(ℤ,2);ℚ)=ℚ` vs `Ext²=0` in the heart; invariants `ℚe₁⊕ℚie₂` | holds; BZFN Cor 3.22 p. 24 (characteristic 0, linear action) | none |
| 8.5 `O` not compact in characteristic p | `Γ=1`; `ℤ/p` over `𝔽_p`; `S₃` over `𝔽₃` | compact for `Γ=1`; `⊕𝔽_p→∏𝔽_p` not onto; `H¹=H²(S₃;𝔽₃)=0`, and the 2-dimensional coinduced module gives `𝔽₃` in every degree | holds; HR-perf Introduction p. 1; HNR 1.1 pp. 1–2, §4 p. 9 | none |
| 8.6 `not_preservesCoproducts_trivial` (Lean) | `p=0`; `p=1`; `Γ=ℤ`; `ZMod 2` | `0∣card` false (card ≥ 1); `CharP k 1` impossible for a field; `Nat.card ℤ=0`, so `[Finite Γ]` is needed; `Hom(k,⊕V[i])=∏k` | true as stated; `simp`, `aesop`, `decide` fail, so it is not padding; HA 1.4.4.1(3) p. 154 | none |

- Source locators checked against the cached texts, number and page: 137 in total (SAG 50, HA 29, HTT 19, GR-I 15, BZFN 9, Stacks chapter 36 10, HNR 3, HR-perf 1, SGA1 1). The page offsets were confirmed: GR-I PDF−37, HTT PDF−18, SGA1 PDF−16.
- Library declarations opened at the pins: 49 Mathlib and 14 Tau Ceti, each at the cited file and line. The claims that the libraries lack an object are confirmed: no Kan-complex instance for groupoid nerves, no compact objects of triangulated categories.
- Cross-roadmap citations resolved, with all names in the cited sections:
  - EnhancedDerivedSheaves: 35 names.
  - SchemeAndStackFoundations: 35 names.
  - DerivedModuleAlgebra: 4 names.
  - PrismaticCohomologyPartII §4.0: 17 API names.
  - LanglandsParameterStacks §§1.7–1.8, HabiroCohomologyFoundations §§1.27–1.28, BordismFormalGroups F6.5, ReductiveGroups Layers 1 and 3.
  - StableHomotopyKTheory §5.17: the body of `IsCompactForCoproducts` is identical.
  - InfinityCategoryTheory family (#2270): 41 sections.
- Gate: the worker's gate passed at 6130027. My depcheck printed `depcheck: 256 roadmaps, 2432 edges, 0 problem(s)`; there is no UPWARD or CYCLE line. The diff outside the folder is empty.
- Elaboration: `lake env lean Suggested.lean` exits 0 with the single `sorry` warning at line 79. The elaborated type matches README 8.6: `Finite Γ`, `CharP k p`, `p ∣ Nat.card Γ`, `HasDerivedCategory.{w}`.
- Gaps: both slugs are declared in `plan.json` and in the README. Neither ReductiveGroups Layer 3 nor SchemeAndStackFoundations §1.16 on main states either gap; Tau Ceti covers only the reduced, algebraically closed case.
- Overlap check: I read EnhancedDerivedSheaves (main, #1330, #1630), SchemeAndStackFoundations, SchemeKTheoryOperations, HypercompletenessAndCoherence and InfinityCategoryTheory (#2270), and AnalyticStacks (#1687). Each shared object has one owner:
  - single-algebra `Mod_A`, `Dqc` of qcqs schemes: EnhancedDerivedSheaves;
  - `DQCoh` and stacks: SchemeAndStackFoundations;
  - sheaf criteria: HypercompletenessAndCoherence;
  - the !-formalism: AnalyticStacks;
  - prestack `QCoh` in the animated and `E∞` contexts: this roadmap.
- Source independence: 10 prose passages were compared by hand, and the README and Lean file were scanned for runs of 9 or more words against 9 sources. Only titles, URLs and forced hypothesis lists are shared. The largest share is SAG, 68 of 215 locators. Contents compared with SAG §§6.2–6.3, 9.1 and D.6, and with GR-I Ch. I.3: independent.

## Not verifiable

- Stacks tags 023Q, 0245, 02JR, 0FXR, 0FXS, 0FXT, 06WG and 06WT (Descent, Morphisms of Schemes, Sheaves on Algebraic Stacks): these chapters are not in the sources cache. They lie outside the seeded sample, and I did not fetch them because this review edits no manifest.

## Source issues

- **Gap** in BZFN at Corollary 3.22, p. 24: the source says, without argument, that `X/G → BG` is quasi-projective, although its fibres are twists by torsors that need not be Zariski-locally trivial; it should be justified by effective descent of schemes with a linearized, relatively ample bundle (SGA1 Exposé VIII, Proposition 7.8); affects the proof.

## For the human reviewers

- SAG has the largest share of locators (68 of 215) and HA has 37. Both are author-posted PDFs of unpublished books; SAG's title page reads "Under Construction" (February 2018). The other main sources (GR-I, BZFN, HR-perf, HTT) are published.
