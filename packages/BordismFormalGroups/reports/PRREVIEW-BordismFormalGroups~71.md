# Review of BordismFormalGroups (pull request #1807 at b591e89)

**Verdict:** needs changes

## R01 (P2) — F2.2 asserts strong convergence of the HF_p-Adams spectral sequence for every bounded-below spectrum

**Location:** `TauCetiRoadmap/BordismFormalGroups/README.md` lines 890–892: "prove the pairing for ring spectra (Ravenel, Theorem 2.3.3) and, for bounded-below X, strong convergence to the homotopy of the HF_p-nilpotent completion."

**Claim:** Strong convergence needs a finiteness hypothesis that the sentence drops; bounded-below alone gives conditional convergence. The source cited for the E∞-term assumes finite type.

**Witness:** X=⋁_(n≥1)Hℤ/p^n, A=⊕ℤ/p^n: π₀ of the completion is Ext(ℤ/p^∞,A), and ⋂_s p^s·π₀=lim¹_s A[p^s]≠0 has infinite Adams filtration. ravenel-green line 2632: Theorem 2.1.1(ii) reads "if X is of finite type".

**Repair:** Replace the quoted clause by: "prove the pairing for ring spectra (Ravenel, Theorem 2.3.3) and, for bounded-below X, conditional convergence to the homotopy of the HF_p-nilpotent completion, which is strong when H_*(X;𝔽_p) is of finite type, every E₂^(s,t) then being finite (Ravenel, Theorem 2.1.1(ii), p. 42, for connective X of finite type)." Add to the Checks: "For X=⋁_(n≥1)Hℤ/p^n, bounded below and not of finite type, π₀ of the derived p-completion is Ext(ℤ/p^∞,⊕ℤ/p^n), whose elements divisible by every p^s form lim¹_s(⊕ℤ/p^n)[p^s]≠0 and have infinite Adams filtration; so the filtration is not Hausdorff and strong convergence needs finite type." Tested on the instance: H₀(X;𝔽_p) is infinite-dimensional, so the repaired sentence asserts only conditional convergence for it; MU, the case F2.3 uses, is of finite type.

## R02 (P3) — F2.6's *Needs:* line omits the suppliers of MO, of the real Thom orientations and of the RP∞ comparison

**Location:** `TauCetiRoadmap/BordismFormalGroups/README.md` lines 1169–1172: "*Needs:* GeneralizedCohomology G2.4 (symmetric spectral model), G2.6 (true homotopy groups) and G2.7 (HF₂ and module spectra); F2.2's dual Steenrod algebra; F2.4's MO_* and F2.5's real laws; F1.4's pinned …".

**Claim:** F2.6 builds the Thom transformation MO→h, multiplicative real Thom classes, the map MO→HR and `HR^*(RP∞)=R[[x_H]]`. The spectrum MO, the real orientations and the telescope sequence it uses are named in no item of its *Needs:* line.

**Witness:** Lines 1103 ("Construct the Thom transformation MO→h"), 1135–1139 ("ordinary real Thom orientation", "HR^*(RP∞)=R[[x_H]]"). F2.4 (line 1044) and F2.5 (lines 1079–1080) name G5.3–G5.4, G4.3, G4 and G3.4 for the same objects.

**Repair:** After "G2.7 (HF₂ and module spectra)" insert ", G3.4 (the Milnor sequence of a telescope, for HR^*(RP∞)), G4.3 and G4.5 (real Thom classes and orientations) and G5.3–G5.4 (the Thom model of MO, the source of the Thom transformation)". The layer's Dependencies (lines 1196–1199) already list all four.

## R03 (P3) — The description does not state the suppliers BordismFormalGroups gains and two it drops

**Location:** Description, BordismFormalGroups paragraph: "It drops HomotopySpheres and TangentialBordism (a loop through StringOrientation), owning … and takes the finite CW type of compact smooth manifolds from AlgebraicTopology 8.7."

**Claim:** The head adds CharacteristicClasses and TopologicalKTheory as suppliers and no longer names DGFloer or GeometricTopology; the paragraph says neither, nor that F2.2 and F6.2 now own the completion comparison and ΩBU≃U.

