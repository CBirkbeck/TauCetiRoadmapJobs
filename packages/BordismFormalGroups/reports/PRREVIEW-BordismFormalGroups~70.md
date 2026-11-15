# Review of BordismFormalGroups (pull request #1807 at 89357f3)

**Verdict:** needs changes

## R01 (P2) — F6.2 cites G2.9 for a loop/bar comparison that G2.9 does not state; ΩBU≃U has no owner

**Location:** `TauCetiRoadmap/BordismFormalGroups/README.md` lines 2141–2143: "Use G5.4's complex space-level Bott equivalence and G2.9's loop/bar comparison, with the stable determinant fibration SU→U→S¹, to construct the actual additive Bott map ΩSU→BU"; line 2285 (*Needs:*): "G2.9 (loop/bar comparison)".

**Claim:** The map ΩSU→BU is built from G5.4's `Ω²(ℤ×BU)≃ℤ×BU` and a weak equivalence U→ΩBU. No cited section states the second, so the step is an unowned prerequisite written as if supplied.

**Witness:** `TauCetiRoadmap/GeneralizedCohomology/README.md` at this head, G2.9 (lines 1239–1293): join and bar classifiers, classification, trivializations, clutching; neither "Ω" nor "loop" occurs. TopologicalKTheory T7.1 (line 2023) owns only ΩBO≃O and ΩBSO≃SO.

**Repair:** State it in F6.2 as a target, before the Bott map: "Prove the loop comparison for U=colim U(n) and SU: the total space of G2.9's universal principal G-bundle is weakly contractible, so the connecting map of AlgebraicTopology Stage 5.5's fibration sequence is a weak equivalence G→ΩBG, compatible with the two products up to homotopy (Hatcher, Proposition 4.66)." In the *Needs:* line replace "G2.9 (loop/bar comparison)" by "G2.9 (universal principal bundles and the bar model); AlgebraicTopology Stage 5.5 (homotopy sequence of a fibration)". Tested on G2.9's own Checks: G=ℤ gives ΩS¹≃ℤ, G=S¹ gives ΩCP∞≃S¹.

## R02 (P2) — The comparison of the HF_p-nilpotent completion with derived p-completion has two owners, with different hypotheses

**Location:** `TauCetiRoadmap/BordismFormalGroups/README.md` lines 875–878 (F2.2): "strong convergence to the homotopy of the HF_p-nilpotent completion, identified for bounded-below X with G3.9's derived p-completion (Bousfield, §6, Theorem 6.6)".

**Claim:** F2.2 builds the HF_p-Adams tower and proves this identification for bounded-below X. GeneralizedCohomology G3.9, in this pull request, also lists it as its own target, for a narrower class, on an object G does not construct.

**Witness:** `TauCetiRoadmap/GeneralizedCohomology/README.md` lines 2751–2754: "For the bounded-below, degreewise finite type spectra used by HF_p Adams, prove comparison of derived prime completion with the actual HF_p nilpotent/Adams completion". No HF_p-Adams tower is defined in that file.

