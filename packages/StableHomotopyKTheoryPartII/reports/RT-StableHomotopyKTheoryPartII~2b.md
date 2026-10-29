<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1597#issuecomment-6484676053 -->
Red team round 2 pass b (claude) of 1db8b48

Verdict: needs_changes

1. **F01** (P3) StableHomotopyKTheory §7.15 and §7.16 are cited for each other's statements

   Location: `packages/StableHomotopyKTheoryPartII/README.md:323` ("StableHomotopyKTheory §7.15 (mod-p detection for complete spectra)"), `README.md:419` ("§7.15 (mod-p detection for complete spectra); StableHomotopyKTheory §7.16 (closure of complete spectra)"), repeated in the Layer 2 and Layer 3 Dependencies lines (`README.md:333`, `README.md:429`).

   Claim: §7.15 of StableHomotopyKTheory supplies mod-p detection of equivalences between complete spectra, and §7.16 supplies closure of complete spectra under limits.

   Witness: StableHomotopyKTheory at its open head (#1227, 1475fb2), `TauCetiRoadmap/StableHomotopyKTheory/README.md:2447` is "7.15 Closure properties of complete spectra" and `README.md:2455` is "7.16 Mod-p equivalence detects equivalences of complete spectra". The two glosses are swapped. The §3.4 route uses both: "Mod-p detection ... reduce the assertion to H(M/pM)" is §7.16, and the limit of complete truncation stages being complete is §7.15 (closure under countable tower limits).

   Repair (tested on §3.4 with X=Hℤ: the mod-p reduction to H𝔽_p needs the detection theorem, which is 7.16 at the head; the completeness of lim_n T_p(τ_{≤n}X) needs tower-limit closure, which is 7.15): in `README.md:323` replace "StableHomotopyKTheory §7.15 (mod-p detection for complete spectra)" by "StableHomotopyKTheory §7.16 (mod-p detection for complete spectra)"; in `README.md:419` replace "StableHomotopyKTheory §7.15 (mod-p detection for complete spectra); StableHomotopyKTheory §7.16 (closure of complete spectra)" by "StableHomotopyKTheory §7.16 (mod-p detection for complete spectra); StableHomotopyKTheory §7.15 (closure of complete spectra)"; make the same two substitutions in the Layer 2 Dependencies line (`README.md:333`) and the Layer 3 Dependencies line (`README.md:429`). The Conventions citation "§§7.14–7.16" (`README.md:27`) is a range and needs no change.

One new finding, S01 (P3). Every round-1 finding is repaired at this head and no repair introduced an error (table below). Inputs read in full: `packages/StableHomotopyKTheoryPartII/README.md` (1034 lines, 38 bold targets in 8 layers, 8 supplier-contract subsections, 2 declared gaps), `packages/StableHomotopyKTheoryPartII/Suggested.lean` (62 lines: module docstring, empty namespace, no declaration), `design/plan.json` (`gaps`, `sourceIssues`), the two round-1 reviews and the round-1 repair report.

## Round-1 findings at this head

| Finding | Status | Witness at 1db8b48 |
|---|---|---|
| r1a F01 (P1) genuine norm in §2.6 | repaired (different route) | `README.md:298`: "work with the imported Δ_p itself; no genuine equivariant norm and no Segal equivalence enter". The route reproduces lnr12 Proposition 5.12 (lnr12 lines 2046–2106) with Δ_p for ε_B: Corollary 3.5 factorization (needs H*B bounded below finite type, which holds), unit detection in the multiplicative Tate spectral sequence (KTheoryFiniteLocalFields §4.5 at #1281 supplies pairings and the Greenlees comparison, its README line 706), suspension via exactness of T_p and the reindexing U_n(ΣB)=ΣU_(n−1)(B) (checked: Σ^(1+n)D(Σ^(−(n−1))B)=ΣΣ^nD(Σ^(−(n−1))B)), then representability. The strings "N_e", "Φ^" and "geometric" occur nowhere else. No new error. |
| r1a F02 (P1) A_p(n) chain asserted as supplied | repaired | `README.md:85` declares gap:steenrod-finite-hopf-chain with the ideals; `design/plan.json` `gaps[1]` has the same slug, supplier BordismFormalGroups, section F6.3; cited in §2.4 Needs (`README.md:261`). Ideals checked against agm85 line 217 (τ_r, r>n; ξ_s^(p^r), r+s≥n+1) and against the standard A(n) at p=2 (n=0 gives ξ₁², ξ₂; n=1 gives ξ₁⁴, ξ₂², ξ₃: dimension 8). Freeness enters agm85 line 290. |
| r1a F03 (P2) integral splitting through const as H𝔽_p-modules | repaired | `README.md:751`: integral splittings are "splittings of Hℤ-modules through const ... two-term complexes with differential p"; Check at `README.md:763` computes Ext^(2k−2j)_ℤ(ℤ/p,ℤ/p)=0 for k≠j, so the Hℤ-module splitting is unique. Correct: D(ℤ) has global dimension 1 and alternating homotopy, so the splitting exists and is unique. |
| r1a F04 (P3) sphere Segal attributed to AInfCohomology | repaired | `README.md:102`: "The sphere Check of the Tate diagonal fixes the map S→S^(hC_p)→S^(tC_p); its identification as the p-completion of S is proved in §2.7 here". AInfCohomology #1044 README line 3855 checks only that map. |
| r1a F05 (P3) non-discriminating §5.4 Checks | repaired (different route) | `README.md:692–693`: reflection Check (reflection of S^ρ in the sign coordinate is C₂-equivariant, fixes S¹=(S^ρ)^(C₂), cofiber of S¹→S^ρ is S¹∧ΣC₂₊, free, so it acts as the identity on (S^ρ⊗R)^(tC₂) and by −1 on π₂Σ²R; on π₁(S^ρ⊗S)^(tC₂)=π₀S^(tC₂)=ℤ₂ it acts by 1) and R=Hℤ Check (correct: ℤ/2 in odd degrees; trivial S²: ℤ/2 in even degrees; H𝔽₂ cannot distinguish). Both recomputed and discriminating. |
| r1b F01 (P2) sphere counterexample imported from a later-owned fact | repaired | `README.md:14`, `README.md:106`, `README.md:930`, `README.md:935`, `README.md:1014`: the value is derived in the Layer 7 Examples from §2.7, the Tate orbit lemma (AInfCohomology §AI.7.2, `tateOrbit`, its line 3832) and RefinedTraceMethods §2.3(iii) (its README line 559 at c47abe4). The derivation matches ns18 lines 620–635 step by step; the residual action on S^(tC_p) is trivial because S→S^(hC_p)→S^(tC_p) is equivariant from the trivial action. |
| r1b F02 (P3) SW(k) ownership against a later roadmap | repaired | `README.md:7` and `README.md:1014` scope the finite-field case here and tell later constructors to import §4.8. HabiroCohomologyFoundationsPartII (position 224) is not named, correctly. |
| r1b F03 (P3) gap asked for W(𝔽_p)=ℤ_p | repaired | `README.md:37` cites `WittVector.equiv` (pin: Mathlib/RingTheory/WittVector/Compare.lean:199); `README.md:110` and `plan.json` `gaps[0]` say "identified with W(𝔽_p) by the pinned `WittVector.equiv`". |
| r1b F04 (P3) fewer than three discriminating Checks | repaired | §2.1 `README.md:191` (zero-transition tower: H_c^*=0, ⊕ model nonzero), §2.5 `README.md:283` (U₀(ΣS) bottom cell p+1 against 2; recomputed: Th(ρ over BC_p) bottom cell p), §4.4 `README.md:510` (H𝔽₄: a²=a+1 against pullback a). All three discriminate. |

## Verified sound

- Declarations read: 0. `Suggested.lean` declares nothing; `#check @name` elaboration is therefore vacuous and was not run. The docstring lists 14 headlines as not statable; at the pinned Tau Ceti the `AlgebraicTopology` folder has Cellular, Cohomology, EilenbergMacLane, Singular, Sphere and fundamental-group material only, and a grep for spectrum, Steenrod, Tate-construction and Singer carriers over the whole library finds none; `WittVector` occurs only in the Fargues–Fontaine quotient file. No headline is statable, no stand-in is written, no padding, no `set_option`, no `lemma`, single `import Mathlib`, docstring in the required form. The finite-set tower theorem (§3.1) would be statable but is a supporting lemma, not a headline; leaving it out is correct.
- Targets read: 38 bold targets, 8 supplier contracts, Conventions, Downstream consumers, Worked examples, References: every line.
- Depcheck run as prescribed, exit 0, no UPWARD, CYCLE or moved line:

  ```text
  depcheck: 186 roadmaps, 1215 edges, 0 problem(s)
  ```

- Diff against origin/main: 8 files, all inside `packages/StableHomotopyKTheoryPartII/` (README, Suggested.lean, design/plan.json `gaps` only, metadata.toml, three reports, sources.toml). No pull-request number, process word, `lemma`, `set_option` or computational algorithm in README or docstring; every target has a locator.
- Sibling citations checked at the current heads (62 section citations across 10 suppliers): StableHomotopyKTheory #1227 (Layer 5 at its line 1873; §7.9 line 2371; §§7.14–7.19 lines 2439–2483; §§7.21–7.26 lines 2509–2596; the §7.15/§7.16 glosses are S01); AInfCohomology #1044 (§AI.7.2 "Circle actions, homotopy fixed points and Tate constructions" line 3818 with `tateOrbit` and residual action; "Spectral Tate diagonal" line 3850 with exactness, unique lax symmetric monoidal refinement and the sphere Check); KTheoryFiniteLocalFields #1281 (§4.0 line 605 genuine models; §4.4 line 667 genuine/modern comparison for bounded-below input and the completed residual comparison; §4.5 line 706 HM Tate cochains, trivial cyclic resolution, multiplicative Tate spectral sequence with Greenlees comparison); RefinedTraceMethods c47abe4 (§2.1, §2.3 with parts (i) truncation limit, (ii), (iii) p-completeness and (X_p^∧)^(tC_p), and the fixpoint lemma; §2.4 parametrized Tate; §2.5; §2.6; §2.8 E∞ Frobenius as multiplication after Δ_p and THH Frobenius; §2.10 THH(S[ΩY])≃Σ∞_+LY for connected Y; §§2.11–2.13; §2.16 restriction pullback and II.4.9; §5.1 Snaith ψ^k on KU[1/k] with β↦kβ; §5.3; §6.1 HA 7.5.0.6 étale lifting); TangentialBordism 67b1819 (B4 items 1, 2, 7, 8 at its lines 738–920: Sq via cup_i, admissible basis, Milnor dual with the stated degrees and coproduct, HF₂ and HF_p Adams towers with bidegree (r,r−1), odd-p Milnor conventions, freeness over the infinite exterior algebra only); on main: GeneralizedCohomology G2.8 (line 453, free commutative algebra as wedge of `(V∧…∧V)_(hΣ_m)`), G3.8 (785), G3.9 (878), G4.2 (1214), G5.3 (1536), G5.4 (1559, KU at 1655); BordismFormalGroups F6.1 (555), F6.3 (760; finite sub-Hopf algebras E(Q_i), T_t at 1003–1016, no A(n) chain, hence the gap), F6.4 (1248), F6.5 (1526; item 5 at 2511–2518: R_G=(L_nS)^(tG) is E(n−1)-local, T(0)≃Hℚ); EnhancedDerivedSheaves E3 (1117) and E5:abstract (1436); AlgebraicTopology Stage 6 (946, cup products at 1056); TopologicalKTheory T1–T5 (163–886; T2.5 Adams operations at 702; T4 at 816). TopologicalKTheory is now on main; the README cites it by name only, which is right.
- Mathlib declarations verified at the pin with hypotheses: `CategoryTheory.Functor.sections` (Types/Basic.lean:222), `eventualRange` (CofilteredSystem.lean:125), `isMittagLeffler_of_exists_finite_range` (230), `toEventualRangesSectionsEquiv` (255), `surjective_toEventualRanges` (262), `eval_section_surjective_of_surjective` (312), `eventually_injective` (323, with `[Finite F.sections]` in the finite nonempty surjective section), `nonempty_sections_of_finite_cofiltered_system` (79), `frobenius` (Algebra/CharP/Lemmas.lean:321), `WittVector.frobenius` (Frobenius.lean:218), `coeff_frobenius_charP` (255), `frobenius_zmodp` (275), `WittVector.equiv` (Compare.lean:199).
- Locators verified against the cached texts (29 this round): agm85 §2 chain definition (line 217), Lemma 2.1 (236), Lemma 2.2 and freeness use (285–296); lnr12 Proposition 2.2 (265), Definition 2.3 (400), Definition 3.1 with (3.1)–(3.3) term by term (641–713), Proposition 3.3, Theorem 3.4, Corollary 3.5 (722–745), Proposition 5.7 with Σ^(1+n)D_(C_p)(Σ^(−n)B) and filtration index 1−(p−1)n (1935–1958), Theorem 5.9 (1964), Definition 5.10 (2002), Lemma 5.11 (2021), Proposition 5.12 and proof (2038–2107), Theorem 5.13 (2109); bmms86 Proposition 2.4(vi) with the (−1)^q Bockstein factor and χ=m!u^m, ω=m!bu^(m−1) (4480–4508); ns18 Lemma I.2.2 and Example I.2.3 (615–666), Lemma II.4.1 (2214), Corollary II.4.9 (2357), Theorem III.1.7 and proof, Lemma III.1.8 (3271–3348), Definition IV.1.1, Example IV.1.2 (4836–4865), Lemma IV.1.3 through Remark IV.1.6 (4868–4917), Lemma IV.1.7 through Remark IV.1.11 (4920–4985), (11) and Proposition IV.1.12 with its proof (4990–5060), displays before IV.1.15, Theorem IV.1.15, Proposition IV.1.16 (5098–5170), (12), Lemma IV.1.17 (5189–5205), Lemmas IV.1.18–IV.1.20, Theorem IV.1.21 and the proof of IV.1.16 (5210–5435), Theorem IV.3.7 and proof (5978–6007); kuhn04 Theorems 6.2 and 6.6 (596, 625; finite Z); malkiewich17 Proposition 2.22 and proof with the fiber formula and the filtered-colimit extension to all simply connected X (609–632).
- Gaps: both declared with the same slug in README and `plan.json`; suppliers RefinedTraceMethods §6.1 (exists at c47abe4, line 2484) and BordismFormalGroups §F6.3 (exists on main). `needs` sentences are single, precise and carry their hypotheses (prime p, degree d≥1; prime p, n≥−1, explicit ideals at odd p and p=2). Minimality: the Witt gap no longer asks for W(𝔽_p)≅ℤ_p; nothing at the pins or in an earlier roadmap gives the chain A_p(n) or freeness over it (TangentialBordism B4.8 is freeness over the exterior algebra only). Checks at d=1 (rank 1, Frobenius identity by `frobenius_zmodp`), 𝔽₄ (a↦a+1, square identity), and n=−1,0,1 (dimensions 1, 2, 8 at p=2 and 1, 2, 12 at p=3) all hold.
- Ownership: `roadmaps grep` for the Singer construction, the C_p Segal theorem, Frobenius-as-Steenrod and spherical Witt lifts finds only HabiroCohomologyFoundationsPartII (later, already handled) and RefinedTraceMethods §2.6 (a remark on Krause–Nikolaus mentioning 𝕊_(W(k)), no construction). No open head or roadmap on main builds any of this roadmap's constructions. Ownership against open pull requests whose files the brief does not give was checked only through `roadmaps grep`.
- Checks evaluated: 139 README Checks (122 local, 17 supplier). All true and discriminating; values in the table below.

## Adversarial pass

One row per target or convention; both sides computed.

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| Conventions: Rⁿ(*)=π_(−n)R; binom(−1,1); swap sign; p-series | n=−1; p=2; degrees 1,1 and 2,2; x=0 | π₁R; −1≡1; −1 and +1; (1+0)^p−1=0 | sound |
| §1.1 weights and Bockstein | p=3, a=−1; b↦λb; (−t,−e); Hℤ p=2 | t weight −1, t² weight 1, degree −4; e fixed, t^(p−1) fixed; βe=1 vs β(−e)=−1; Ĥ^even=ℤ/2, Ĥ^odd=0, invariants in degrees 4ℤ at p=3 | sound |
| §2.1 H_c | constant; zero-transition Σ^(−n)H𝔽_p; Singer tower of S at 2 | H*(B); 0 vs ⊕≠0; Σ𝔽₂[x^±] vs H*(S₂^∧) with no negative classes (lnr12 408–413) | sound |
| §2.2 inverse-limit Adams | zero; constant H𝔽_p; U_n(S) at 2 | 0; E₂=𝔽_p at (0,0), π₀=𝔽_p; bottom degrees 1−n: 1,0,−1 | sound (lnr12 2.2 hypotheses kept) |
| §2.3 Singer formulas, ε | Sq¹(x⁻¹⊗1); β(xy⁻¹⊗1); ε(Σx⁻¹⊗1), ε(Σxy⁻¹⊗1); ε signs | binom(−1,1)=1 so 1; 1; Sq⁰1=1, (−1)⁰P⁰1=1; −(−1)^rβP^r and (−1)^rP^r agree with lnr12 (3.3) | sound |
| §2.4 Tor-equivalence | M=0; M=N=𝔽_p; N=Σ^(−1)𝔽_p; p=2 chain | 0=0; Hom dimension 1, unit↦1; shift −1; A(0)=Λ(Sq¹), A(1) dim 8 | sound; gap declared |
| §2.5 U_n | B=0; n=0; B=S p=2; B=ΣS | 0; ΣD_(C_p)B; Σ(ℝP^∞)^(−nλ), bottom 1−n; bottom p+1 vs 2, reindexing U_n(ΣB)=ΣU_(n−1)(B) | sound (lnr12 5.7) |
| §2.6 comparison and ε | B=0; B=H𝔽_p; B=ΣB; x∈H^q(B) | 0; g(1)=1 from 1⊗1^(⊗p)↦Σxy⁻¹⊗1↦1; g(ι₁)=ι₁ by reindexing; g_B(x)=x^*(ι)=x | sound (lnr12 5.12 route) |
| §2.7 finite-type Segal | S; H𝔽_p; Hℚ | π₀=ℤ_p, negative π=0; identity on 𝔽_p; 0=0 | sound (lnr12 5.13) |
| §3.1 finite towers | constant 2-set; constant ∅; {a,b}←{a}; {0,1}ⁿ | stable image 2; 0, eventual emptiness by compactness; image {a} with nonsurjective transition; limit uncountable, 0^∞ and 0ⁿ10^∞ agree at n | sound |
| §3.2 T_p^((n)) | X=0; n<0 for H𝔽_p; H𝔽_p⊕H𝔽_p; lim | 0; τ_(≤n)=0; mixed words free orbits, two diagonal terms; H𝔽_p | sound (ns18 3316–3330; RTM §2.3(i)) |
| §3.3 HV | V=0, 𝔽_p, 𝔽_p², κ-dimensional | 0; identity on p elements; dimension 2; ⊕_κ not ∏_κ, uniform index | sound (ns18 3342–3347) |
| §3.4 bounded-below Segal | S; Σ⁻¹H𝔽_p; H(⊕_J𝔽_p); KU at 2; exactness on p·id | ℤ_p; 𝔽_p in degree −1; identity; 𝔽₂ vs 0 in even degrees; T_p(p)=p since mixed words of (Σid)^(⊗p) are transfers | sound (ns18 III.1.7) |
| §4.1 W-refinement | p=2; p=3; S; S[ℕ]; S[M] | W trivial; |W|=2 invertible; 1↦1; z↦z^p; factors through R^(hΣ_p) (ns18 IV.1.6) | sound |
| §4.2 space diagonal | X=0; Hℤ p=2; unit | contractible; 2↦4≠2+2; 1↦1 | sound (IV.1.7) |
| §4.3 splitting | X=0; H𝔽_p; H𝔽₂ p=2; degree bound | 0; 0→𝔽_p→π₀→𝔽_p→0; 2·section(1)=tr(1)≠0, ℤ/4; i≥1 homomorphism, i=0 set section (ns18 "i⩾1", see Not verifiable) | sound |
| §4.4 P_p | 0,1; Hℤ 2; H𝔽₄; restriction; P_p(0) | 0,1; 4≠2; a+1≠a; x^p; (x,0)↦x⊗0=0 by the counit at the basepoint | sound |
| §4.5 transfer ideal | Hℤ pt; p=5; H𝔽_p; double cosets | (p); (5) not (120), 30; 0; C_p∩g(Σ_i×Σ_(p−i))g⁻¹=1 since i!(p−i)! prime to p | sound |
| §4.6 degree-zero comparison | Hℤ 2; H(𝔽₃[z]); X=∅ | 2↦0; z↦z³; 0 | sound (IV.1.10) |
| §4.7 HA and finite p-complete | ℤ at 3; ℚ; 0; 𝔽₄; S_p^∧; finite cell modules | 2↦2; 0; 0→0; a↦a+1; identity; exactness of both sides in R extends from S_p^∧ | sound (IV.1.2) |
| §4.8 SW(k) | d=1; [a]; d-th iterate; flatness | S_p^∧, id; [a^p]; identity; π_i=π_iS_p^∧⊗W(k), free rank d | sound; conditional on the Witt gap |
| §5.1 twisted cohomology | V=0; rank −1 at pt; Möbius λ; ρ₂ | R⁰(X); [S¹,R]=π₁R; H¹(S¹;ℤ_sign)=ℤ/2 vs ℤ; swap −1, square +1 | sound (IV.1.19 proof) |
| §5.2 Thom adjunction | n=0; pt, n=−1; ΣHℤ, Σ²Hℤ at p=2; n=1,2 | Borel cohomology; π_pR; 0 and ℤ against the rank −1 values ℤ and 0; degrees −1, +1 | sound |
| §5.3 P_p^n | 0; n=0; n=1; n=−1 | 0; P_p; twist ρ with monodromy; S^(−ρ)⊗S^ρ=S | sound ((12), IV.1.20) |
| §5.4 Tate suspension | n=0; reflection at p=2; Hℤ n=1; n=−1 then 1 | identity; identity on Tate, −1 on π₂Σ²R, 1 on π₁=ℤ₂; ℤ/2 odd vs even; shift 0 vs 4 | sound (IV.1.17) |
| §5.5 Thom description | pt, V=0; rank 1 p=2; rank −1 | Σ∞_+BΣ_p; rank −2, determinant sign; ΣS, twist +ρ | sound (IV.1.20) |
| §5.6 all degrees | n=0; p=2 n=1 u; n=−1 | §4.6 value; u+u²s; rank 0 after +ρ | sound (IV.1.21) |
| §6.1 splittings | p=3; Hℤ p=2; Hℤ uniqueness; sum vs product | shifts 4 and 5; π₀=𝔽₂, π₁=0; Ext^(2k−2j)=0 for k≠j; one summand per degree | sound |
| §6.2 components | u∈H¹(ℝP^∞); v∈H²(ℂP^∞;𝔽₃); x∈H¹(BC₃); x,z on BC₃²; p=5 | u+u²s; v(v+u)(v+2u)=v³−u²v, normalized v−v³t²; x−ye; (x−ye)(z−we)=xz+(yz−xw)e=F(xz), unsigned xz+(xw−yz)e≠F(xz); (2!)²=4≡−1 | sound; bmms86 2.4(vi) carries (−1)^q (line 4481) |
| §6.3 spectrum components | unit; −P¹, θ₁ on v; θ₀ on x and xz; Sq¹u | 1↦1; −v³ and 0 in degrees 6, 7; −y and yz−xw; u²≠0 | sound |
| §7.1 Atiyah power | 0,1; ℂ² p=2; −1; line | 0,1; 3·1+sign, rank 4, trace 2; sign, trace −1; L^p | sound |
| §7.2 KU Tate | p=2 r=1,2; p=3; x=0; CRT | ℚ₂, ℚ₂⊕ℚ₂(i) dims 1, 3; ℚ₃(ζ₃) degree 2, invariants ℚ₃; 0 vs −2; Φ_(p^k)(ζ_(p^j)) nonzero so factors coprime after inverting x | sound |
| §7.3 KU Frobenius | H=1+β on S²; β⁻¹; −1 | (1+β)^p=1+pβ; β⁻¹/p, product 1; character −1 | sound (IV.1.12) |
| §7.4 KU orbit failure | p=2; p=3; Hℚ | 3 vs 1; 8 vs 2; 0 | sound (I.2.3(iii), II.4.1) |
| §7.5 unbounded failure | degree 0; ±2; S; prime-to-2 cofiber | 𝔽₂ vs 0; same; ℤ₂; cofiber is an S[1/2]-module, norm invertible, Tate 0 | sound; F6.5 item 5 gives E(0)-locality |
| Layer 7 sphere counterexample | p=2; p=3; 0 | π₀=ℤ₂, ℤ₃; 0; orbit term 0 by the orbit lemma, (S_p^∧)^(tC_p)≃S^(tC_p) by §2.3(iii) | sound; provenance now §2.7 |
| §8.1 totalization | Y=pt; S²; S¹; ∨_κS²; filtered colimit | S; bottoms (1,3),(2,4); 0; same; fibers (n−1)-connected uniformly, finite 1-connected subcomplexes of a model without 1-cells | sound (malkiewich17 619–626) |
| §8.2 Tate and towers | constant; ΣⁿH𝔽_p fibers; S² tower | identities; no orbit groups below n; bounds grow | sound (ns18 5996–6004) |
| §8.3 free-loop Segal | Y=pt; S², wedges; n=0,1,2 | π₀=ℤ_p vs genuine rank 2; same bounds; identity, one and two pullbacks | sound (IV.3.7, II.4.9) |
| Gaps | d=1; 𝔽₄; n=−1,0,1 at p=2,3 | rank 1 id; a↦a+1; dims 1,2,8 and 1,2,12 | precise, minimal, declared |
| Suggested.lean | 14 headlines | no carrier at the pins | nothing statable |

## Not verifiable

- No Lean elaboration was run (read-only pass); with zero declarations there is no signature to compare.
- The global sign of the odd-p Bockstein component (x↦x−ye on a degree-one class with βe=1) rests on reading bmms86's β in 2.4(vi) as the left-derivation connecting homomorphism; the OCR of the two-page scan (lines 4460–4490) interleaves columns, so only the (−1)^q factor and the Euler normalization were read reliably. The multiplicativity test fixes the degree dependence (−1)^n but not this global sign.
- ns18's OCR renders "⩾" as ">" (Corollary IV.1.8 reads "i>1" where π₁ being a group shows "i⩾1" is meant; Lemma III.1.8 reads "n>0"). The README's i≥1 and n≥0 readings are the mathematically forced ones; the printed inequality signs were not seen.
- The identification of the map Δ_p induces on continuous cohomology with ε (§2.6) is a route claim resting on the unit normalization and exactness of the imported Δ_p; no source states it with Δ_p in place of lnr12's geometric-fixed-point map.
- Ownership against open pull requests whose files the brief does not provide was checked only through `roadmaps grep`.

## Source issues

- **Misprint** in ns18 at Example I.2.3(iii), printed p.220: the source says the multiplicative p- and p²-series use x−1; they should use 1+x, so that the series vanish at x=0; affects nothing.
- **Error** in ns18 at Example IV.1.2(ii), printed p.325: the source says the constant-to-Tate comparison is an equivalence for spectra compact in p-complete spectra and names S_p^∧ as an example; S_p^∧ is not compact there (the p-inversion colimit vanishes while the colimit of π₀ maps is ℚ_p), so it should say dualizable or finite-cell p-complete; affects a stated result.
- **Misprint** in ns18 at the displays before Theorem IV.1.15 and in its statement, printed pp.332–333: the source says the odd-primary summands and the P^i codomains have shifts n(p−1) and i(p−1); they should be 2n(p−1) and 2i(p−1); affects nothing.
- **Error** in ns18 at Proposition IV.1.16, printed p.333: the source says the odd-p total operation has unsigned coefficients on P^i and βP^i; with Tate coefficients on the right and the Koszul rule it should carry (−1)^i and (−1)^(n+i), since the unsigned map is not multiplicative on degree-one classes of BC₃×BC₃; affects a stated result.
- **Misprint** in ns18 at Remark IV.1.11, printed p.328: the source says the transfer ideal lives in R⁰(BΣ_p); it should be R⁰(X×BΣ_p), as its own next display has; affects nothing.
- **Gap** in ns18 at the proof of Theorem IV.3.7, printed p.355: the source says the growing connectivity of the totalization fibers is proven by Kuhn for simply connected Y; Kuhn's Theorem 6.6 assumes a finite complex, and the extension to arbitrary simply connected Y is the filtered-colimit argument of Malkiewich's Proposition 2.22; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1db8b48503601a4d5d564d43e3c53f6ad175536c", "job": "RT-StableHomotopyKTheoryPartII~2b", "model": "fable", "worker": "chris-x10"} -->