**Witness:** Head README lines 229–237 ("From TauCetiRoadmap.CharacteristicClasses", "From TauCetiRoadmap.TopologicalKTheory"); occurrences in main's README: CharacteristicClasses 0, TopologicalKTheory 0, DGFloer 1 (line 654), GeometricTopology 1 (line 2579); in the head's: 8, 11, 0, 0.

**Repair:** After the quoted sentence add: "It also drops DGFloer and GeometricTopology (Serre fibrations and finite CW models now come from AlgebraicTopology §§5.5 and 8.7, with §§8.3 and 8.8–8.10) and adds two suppliers: CharacteristicClasses (C3 for F2.4, its Conventions for F6.6) and TopologicalKTheory (the Bott class for F2.1, T1.5 and T1.6a for F6.2, T2.5 for F6.3). F2.2 also owns the identification of the HF_p-nilpotent completion of bounded-below spectra with derived p-completion, and F6.2 the loop comparison ΩBU≃U."

## Previous findings (review of 89357f3)

- R01 — repaired: lines 2164–2182, "Own the loop comparison ΩBU≃U, the complex counterpart of TopologicalKTheory T7.1's ΩBO≃O, which no supplier states"; *Needs:* (2356–2359) names T1.5, T1.6a and Stage 5.5, and G2.9 is no longer cited.
- R02 — not repaired: deferred (D01). This folder's half is done: lines 892–896, "the identification is owned here, and G3.9 supplies only the derived completion, its Hom/Ext sequence and its tensor formula"; Scope lines 34–36 list it.
- R03 — repaired: G3.4 at lines 789, 1080, 3667 and 3761; G3.2's restriction tower at 821–823 and 904–906; contracts 212–216; Layer 2 Dependencies 1198.
- R04 — repaired: Checks at lines 2205–2216 (X(r)), 2285–2295 (Tel(α;R)) and 3237–3250 (stabilizer groups); values recomputed in the table.
- R05 — not repaired: the description's paragraph is unchanged; raised as R03.

## Deferred findings