**Repair:** F2.2 owns it (the tower is F2.2's, and G cannot consume F). In line 877 write "which F2.2 identifies, for bounded-below X, with G3.9's derived p-completion (Bousfield, §6, Theorem 6.6); G3.9 supplies the derived completion, its Hom/Ext sequence and the finitely generated tensor formula, not this identification", and add the identification to F2's list under Scope and ownership. In G3.9 replace the quoted sentence by "BordismFormalGroups F2.2 compares this completion with the HF_p-nilpotent completion of bounded-below spectra." Tested on F2.2's own Check: the Moore spectrum of ℤ/2^∞ is bounded below and not of finite type; F2.2's statement covers it (π₁=ℤ₂), G3.9's does not.

## R03 (P3) — G3.8 is cited for the Milnor sequence of a telescope; that sequence is G3.4's

**Location:** `TauCetiRoadmap/BordismFormalGroups/README.md` line 777 (F2.1 *Needs:*): "G3.8 (the Milnor sequence)"; also lines 208, 808, 885 (F2.2), 1058 (F2.5) and 3671 (F6.6).

**Claim:** F2.1, F2.5 and F6.6 compute E^* of CP∞×CP∞, RP∞×RP∞ and X×BT from finite stages, and F2.2 computes H^*(HF_p) from its levels. Each needs the lim¹ sequence for the cohomology of a telescope; G3.8 states the sequence for the homotopy of a homotopy limit of spectra.

**Witness:** GeneralizedCohomology at this head: G3.4, line 2423, `0→lim¹ E^(q−1)(X_i)→E^q(hocolim X_i)→lim E^q(X_i)→0`; G3.8, line 2598, `0→lim¹ π_(n+1)E_r→π_n holim E_r→lim π_n E_r→0`.

**Repair:** In lines 777, 808, 885, 1058 and 3671 cite "G3.4 (the Milnor sequence of a telescope)"; in line 208 write "G3.4's telescopes and Milnor sequence, G3.8's homotopy limits and connective covers"; add G3.4 to F2's Dependencies (line 1175). F4.4 and F6.5 keep G3.8 for their tower limits.

## R04 (P3) — X(r), the telescope Tel(α;R) and the stabilizer groups are defined without Checks

**Location:** `TauCetiRoadmap/BordismFormalGroups/README.md` lines 2157–2160 ("Construct X(r), its units, products and rank maps"), 2217–2220 ("Define Tel(α;R) as the telescope of the suspended left-multiplication maps") and 3098–3099 ("full stabilizer `𝕊_m=O_D^×`, its strict subgroup `S_m=1+S O_D`").

**Claim:** F6.2's only Checks block is the one for the James construction, and F6.4's item 3 has none. Three definitions that the nilpotence and smashing proofs rest on have no value that a wrong model would miss.

**Witness:** `grep -n '\*\*Checks' README.md` between lines 2081 and 2292 gives line 2178 only; between lines 3094 and 3163 it gives nothing.

**Repair:** Add these blocks.

After line 2160: "**Checks.**
- X(1)≃S, since SU(1) is trivial and the Thom spectrum over a point is the sphere; S→MU is 1-connected, π₁S=ℤ/2 mapping onto π₁MU=0.
- X(2) is the Thom spectrum over ΩSU(2)=ΩS³ with H_*X(2)=ℤ[b₁]: H₂ is ℤ, so X(2) is not S, and H₄ has rank 1 against rank 2 for MU on b₁², b₂, so X(2) is not MU.
- A model with H_*X(r)=ℤ[b₁,…,b_r] would give X(1) the homology ℤ[b₁] instead of that of the sphere."

After item 2 (line 2226): "**Checks.**
- Tel(2;S)=S[1/2] has π₀=ℤ[1/2]≠0: 2 is not nilpotent, and its MU-Hurewicz image 2∈MU₀ is not.
- Tel(η;S)≃0, since η⁴=0 in π₄ˢ=0; the MU-Hurewicz image of η lies in π₁MU=0.
- Tel(0;R)≃0 for every R, and Tel(1;R)≃R: the telescope is a homotopy colimit, not an inverse limit."

After item 3 (line 3163): "**Checks.**
- m=1: D=ℚ_p, 𝕊₁=ℤ_p^×, S₁=1+pℤ_p, quotient 𝔽_p^×, d=1. For odd p, S₁≅ℤ_p has cohomological dimension 1; at p=2, S₁ contains −1 and has infinite cohomological dimension, and U=1+4ℤ₂ is the deeper level.
- m=2: for a Teichmüller generator ω of 𝔽_(p²)^×, SωS⁻¹=ω^p≠ω, so D is not commutative; the relation Sa=aS would give a commutative ring of rank 4 over ℤ_p.
- S^m=p: at m=2 the element S has valuation 1/2, so D is ramified of index 2 over its centre ℚ_p."

## R05 (P3) — The description does not say that BordismFormalGroups gains CharacteristicClasses and TopologicalKTheory as suppliers

**Location:** Description, BordismFormalGroups paragraph: "It drops HomotopySpheres and TangentialBordism (a loop through StringOrientation), owning … and takes the finite CW type of compact smooth manifolds from AlgebraicTopology 8.7."

**Claim:** The paragraph lists the suppliers dropped and not the two added. Main's README names neither roadmap.

**Witness:** Head README lines 221–226: "**From TauCetiRoadmap.CharacteristicClasses:** C3's Stiefel–Whitney classes …" and "**From TauCetiRoadmap.TopologicalKTheory:** the Conventions' Bott class … and T2.5's Adams operations". `grep -c` of either name in main's README is 0.

**Repair:** After that sentence add: "It adds two suppliers: CharacteristicClasses (C3's Stiefel–Whitney classes and `H^*(BO(n);𝔽₂)` for F2.4, its Conventions for F6.6's torus coordinate) and TopologicalKTheory (the Conventions' Bott class for F2.1, T2.5's Adams operations for F6.3); from AlgebraicTopology it now takes §5.5, §8.3 and §§8.8–8.10 as well."

## Previous findings (review of 7fa7fe9)

| Id | Status | Evidence at 89357f3 |
|---|---|---|
| R01, G2.4 cited for localization, idempotents, telescopes | repaired | Lines 1182–1189: "Prove that idempotents split in GeneralizedCohomology G2.4's stable homotopy category … (Bökstedt–Neeman, Proposition 3.2 and Remark 3.3, pp. 221–222)"; *Needs:* 1208–1212, 1310–1313 and 2551–2556 name G3.9, G3.4 and F3.1. |
| R02, F1.5 behind F3 | repaired | Lines 532–600 state the p-typical theory in F1.5 ("nothing here uses F2 or F3"); F3.2 *Needs:* (1254–1257) is F1.5 only; no *Needs:* of F1 names F3. |
| R03, F6.2 *Needs:* | repaired | Lines 2288–2291: "F2.2's mod-p Steenrod operations and dual Steenrod algebra; the mod-p homology operations of Ω²S^(2m+1) … are constructed here". |
| R04, missing locators | repaired | F3.1 (1195–1207), F3.3 (1276–1296), F4.4 (1505–1519), F5.2 (1705–1708), F2.1 (754–760), F2.6 (1130–1135), F4.6 (1616–1622), F6.1 (2027–2029), F6.3 (2306, 2382–2388, 2735, 2743). |
| R05, References | repaired | Lines 3782–3784 list Landweber 1976, Carrick–Davies–van Nigtevecht and Bauer; F5.4 (1839) cites Landweber 1976, Theorem 2.6. |

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| F1.4 exponent two (pinned) | i with i+1=2^k | pin: coefficient of X^(2^k) of `exponentTwoLog` is 0 for k≥1, i.e. a_(2^k−1)=0; `ExponentTwoLazardRing.Index` excludes i+1=2^k | matches lines 464, 500 | — |
| F1.5 Araki right unit | degree 2(p−1) | η_R(v₁)+p^p t₁=v₁+pt₁; cross terms have x-degree ≥p+1 | η_R(v₁)=v₁+(p−p^p)t₁ | — |
| F1.5 non-strict identity | both sides | f⁻¹([p]_G x)=Σ^F t_iθ(v_j)^(p^i)x^(p^(i+j)); [p]_F(f⁻¹x)=Σ^F φ(v_i)t_j^(p^i)x^(p^(i+j)) | equal; A2.2.6 at t₀=1 | — |
| `nonempty_formalGroupIso_iff_height_eq` | x^(p^(h+i)) coefficient; h=1 over 𝔽_p | φ(v_h)T^(p^h)−θ(v_h)^(p^i)T−c_i, derivative −θ(v_h)^(p^i)≠0; t_i-term has degree ≥p^(h+i), so c_i has no t_i; t₀^(p−1)=b/a=1 forces a=b | separable; `IsSepClosed` needed, present | — |
| F1.5 noncommutative law | X+Y+εXY^p | both bracketings X+Y+Z+ε(XY^p+XZ^p+YZ^p); F(X,Y)−F(Y,X)=ε(XY^p−X^pY) | group law, not `IsComm` | — |
| F2.1 K-theory law | x_K(L)=u⁻¹([L⁻¹]−1) | (1+ux)(1+uy)−1=u(x+y+uxy); [O(1)]−1=−β since (1+β)⁻¹=1−β | restriction +1; variant −1 | — |
| F2.2 Kudo, Milnor primitives | \|y\|=2k; i→i+1 | source (2k+1,2k(p−1)), r=2k(p−1)+1, target degree 2kp+2=\|βP^kτy\|; \|Q_(i+1)\|=2p^i(p−1)+2p^i−1=2p^(i+1)−1 | consistent | R02, R03 |
| F2.2 splitting at p=2 | Poincaré series | ∏(1+t^d)/(1−t^(2d))=∏(1−t^d)⁻¹, d=2^i−1 | equal | — |
| F2.3 Hurewicz, collapse | i=1..6; a_i | i+1=2,3,4,5,6,7 → 2b₁,3b₂,2b₃,5b₄,b₅,7b₆; t−s of a_i is 2p^i−2 | matches 3.1.5(ii); even | — |
| F2.4 degree 5 | ranks | A_*: 1,1,1,2,2,2; P: 1,0,1,0,2,1; Σ A_iP_(5−i)=1+2+0+2+0+2=7=p(5) | holds | — |
| F2.5 real law | X+Y+XY over 𝔽₂ | F(x,x)=x²≠0; degree 1 excluded (1+1=2), degree 2 allowed | matches π₁MO=0, π₂MO=𝔽₂ | R03 |
| F3.1 splitting | e on eX∨(1−e)X | cofiber of id is 0, of 0 is Y∨ΣY: cofib(e)=(1−e)X∨Σ(1−e)X | telescope, not cofiber | — |
| F3.3 Adams summands | p=3; general p | ko: degrees ≡0 mod 4 modulo 2(p−1) are 0,4,…,2(p−3): (p−1)/2 summands; p=3 gives one | holds | — |
| F4.1 | ⟨2,η,2⟩; ⟨η,η,2⟩ | η², indeterminacy 2π₂ˢ+π₂ˢ·2=0; η∘η≠0 | value; empty | — |
| F4.2 | r=3, 4; ⟨2,η,2,η⟩ | Σ\|a_i\|+1, +2; inner ⟨2,η,2⟩={η²}∌0, ⟨η,2,η⟩={2ν,6ν}∌0 | no defining system | — |
| F4.3 | t₁; BP_*/p | Δt₁=t₁⊗1+1⊗t₁, stem 2p−3 (3 at p=3); finitely presented, not projective | holds | — |
| F4.4 | fibre F of S_(p)→BP | π₁BP=0→π₀F→π₀S≅π₀BP gives π₀F=0; F^(∧s) is (s−1)-connected | holds | — |
| F4.5 cobar | d[ξ₁ξ₂]; d[ξ₁²ξ₂]+d[ξ₁⁵] | [ξ₁³\|ξ₁]+[ξ₁\|ξ₂]+[ξ₂\|ξ₁]+[ξ₁²\|ξ₁²]; [ξ₁²\|ξ₂]+[ξ₂\|ξ₁²]+[ξ₁²\|ξ₁³]+[ξ₁\|ξ₁⁴] | ⟨h₀,h₁,h₀⟩=h₁², ⟨h₁,h₀,h₁⟩=h₀h₂ | — |
| F5.2 | A/(p,v₁²); A/(p²) | η_R(v₁²)≡v₁² mod p; factors Σ^(2p−2)A/I₂, A/I₂; A/I₁ twice | holds | — |
| `isPrime_and_invariant_iff_eq_heightIdeal` (F5.3) | ⊥; ⊤; (a₁₁); (2,a₁₁−1); (4) | `heightIdeal p 0`=⊥, prime; height ideals lie in (p)+L_(>0); η_R(a₁₁)=a₁₁+2b₁∉(a₁₁)L[b]; inhomogeneous invariant prime; not prime | both sides agree in each; `hI` needed | — |
| `lubinTate_universal_deformation`, `IsStarIso` | h=1; A=k; non-continuous θ | `Fin 0`; θ(t)=0; θ(f)≡Σ_(\|α\|<N)c_αθ(t)^α mod 𝔪^N and A Hausdorff, so π∘θ=ρ∘const and θ is fixed by θ(t_i) | `∃!` well posed | — |
| F6.2 | Moore boundary δ; slopes at p=2; James | MU_*(S/p) even, MU_*(ΣS) odd; 2r·2^k−1=r·2^(k+1)−1; J(S⁰)=ℕ≠ℤ | holds | R01, R04 |
| F6.3 | \|σ^nE\|; v₁ maps; Γ₁^f | Σe_(n+j)(2p^(n+j)−2p^n)=\|E\|−(Σe_i)d_n=c_E d_n+a_E; 8=2·4·(2−1); π_(−1)=ℚ/ℤ_(p) | holds | — |
| F6.4 fracture, n=1, p odd | π₀ | ℚ⊕ℤ_p→ℚ_p onto, kernel ℤ_(p); π₁ of the corner is 0 rationally | π₀L₁S=ℤ_(p) | R04 |
| F6.6 mapping groups | MU∧D₊≃Σ^(d_D)F(D₊,MU) | [Σ^(a+2r+t)X,Σ^(b+d_D)F(D₊,MU)]=MU^(d_D+b−a−2r−t)(X×D) | degree as stated | R03 |
| F6.2 Needs, G2.9 | lines 1239–1293 at head | "Ω", "loop": 0 hits | statement absent | R01 |
| F2.2 vs G3.9 | hypotheses | "bounded-below" against "bounded-below, degreewise finite type" | two owners | R02 |

- Source locators read at the text: 80 in 10 sources (ravenel-green 34, ravenel-orange 17, hatcher-at 6, miller-cobordism 6, hovey-comodules 5, quillen-fgl-bulletin 3, lubin-tate-1966 3, guillou-weibel 3, bokstedt-neeman 2, lawson-bousfield 1); printed pages agree with the README in each.
- Pinned Tau Ceti declarations opened, `TauCeti/RingTheory/FormalGroup/`: `ExponentTwo/Basic.lean` 64, 87, 113; `ExponentTwo/Universal.lean` 83, 90; `ExponentTwo/Iso.lean` 72, 119, 128, 145; `ExponentTwo/Lazard.lean` 70, 110; `ExponentTwo/Coordinates.lean` 55; `AdditiveSeries.lean` 127; `SymmetricCocycle/CharTwo.lean` 84, 101, 114; `SymmetricCocycle/Classification.lean` 420; `Logarithm/InfiniteHeight.lean` 249, 278; `NSMul/Basic.lean` 298; `Height/Basic.lean` 205, 211, 228, 263, 270, 276, 346, 356; `Height/Ideal.lean` 104, 138, 190, 195, 218; `CoordinateChange/HopfAlgebroid.lean` 390; `Rigidity.lean` 186, 229; `Obstruction.lean` 386, 400; `LeadingDifference.lean` 112. No p-typical, Lubin–Tate or separably-closed declaration exists there, so no headline is at the pin.
- Cross-roadmap citations resolved: GeneralizedCohomology G2.3–G2.7, G2.9, G2.11, G3.1, G3.4, G3.8, G3.9, G4.3, G4.5, G5.1, G5.3–G5.5, G5.7; AlgebraicTopology §§5.5, 8.3, 8.7, 8.8, 8.8c, 8.10; CharacteristicClasses C3.2, C3.4, Conventions; TopologicalKTheory Conventions, T2 item 5 (all at this head); on main DGAInfinity Layer 8, SchurWeyl Layers 0, 2, 5, CompactGroups Layers 1–2, ConvexityToric Layer 2, ProfiniteCohomology, EllipticCohomology E2, E4.A, E5. Main's citations of this roadmap (EllipticCohomology, EnhancedDerivedSheaves, StableHomotopyKTheory, PositiveScalarCurvature) use the labels F2, F4, F5, F6, F6.2 and F6.5, all kept; the F6.5 identifiers that moved are mapped at lines 96–122.
- Gate: the worker's gate passes every check. My rerun differs only in `outside-folder=24`, the README and `Suggested.lean` of the 12 sibling folders this pull request owns. Dependency check: `depcheck: 245 roadmaps, 2250 edges, 0 problem(s)`.
- Lean: `lake env lean` on `Suggested.lean` gives three `sorry` warnings and nothing else. The four elaborated signatures agree with README lines 632–637, 1775–1783, 1886–1889 and 1926–1936; no binder lost. One-tactic probes on a scratch copy (`simp`, `aesop`, `infer_instance`) close none of the three theorems: no padding. Headlines: Lazard's classification, the invariant primes of L and the Lubin–Tate theorem are stated; the module docstring names every other headline with its missing carrier (no stable homotopy category, MU, MO, K(n), comodules over the Lazard Hopf algebroid, Tate construction, module families).
- Overlap check: read ChromaticHomotopyTheory, GeneralAlgebraicKTheoryPartII, StableHomotopyKTheoryPartII, GeneralizedCohomology, LubinTateFormalModulesAndQuasiCanonicalLifts, EllipticCohomology, TangentialBordism, StableHomotopyKTheory. The first three, the fifth and EllipticCohomology consume F1–F6 by label (the Lubin–Tate deformation ring from F5, finite localization and smashing from F6.1–F6.4) and own none of its targets. Shared: the HF_p-nilpotent completion comparison with GeneralizedCohomology, owner F2.2 (R02); the Steenrod algebras, Adams towers and MO splitting with TangentialBordism, owner this roadmap, main's TangentialBordism to follow as the description states (see the last section). Ownership against the other open heads was checked by `roadmaps grep` on Lubin–Tate, Brown–Peterson and the James construction only. Dropped ids: the dropped anchor `#f65-local-group-actions-and-completion-comparisons` is cited only by main's GeneralizedCohomology, which this pull request rewrites without the link; #1808 is ordered after this pull request in the description. No id cited here is dropped by an open pull request.
- Source independence: 80 located passages and the whole README body and Lean docstrings compared with 17 cached sources (longest shared run outside titles: six words, "an associative homotopy commutative ring spectrum"), none shared; largest share ravenel-green, about 92 of 190 locators; contents compared with ravenel-green: independent (Layer 1 ↔ App. A2, Layer 2 ↔ §3.1 and §4.1, Layer 3 ↔ §§4.1–4.2, Layer 4 ↔ App. A1, §2.2 and §4.4, Layer 5 ↔ §4.3 and §4.2, Layer 6 ↔ none; neither one to one nor in order, and the order F1→F2→F3→F5→F6 is forced by the *Needs:* lines of F2.3, F3.1, F5.1 and F6.3).

## Not verifiable

- Settled as uncertified, cited by locator only: Toda 1962, Chapter I (F4.1); Bousfield 1979, §1 and Theorem 6.6 (F2.2, F6.1); Adams, Part III §7 and *Lectures*, Lecture 4 (F4.4, F3.3); Landweber 1976, Theorem 2.6 (F5.2, F5.4); Thom 1954, Chapitre IV (F2.4); James 1955 (F6.2); Devinatz–Hopkins–Smith and Hopkins–Smith, Theorems 7 and 9 (F6.2, F6.3); Johnson–Wilson, Proposition 4.14, and Würgler (F6.3); Wilson, Corollary 5.1 (F4.6); Symonds (F6.4); Hovey–Strickland, Proposition 7.10(e), and Greenlees–Sadofsky (F6.5); Quillen 1971 (F2.6).
- Cached, not reopened this round: Carrick–Davies–van Nigtevecht, Bauer, Kuhn, Clausen–Mathew, Hovey–Sadofsky, Nikolaus–Scholze, Hovey's MString paper, Lurie HTT and HA.

## Source issues

- **Misprint** in ravenel-green at Theorem 1.3.16(iv), p. 17: the source says the invariant primes of L are the I_n for 0<n≤∞; it should be 0≤n≤∞, the zero ideal being invariant and prime, as in Theorem 4.3.2(iv); affects nothing.
- **Gap** in ravenel-green at Theorems 1.3.16(iv), p. 17, and 4.3.2(iv), p. 121: the source says these are the only invariant prime ideals; it should restrict to homogeneous ideals, since (p,v₁−1) is invariant and prime, and the proof's lowest-degree step assumes homogeneity; affects a stated result.
- **Misprint** in ravenel-green at the proof of Lemma A2.1.26, p. 360: the source says ζ is a primitive p-th root of unity in the definition of h_q; it should be a primitive q-th root, as in (A2.1.21); affects nothing.
- **Misprint** in ravenel-green at Definition A2.2.11, p. 367: the source says "for a natural number h" and then defines F_n by θ(v_n)=1; it should quantify over n; affects nothing.

## For the human reviewers

- **Ownership on main.** Main's TangentialBordism (README lines 76–77) and HomotopySpheres (lines 3316–3317) still name themselves owners of the Steenrod algebras, Adams towers, James stages and Toda brackets that F2.2, F4.1 and F6.2 own here; the description defers their revision.
- **Licence.** README lines 2140, 3776, 3787, 3788, 3798, 3799 and 3802 link copies of papers by other authors hosted on D. Ravenel's university pages; I could not classify those hosts for the works concerned.
- **Licence.** `miller-cobordism` (Miller, *Notes on Cobordism*) is unpublished lecture notes; the cached copy comes from a third party's university page, the README links the author's.