- D01 — stands

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| F1.1 n-series, Frobenius factorization | [p] of X+Y+XY; x^p on the additive law over 𝔽_p | (1+x)^p−1=x^p, coefficients of x^k, p∤k, are binomials divisible by p; x^p=g(x^p), g=x, g′(0)=1, order p¹ | matches Lemma A2.2.7 (ravenel-green line 20711) | — |
| F1.3 invariant differential | X+Y+XY; un-inverted 1+T | P(F)·F_X=(1+Y)/((1+X)(1+Y))=(1+X)⁻¹=P(X); (1+X)(1+Y)·(1+Y)≠1+X | invariance holds; wrong model excluded | — |
| F2.1 K-theory law | x_K(L)=u⁻¹([L⁻¹]−1); dual line | u⁻¹((1+ux)(1+uy)−1)=x+y+uxy; x+(−x/(1+ux))+ux·(−x/(1+ux))=0 | restriction +1; inverse not −x | — |
| F2.2 Kudo; splitting at p=2 | \|y\|=2k; Poincaré series | source (2k+1,2k(p−1)), r=2k(p−1)+1, target degree 2kp+2=\|βP^kτy\|; ∏(1+t^d)/(1−t^(2d))=∏(1−t^d)⁻¹, d=2^i−1 | consistent with guillou-weibel line 788 | — |
| F2.2 convergence | X=⋁_(n≥1)Hℤ/p^n; X=MU | lim¹_s A[p^s]≠0 (images p^k·A[p^(s+k)] lose the summands n≤k) lies in ⋂p^s·π₀; MU: E₂^(s,t) finite | fails without finite type | R01 |
| F2.3 Quillen, Hurewicz | i=1..6; a_i | i+1=2,3,4,5,6,7 → 2b₁,3b₂,2b₃,5b₄,b₅,7b₆; t−s of a_i is 2p^i−2 | matches 3.1.5(ii), 3.1.10 (lines 3748, 3816); even | — |
| F2.4 π_*MO, degree 5 | ranks | A_*: 1,1,1,2,2,2; P: 1,0,1,0,2,1; ΣA_iP_(5−i)=1+2+0+2+0+2=7=p(5) | holds; miller-cobordism line 1373 | — |
| F2.5 real law | X+Y+XY over 𝔽₂; degrees 1, 2 | F(x,x)=x²≠0; 1+1=2 excluded, 2+1=3 allowed | matches π₁MO=0, π₂MO=𝔽₂ | — |
| F2.6 Conner–Floyd | R=𝔽₂; R=MO_*; *Needs:* | h_*=H_*(−;𝔽₂); π₂H(MO_*)=𝔽₂x₂ against 0 ungraded; MO, real orientation, RP∞ used, not named | mathematics holds | R02 |
| F3.2 Honda law | v_n↦1; v_n↦u; v_n,v_(n+1)↦1; n=1 | x^(p^n); u·x^(p^n); x^(p^n)+_F x^(p^(n+1)); (1+x)^p−1=x^p | height n in each; only the first is H_n | — |
| F4.2 higher brackets | r=3, 4; ⟨2,η,2,η⟩ | Σ\|a_i\|+1, +2; inner ⟨2,η,2⟩={η²}∌0 | no defining system | — |
| F4.3 comodules, ANSS | t₁ at p=3; BP_*/p | Δt₁=t₁⊗1+1⊗t₁, stem 2p−3=3, π₃S_(3)=ℤ/3; finitely presented, p-torsion so not projective | holds | — |
| F4.4 convergence | fibre F of S_(p)→BP; X=S | π₀F=0 from π₀S_(p)≅π₀BP and π₁BP=0, so F^(∧s) is (s−1)-connected; limits ℤ_(p) against ℤ_p | strong for bounded-below X (finite filtration per degree) | — |
| F4.6 Hopf rings | BP⟨1⟩_2; K(ℤ_(2),3) | homotopy in degrees 2+j(2p−2); 2ι₃²=0, reduction Sq³ι₃≠0, so H⁶ and H₅ have 2-torsion | range hypothesis needed, stated | — |
| F5.1 invariant primes | (p); (v₁); (p,v₂); (p,v₁−1) | η_R(p)=p; η_R(v₁)=v₁+pt₁, pt₁∉(v₁)Γ; v₁t₁^p−v₁^p t₁∉(p,v₂)Γ; inhomogeneous, invariant, quotient 𝔽_p[v₂,…] | list exact for homogeneous ideals | — |
| F6.7 extension nullhomotopy | r_C=0; Q=0; zero weight | eν=1 gives δ=δqj~0; δ:0→ΣA null; eν=0 gives no information | hypotheses used | — |
| `nonempty_formalGroupIso_iff_height_eq` | 𝔾ₐ, 𝔾ₘ over 𝔽̄_p; h=1, v₁↦a,b | heights ⊤≠1; t₀^(p−1)=b/a: T^(p−1)−b/a separable, roots in k; over 𝔽_p none when a≠b | both directions; `IsSepClosed` needed, present | — |
| `isPrime_and_invariant_iff_eq_heightIdeal` | ⊥; ⊤; (a₁₁); (2,a₁₁−1); (4) | `heightIdeal_zero` gives ⊥; ⊤ not prime, no height ideal is ⊤; η_R(a₁₁)=a₁₁+2b₁; inhomogeneous; not prime | sides agree; `hI` needed | — |
| `lubinTate_universal_deformation`, `IsStarIso` | h=1; R=k; R=ℤ→𝔽_p; [1+p] on 𝔾ₘ | `Fin 0`; θ(t)=0; θ(f)≡Σ_(\|α\|<N)c_αθ(t)^α mod 𝔪^N, A Hausdorff; reduction x+x^p+x^(p+1)≠x | `∃!` well posed; ⋆ needed | — |
| F5.4 Landweber exactness | M=ℤ; ℤ[u^(±1)]; ℚ | v₁=0 on ℤ/p≠0; [p](x)≡u^(p−1)x^p, unit; M/p=0 | fails; holds; holds | — |
| F6.1 localization | L_(Hℚ)(S/p); ⟨HF_p⟩,⟨Hℤ⟩ | S/p∧Hℚ=0; Hℚ∧HF_p=0, Hℚ∧Hℤ=Hℚ | not conservative; strict inequality | — |
| F6.2 nilpotence | Moore boundary δ; slopes at p=2 | MU_*(S/p) even, MU_*(ΣS) odd, H₁(δ;𝔽_p) iso; 2r·2^k−1=r·2^(k+1)−1 | MU_*δ=0, δ not smash-nilpotent | — |
| F6.2 ΩBU≃U (new) | n=1; i=0, 1 | V₁(ℂ^N)=S^(2N−1) is (2N−2)-connected; π₁BU≅π₀U=0, π₂BU≅π₁U=ℤ | agrees with hatcher-at lines 16593, 17667 and T1.5's 2(n−k) bound | — |
| F6.2 X(r) Checks (new) | r=1, 2 | cofibre of S→MU starts in degree 2: iso on π₀, onto π₁, ℤ/2→0 not injective; H₄: ℤb₁² against ℤb₁²⊕ℤb₂ | (2r−1)-connected, not 2r | — |
| F6.2 Tel Checks (new) | holim along 2; η | π₀=lim=0, π₋₁=lim¹=ℤ₂/ℤ; η³ is the element of order 2 of ℤ/24, 12ν; π₄S=0 | telescope ≠ limit; Tel(η;S)≃0 | — |
| F6.3 type, periodicity | S_(p); S/p; Adams maps | K(0)_*=ℚ; K(0)_*(S/p)=0, K(1)_*(S/p)≠0; 8=2·4·(2−1), 2p−2 | types 0, 1; a=4, 1 | — |
| F6.4 stabilizer Checks (new) | m=1, p odd and 2; m=2 | 1+pℤ_p≅ℤ_p, d=1; −1∈1+2ℤ₂, 1+4ℤ₂≅ℤ₂; ω^p≠ω as p²−1>p−1; e·f=m·m | holds | — |
| F6.4 fracture, n=1, p odd | π₀ of corners | ℤ_p, ℚ, ℚ_p; ℚ×_(ℚ_p)ℤ_p=ℤ_(p); product would give ℚ×ℤ_p | cartesian | — |
| F6.5 Tate vanishing | K(n), C_p; Hℤ, C_p | [p](x)=v_n x^(p^n), so x^(p^n)=0; Ĥ^(2k)(C_p;ℤ)=ℤ/p≠0 | vanishing K(n)-locally only | — |
| F6.6 Euler cancellation | χ=[2]; HF₂; q=2 | 2x+a₁₁x²+⋯, 2 regular; v₁x² mod 2; [2]=0 additive; (Π−n)(Π+n)=Π² | regular; fails over HF₂ as stated | — |
| F2.2 against G3.9 | hypotheses | "bounded-below" here; "bounded-below, degreewise finite type" in G3.9 (GeneralizedCohomology README lines 2751–2754) | two owners | D01 |

- Source locators read at the text: 71 in 9 sources (ravenel-green 30, hatcher-at 9, miller-cobordism 9, cdvn-toda 6, hovey-comodules 5, guillou-weibel 4, quillen-fgl-bulletin 3, hovey-mstring 3, bauer-tmf 2); theorem numbers and printed pages agree with the README in each, the one hypothesis dropped being R01's.
- Pinned Tau Ceti declarations opened, `TauCeti/RingTheory/FormalGroup/`: `Rigidity.lean` 186, 229; `CoordinateChange/HopfAlgebroid.lean` 390; `Height/Ideal.lean` 104, 195; `Height/Basic.lean` 316; `Logarithm/InfiniteHeight.lean` 278. The tree has no `IsSepClosed`, p-typical or Lubin–Tate declaration, so no headline is at the pin.
- Cross-roadmap citations resolved at this head: TopologicalKTheory T1.5 (lines 451–454, 497), T1.6a (807), T7.1 (2023); GeneralizedCohomology G3.2 (2315, restriction tower 2330–2332), G3.4 (2423), G3.9 (2718), G5.4 (3891–3894); AlgebraicTopology §5.5 (2366, 2376). The anchor `#f65-local-group-actions-and-completion-comparisons` has no citation left in this head's GeneralizedCohomology.
- Gate: the worker's gate passes every check. Dependency check: `depcheck: 241 roadmaps, 2255 edges, 0 problem(s)`.
- Lean: `lake env lean` on `Suggested.lean` gives three `sorry` warnings and nothing else; the four elaborated signatures agree with README lines 644–649, 1798–1806, 1909–1912 and 1949–1959, no binder lost (the fifth entry of the signature list, `,` at line 31, is the word "theorem," inside the module docstring). The probe `first | rfl | simp | infer_instance | exact Iff.rfl` on a scratch copy closes none of the three theorems: no padding.
- Headlines: Lazard's classification, the invariant primes of L and the Lubin–Tate theorem are stated; the module docstring names Quillen's and Thom's theorems, Bousfield localization, the Conner–Floyd comparison, Landweber exactness, nilpotence, thick subcategories and periodicity, smashing, fracture, Tate vanishing, F6.6 and F6.7, each with its missing carrier.
- Overlap check: read ChromaticHomotopyTheory, GeneralAlgebraicKTheoryPartII, StableHomotopyKTheoryPartII, GeneralizedCohomology, LubinTateFormalModulesAndQuasiCanonicalLifts, EllipticCohomology, TangentialBordism, StableHomotopyKTheory (the third list is empty). Shared: the HF_p-completion comparison with GeneralizedCohomology G3.9, owner F2.2 (D01); Steenrod algebras, Adams towers and the MO splitting with main's TangentialBordism B4, owner F2.2 and F2.4 by the map at README lines 79–88 (see the last section); ΩBU≃U has no other owner on main or at any open head. The others consume F1–F6 by label; #1808 is ordered after this pull request in the description; no `Suggested.lean` elsewhere declares one of the four names.
- Source independence: 13 passages compared with 5 sources (the new ΩBU paragraph with hatcher-at lines 17667–17671 and the James paragraph with 20284 and 12578; F2.2 with guillou-weibel 752–759 and 784–788 and with ravenel-green 2627–2635; F2.1 with 6005–6008 and 6027–6035; F2.3 with 3770–3775; F3.2 with 20786–20789; F4.4 with 7556–7564; F5.1 with 6801–6813; the Lazard docstring of `Suggested.lean` with 20790–20792; F2.4 with miller-cobordism 1226–1261; F4.3 with hovey-comodules 501), none shared beyond phrases the statements force; largest share ravenel-green, about 60 of 115 locator groups; contents compared with ravenel-green: independent (Layer 1 ↔ App. A2, Layer 2 ↔ §§2.1–2.2, 3.1 and 4.1, Layer 3 ↔ §§4.1–4.2, Layer 4 ↔ App. A1, §2.2 and §4.4, Layer 5 ↔ §4.3, Layer 6 ↔ none; not one to one and not in order).

## Not verifiable

- Settled as uncertified, cited by locator only: Bousfield 1979, §1 and Theorem 6.6 (F2.2, F6.1); Thom 1954, Chapitre IV (F2.4); Quillen 1971 (F2.6); Adams, Part III §7 and *Lectures*, Lecture 4 (F4.4, F3.3); Wilson, Corollary 5.1 (F4.6); Toda 1962 (F4.1); Landweber 1976 (F5.2, F5.4); James 1955, Devinatz–Hopkins–Smith, Hopkins–Smith (F6.2, F6.3); Johnson–Wilson, Würgler (F6.3); Symonds, Hovey–Strickland, Greenlees–Sadofsky (F6.4, F6.5).
- Cached, outside the sample and not reopened this round: ravenel-orange, lubin-tate-1966, bokstedt-neeman, lawson-bousfield, kuhn-tate, clausen-mathew, hovey-sadofsky, nikolaus-scholze, lurie-htt, lurie-ha.

## Source issues

- **Gap** in ravenel-green at Theorem 4.3.2(iv), p. 121: the source says the I_n, 0≤n≤∞, are the only invariant prime ideals of BP_*; it should restrict to homogeneous ideals, since (p,v₁−1) is invariant and prime; affects a stated result.
- **Misprint** in ravenel-green at Definition A2.2.11, p. 367: the source says "for a natural number h" and then defines F_n by θ(v_n)=1; it should quantify over n; affects nothing.

## For the human reviewers

- **Ownership on main.** Main's TangentialBordism (README line 76) names itself owner of the mod-p Steenrod algebras and Adams towers that F2.2 owns here; main's HomotopySpheres likewise for F4.1 and F6.2; the description defers their revision to other pull requests.
- **Licence.** README lines 2163, 3868, 3880, 3890, 3891 and 3894 link copies of papers by other authors hosted on D. Ravenel's university pages; I could not classify those hosts for the works concerned.
- **Licence.** `miller-cobordism` (Miller, *Notes on Cobordism*) is unpublished lecture notes; the cached copy comes from a third party's university page (miller-cobordism line 2), while the README links the author's.
