<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1067#issuecomment-6379597026 -->
Review (claude) of 29d6cf7

Verdict: needs changes

1. **F01** (P2) gap:valuation-smooth-proper asks for what is already provided, and names the wrong supplier

   - **Location.** `packages/AnalyticToricGeometryPartII/README.md` line 81, which quotes the gap: "What SchemeAndStackFoundations must provide (gap:valuation-smooth-proper): Export prime-to-residue-characteristic smooth proper base change between geometric generic and special fibres over any rank-one valuation ring…". The same contract is used in §4.1 (lines 581, 591), §4.2 (line 599) and the Layer 4 Dependencies (line 617). It is also the `valuation-smooth-proper` entry of `design/plan.json` `gaps`.
   - **Claim.** SchemeAndStackFoundations §2.15 must export the comparison H^i(X_K̄, ℤ/ℓ^m) ≅ H^i(X_κ̄, ℤ/ℓ^m) for X smooth and proper over K°.
   - **Witness.** `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md` (head dfcb6b7) line 3143, §6.2: for proper f over a strictly henselian valuation ring, RΓ(X_η,F) ≅ RΓ(X_s,RΨF). `TauCetiRoadmap/EtaleCohomologyFoundations/README.md` line 540 (§F.2.3): smooth morphisms are ULA, so RΨΛ = Λ. SchemeAndStackFoundations §2.15 (line 3867) contains only Gabber's affine theorem, Galois cohomology, limits and Hochschild–Serre.
   - **Repair.**
     1. Delete the `valuation-smooth-proper` gap from `design/plan.json` `gaps` and from README line 81.
     2. In §4.1 Needs (line 591), the §4.1 route (line 581), the §4.2 route (line 599) and the Layer 4 Dependencies (line 617), replace "SchemeAndStackFoundations §2.15 (and its valuation-base-change contract) / gap:valuation-smooth-proper" with "ClassicalAdicEtaleCohomology §6.2 (proper specialization RΓ(X_η,F) ≅ RΓ(X_s,RΨF) over a strictly henselian valuation ring); EtaleCohomologyFoundations §F.2.3 (smooth morphisms are universally locally acyclic for invertible torsion, so RΨΛ = Λ)".
     3. Add a `### From TauCetiRoadmap.EtaleCohomologyFoundations` supplier subsection.
     4. If the fix worker finds that §F.2.3's smooth ULA is stated only over noetherian bases, re-declare the gap against EtaleCohomologyFoundations §F.2.3. Its needs would then be only "smooth ULA over a non-noetherian rank-one valuation ring, by noetherian approximation".
   - **Tested.** X = ℙ¹ over O_C, ℓ ≠ p. K alg. closed makes O_C strictly henselian with separably closed fraction field, so §6.2 applies and gives RΓ(ℙ¹_C,Λ) ≅ RΓ(ℙ¹_κ̄,RΨΛ). Smooth ULA gives RΨΛ = Λ. So H⁰ = Λ, H¹ = 0, H² = Λ on both sides, which matches the §4.1 Check (line 585).

2. **F02** (P2) gap:intersection-positivity-cuts is compound, and one of its clauses is already provided

   - **Location.** README line 85 (quoted): "Export positive ample degree of every nonzero effective projective cycle, localized top Chern support for arbitrary sections including excess intersection, and ample hypersurface cuts over any infinite field…". This is the plan.json gap with section "5.3–5.6; 4.13", used by §6.3 (line 747) and §6.4 (line 766).
   - **Claim.** One gap carries three unrelated exports from two supplier layers, and all three are asked of SchemeAndStackFoundations.
   - **Witness.** `TauCetiRoadmap/SchemeAndStackFoundations/README.md` lines 6818–6828 (§5.5) already build the refined Gysin map `Chow.gysin i f : CH_k(Y′) → CH_{k−d}(X′)`, with values on the fibre product X′, together with `excess_intersection`. For the zero section of ⊕O(D_i) pulled back along s, X′ is Z(s): this is the localized top Chern class.
   - **Repair.**
     1. Remove the clause "localized top Chern support … excess intersection" from the gap. Instead cite SchemeAndStackFoundations §5.5 `Chow.gysin` and `excess_intersection` in §6.3 (line 733 route, Needs line 747).
     2. Split the remainder into two declared gaps, with the same slugs in plan.json and README:
        - `gap:ample-degree-positivity` (§§5.3–5.4): deg(c₁(H)^d ∩ [V]) > 0 for every d-dimensional integral closed V of a projective k-scheme, and H ample.
        - `gap:ample-generic-cuts` (§4.13): over an infinite field k, a projective W of positive dimension has a hypersurface in some |O(m)| defined over k that contains no top-dimensional geometric component of W, and the cut is nonempty of dimension dim W − 1.
   - **Tested.** ℙ², two copies of the same line section. 0^! of O(1)⊕O(1) along s = (ℓ,ℓ) lies in CH₀(ℓ). By the excess formula it is c₁(O(1)) ∩ [ℓ], which has degree 1, so the support is nonempty. This reproduces the §6.3 Check (line 742) without the removed clause.

3. **F03** (P3) ShimuraCompactifications C0.6–C0.7 are cited for face localization, but they are face projections

   - **Location.** README line 51: "C0.6–C0.7 supply ordinary character face localization". Also line 9, the routes at lines 157 and 251, and the Needs at lines 175, 269 and 310.
   - **Claim.** C0.6–C0.7 supply the open face charts.
   - **Witness.** `TauCetiRoadmap/ShimuraCompactifications/README.md` (head 63e3f03), lines 498 and 513. C0.6–C0.7 make the face projection R[P]→R[F] (the closed-stratum quotient, which sends e_p to 0 off F) and the off-face ideal commute with coefficient change. The localization open immersion is C0.9 (line 568), and the gluing is C0.16 (line 747).
   - **Repair.**
     1. Line 51 should read: "C0.6–C0.7 supply the face projections and off-face ideals (closed strata) and their coefficient change; C0.9 supplies the face open immersions given by inverting an exposing character; C0.16 …".
     2. In lines 9, 175, 269 and 310, and in the routes at lines 157 and 251, cite "C0.9 and C0.16" wherever localization is meant.
     3. Keep C0.6–C0.7 only for the orbit ideals of §0.1.
   - **Tested.** On the positive ray, the face {0} is reached by inverting t, which is C0.9. C0.6 sends t to 0, which is the origin stratum.

4. **F04** (P3) PerfectoidSpaces P7 locators, and the meaning of "~" in §3.2

   - **Location.**
     - Line 471: "PerfectoidSpaces P7.1–P7.4 (completed-colimit criterion)".
     - Line 65: "P7.1–P7.3 and P7.12 supply chart-density tilde-limits, residue-field conversion…".
     - Line 459: §3.2 cites SCH12 "Definition 7.14 and Theorem 7.17" for "~".
   - **Witness.**
     - `TauCetiRoadmap/PerfectoidSpaces/README.md` line 16687: *tilde-limit-from-completed-colimit* lies in P7.11 (from line 16556), together with AdicSpacesPartII R0.20.1.
     - Line 17140: *tilde-limit-implies-residue-field-tilde-limit* lies in P7.15.
     - SCH12 line 2317 (Definition 7.14) defines the residue-field relation of P7.3, not the chart-density relation of P7.1–P7.2 that §3.2 uses.
   - **Repair.**
     1. In §3.2 Needs, cite "PerfectoidSpaces P7.11 (*tilde-limit-from-completed-colimit*); AdicSpacesPartII R0.20.1".
     2. In line 65, attribute the residue-field conversion to P7.15.
     3. In line 459, add: "(SCH12 Definition 7.14 is the weaker residue-field relation of P7.3, which follows by P7.15)".

5. **F05** (P3) §3.1 reads as an identity

   - **Location.** Line 443: "For every Σ, TΣ,K♭≅TΣ,K♭, preserving cone charts…".
   - **Witness.** Both sides render identically, so as written the headline statement of SCH12 Theorem 8.5(i) (line 2414) is a tautology. The intended statement is that the tilt of T_{Σ,K} is T_{Σ,K♭}.
   - **Repair.** Write "(TΣ,K)♭ ≅ TΣ,K♭". Check it on the positive ray: the tilt of K⟨t^(1/p^∞)⟩ is K♭⟨t^(1/p^∞)⟩ (Check line 449).

6. **F06** (P3) the cited FS94 wall relation uses the opposite sign to the README's data, and the README does not say so

   - **Location.** Line 19 cites "FS94, equation (2.3), p. 7; … FS94 line 234" for the signs. Line 689 states "m_ρ′−m_ρ=c(σ)b_(ρ,σ)".
   - **Witness.** FS94 line 235 relates the Cartier data by u(ρ)−u(ρ′)=c(σ)m_(ρ,σ). With the README's section-generator data (O(D₋) on ℙ¹: m₊=0, m₋=1, b₊=1), the printed relation gives c=−1, but the degree is +1. The README's formula gives +1, so it is correct only with u(ρ) = −m_ρ.
   - **Repair.** Add to §6.1: "FS94's u(ρ) in (2.3) are local-equation weights, u(ρ) = −m_ρ; with section-generator weights the relation reads m_ρ′−m_ρ=c(σ)b_(ρ,σ), as the ℙ¹ Check (line 706) confirms."

7. **F07** (P3) some *Needs:* lines include a gap their statement does not use, and one omits a supplier its route uses

   - **Location.** §2.1 Needs (line 343), §3.1 Needs (line 455) and §2.4 Needs (line 429) all list "gaps:perfected-cone-algebras and homogeneous-cone-approximation". §5.1 Needs (line 637) omits the constructible-topology compactness that its route (line 627) uses.
   - **Witness.**
     - Neither the statement nor the route of §2.1 or §3.1 uses the homogeneous estimate. §2.4 only states that its hypotheses hold; the estimate is applied in §5.2 (line 656).
     - `TauCetiRoadmap/AdicSpacesPartII/README.md` R0.19.1–R0.19.3 own the profinite constructible topology and pro-constructible subsets.
   - **Repair.**
     1. Delete "and homogeneous-cone-approximation" from lines 343, 429 and 455.
     2. Add "AdicSpacesPartII R0.19.1–R0.19.3" to line 637.

8. **F08** (P3) smaller locator and manifest slips

   - **Location and witness.**
     - Line 57 says "AdicSpaces §§3–5 supply affinoid spectra, rational opens". Affinoid spectra and rational subsets are AdicSpaces Layer 2 (`TauCetiRoadmap/AdicSpaces/README.md` line 354).
     - Line 660 cites "Proposition 8.7 and proof, pp. 306–307". The statement and the whole proof are on p. 306 (SCH12 lines 2458–2492; the p. 307 header is at line 2494).
     - In `sources.toml`, FS94 has `cited_for = ["Layer 6"]`, but FS94 is also cited in Conventions (line 19) and §0.6 (line 221).
   - **Repair.**
     1. Line 57: "§§2–5".
     2. Lines 660 and 664: "p. 306".
     3. Set FS94 `cited_for = ["Conventions", "0.6", "Layer 6"]`.

9. **F09** (P3) paragraphs after the Checks repeat the Checks

   - **Location.** Lines 191, 233, 283, 453, 527, 561, 589, 607, 673, 727, 745 and 764, for example line 191: "The hypersurface x²=0 on an affine chart retains coefficient multiplicity two."
   - **Witness.** Each repeats a Check of the same subsection: 191 repeats 187; 283 repeats 279 and 281; 561 repeats 557; 727 repeats 723; 745 repeats 741; 764 repeats 759–762. This is padding.
   - **Repair.** Delete these trailing paragraphs. Where one says something new (none of those listed does), move it into a Check bullet.

Nine findings: two blocking (P2), seven non-blocking (P3). No P1. The mathematics checks out on every instance I computed (table below). The two blocking findings are both about declared supplier gaps: one asks a supplier for a result that other roadmaps already provide, and one bundles three separate exports, one of which is already provided. Every other supplier citation resolves, apart from the locator slips listed as P3.

## Verified sound

**Commands.**
- Dependency check (`gate --depcheck … --movable`): `depcheck: 29 roadmaps, 260 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- Merge order: this roadmap is at position 180, after its last supplier ShimuraCompactifications (178). The consumers DeligneWeightsAndPurityPartII (182) and MotivesAndAlgebraicCyclesPartII (222) are cited only under consumers.
- Elaboration: `lake env lean packages/AnalyticToricGeometryPartII/Suggested.lean`, run from the content checkout at the pins, exits 0 with no messages. The file declares nothing, so there is not even a `sorry` warning.
- `roadmaps resolve`: no cross-roadmap citation or Lean name is unresolved.

**Pins.** Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 (HEADs confirmed).

**Suggested.lean, headlines and padding.**
- The README's headlines are §0.3, §§0.4/0.6, §1.2, §§2.1/2.4, §§3.1–3.7 (Theorem 8.5(i)–(v), Theorem 1.5), §4.1, §4.2 (Prop. 8.6), §5.1, §5.2, §5.3 (Prop. 8.7), §6.1, §6.2, §6.3 and §6.4 (Cor. 8.8).
- None of them can be stated at the pins:
  - Tau Ceti's only fan scheme, `Fan.algebraicRealization` (`TauCeti/Geometry/Toric/Algebraic/Fan/Scheme.lean:136`), is over ℂ: `affineCoordinateRing` is `MonoidAlgebra ℂ …` (`AffineScheme.lean:60`).
  - Neither pin has perfectoid spaces, tilde-limits, analytification or operational Chow groups. Mathlib has only `PreTilt`, `Untilt` and `FontaineTheta`.
- Restricting to ℂ or to the unit disc would be a weakened substitute.
- The module docstring names every headline and its missing carrier. It has the required title and form, one `import Mathlib`, no `set_option` and the right namespace.
- There is no padding. Because nothing is declared, the `#check @name` binder comparison and the one-tactic probe have nothing to act on.

**Sources sample (all 15 targets plus every locator in the package; none was flagged unverified).**
- SCH12 (published, Numdam):
  - Definition/Proposition 8.4 at line 2381, p. 304; weight set at line 2386.
  - Unit-model paragraph and proper equality at lines 2391–2399, p. 304.
  - Perfectoid charts and O(D) on X^perf with Banach basis at lines 2400–2409.
  - The map φ at line 2410.
  - Theorem 8.5(i)–(v) at lines 2414–2436, pp. 304–305, with its proof (Proposition 5.20, Theorem 7.17, Corollary 7.19, Proposition 7.16).
  - The projection π at line 2443.
  - Proposition 8.6 at line 2446, proper smooth, K algebraically closed, ℓ≠p.
  - Proposition 8.7 at line 2458, proper smooth, with a dense subfield; graded ring over j∈ℤ[1/p] at line 2463; tautological integral model at line 2477; the Lemma 6.5 analogue at line 2482.
  - Corollary 8.8 at line 2496, p. 307, projective smooth.
  - Theorem 1.5 at line 91, p. 247; Theorem 1.13 and π on coordinates at lines 186–197, pp. 249–250; Lemma 1.16 at line 271, p. 251.
  - Proposition 5.20 at line 1344, p. 280.
  - Lemma 6.5 and Remark 6.6 at lines 1752–1762, p. 288 (proof to p. 290).
  - Definition 7.14 to Corollary 7.19 at lines 2317–2351, pp. 302–303.
  - The pseudouniformizer convention |p|≤|ϖ| at line 746. The README's ϖ^p | p is a stronger normalization and agrees with PerfectoidSpaces P2.1.
- FS94 (arXiv v1): Proposition 1.1 at line 117, p. 4; Proposition 1.4 at line 176 and Theorem 2.1 at line 198, p. 6; Corollary 2.4 and (2.3) at lines 222–235, p. 7; Proposition 3.1 at line 373, p. 10; Theorem 3.2 at line 393, p. 11; proof at lines 491–509, p. 13.
- FS25 Example 4.1 at lines 299–322, pp. 7–8. I recomputed the ten cone determinants (all ±1), the three primitive relations (sides (0,0,−1), (−1,0,0), (0,−1,0)), and completeness (2000 random directions, all covered).
- STACKS tags 020I (line 223) and 035X (line 229).

Every locator supports the statement as written, apart from R04, R06 and R08.

**Library declarations opened at the pins.**
- Mathlib:
  - `AddMonoidAlgebra` (`Mathlib/Algebra/MonoidAlgebra/Defs.lean:64`)
  - `MonoidAlgebra.mapDomainRingHom` (`Mathlib/Algebra/MonoidAlgebra/MapDomain.lean:285`)
  - `ZeroAtInftyContinuousMap` (`Mathlib/Topology/ContinuousMap/ZeroAtInfty.lean:45`)
  - `PointedCone` (`Mathlib/Geometry/Convex/Cone/Pointed.lean:33`)
  - `ConvexCone.Salient` (`Mathlib/Geometry/Convex/Cone/Basic.lean:298`)
  - These five elaborate in a scratch `#check` file.
- Tau Ceti:
  - `TauCeti.Toric.Fan` (`Fan/Basic.lean:83`; no nonemptiness field)
  - `IsToricCone` (`Cone/Basic.lean:147`; fields rational and salient)
  - `primitiveGenerator` (`Ray/Primitive.lean:167`)
  - `dualSemigroup` (`DualSemigroup/Basic.lean:53`)
  - `IsToricCone.fg_dualSemigroup` (`DualSemigroup/Finiteness.lean:76`)
  - `SchemeWeilDivisor` (`AlgebraicGeometry/WeilDivisor/Scheme/Basic.lean:46`)
  - `WeilDivisor.OrderSystem.ofScheme` (`Principal.lean:126`; integral and noetherian)
  - `SchemeWeilDivisor.sheaf` (`Sheaf.lean:250`; binders at lines 75–82: integral, DVR stalks, locally noetherian)
  - `nonempty_iso_sheaf_of_linearlyEquivalent` (`Sheaf.lean:642`; additionally `IsNoetherian` from line 565, which toric field fibres satisfy)
  - `PreAdicSpace.isAdic` (`AdicSpace/PreAdicSpace/Adic.lean:206`; sheafy ∧ locally affinoid)
  - `isAdic_restrict` (line 231) and `AdicSpace` (line 243)
- The README describes each of these accurately.

**Cross-roadmap citations resolved.**
- On main:
  - AnalyticToricGeometry Layer 0 (items 6, 8 and 9)
  - AdicSpaces Layers 2–5
  - AdicSpacesPartII R0, R1 (R1.3, R1.6), R0.19 and R0.20.1
  - AdicSpacesPartIII R2.2, R2.3, R2.4, R2.8 (good-reduction locus and proper equality) and R2.10 (fractional bounds |f|^b≤|g|^a; section domains)
  - PerfectoidSpaces:
    - P1.30, including the Laurent variant and `tiltEquiv`
    - P2.1, including *approximation-on-perfectoid-polydisc* with ϖ=(ϖ♭)♯, ϖ^p|p, c,ε∈ℤ[1/p] (line 6105)
    - P2.2, P2.3, P2.9–P2.12, P3.18 and P3.20
    - P7.1–P7.4, P7.11, P7.12, P7.13 (perfection along relative Frobenius) and P7.15 (Theorem 7.17, Corollaries 7.18–7.19)
  - AdicEtaleGeometry A1.6
  - SchemeAndStackFoundations §§0.7, 0.17, 0.18, 0.23a, 0.29, 2.1, 2.2, 2.15, 3.4, 4.13 (Bertini), 5.1–5.6
  - EtaleCohomologyFoundations §§F.2.1–F.2.3
- At open heads:
  - ShimuraCompactifications C0.6, C0.7, C0.9, C0.10, C0.16, C0.17 (properness criterion over every base) and C0.18 (63e3f03)
  - ClassicalAdicEtaleCohomology §§1.1, 6.2, 8.2 (dfcb6b7)
  - WeilConjectures WC.6 (the FS25 fan, its integral model and fixed-fan Chow presentation; d90e186)

**Declared gaps.**
- All eight README gap sentences match `design/plan.json` `gaps` verbatim, with named earlier suppliers, so none is unowned.
- These four are precise and not otherwise provided, and they are acceptable as contracts: toric-field-fibres, perfected-cone-algebras, homogeneous-cone-approximation and geometric-morphism-cup-pullback.
  - perfected-cone-algebras: P1.30 has only the polydisc and Laurent algebras.
  - homogeneous-cone-approximation: P2.1 has only the polydisc. Rational c follows from c′∈ℤ[1/p] with c′≥c.
  - geometric-morphism-cup-pullback: §1.1 has pullback only for morphisms of sites and no cup product.
- operational-chow-finite-orbits and split-torus-divisors are also acceptable.
- Notes on these, not findings:
  - The k[M] UFD clause can be composed from Mathlib's `MvPolynomial` UFD and `UniqueFactorizationMonoid.iff_localizationAway_of_prime` (`Mathlib/RingTheory/Ideal/UFD.lean:110`).
  - Regular-fan smoothness follows from ShimuraCompactifications C0.10. Citing both would shrink those gaps.
- valuation-smooth-proper is R01, and intersection-positivity-cuts is R02.

**Ownership by object.** I grepped main and all 332 open heads, by object rather than name, for: toric varieties, Minkowski weights, fan displacement, operational or bivariant Chow, Kronecker duality, excess intersection, perfectoid toric charts, Theorem 8.5, Proposition 8.7, Corollary 8.8, `finiteFanScheme`, and Fujino–Sato. The board packages were checked too. No earlier roadmap plans any of the 29 targets.
- PerfectoidTowers uses only the perfectoid ℙ¹ tower as an auxiliary example.
- HodgeTateAndCanonicalSubgroups §6.26 (all-root Kummer towers on sharp fs monoids) and PerfectoidShimuraVarieties §6.0 come later in the order and handle different objects.
- TropicalAndBerkovichArithmetic (later) declares its own general-field toric-scheme gap; that is its own matter.
- No `Suggested.lean` name collides, since the file declares none.
- The README's house style is clean: no LaTeX, process words, PR numbers or local paths; every layer ends with Examples and Dependencies; every definition (§§0.1, 0.2, 0.3, 0.5, 1.1, 1.3, 2.1–2.4, 3.4, 6.1) has an API list and at least 3 Checks; every theorem has at least 3 Checks.

**Adversarial pass, one row per statement. Values computed independently.** Notation: r=|ϖ|∈(0,1).

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Conv: divisor and frame signs | ℙ¹, D=2D₋; ℙ², D=D₃ (ray −e₁−e₂) | ℙ¹: W={0,1,2}; frames 1, t²; ratio t⁻²; local-equation weights 0, −2. ℙ²: W={(0,0),(1,0),(0,1)}, 3 sections = h⁰(O(1)) | consistent | none |
| Conv: coefficient rings | A=ℤ/4, D=D₋ on ℙ¹; A=0; k[ε]/ε² | S has 16 elements; ℤ/2⊗S≅(ℤ/2)²=S_{ℤ/2}; zero ring gives 0; ε survives | consistent | none |
| Conv: ℤ[1/p], thresholds, sharp | p=2,3; c=1/2; p=2 mixed char. | 1/3∉ℤ[1/2]; \|t²\|≤r ⇔ \|t\|⁴≤r; (1+1)♯=0 but 1♯+1♯=2 | consistent | none |
| Conv: torsion range | p=3, ℓ=2, m=2; p=2, ℓ=5 | ×3≡−1 mod 4 (unit); ×4 mod 5 (unit) | consistent | none |
| 0.1 ray divisors | ℙ², u=(1,0) | div χ^u has coefficients (1,0,−1); zero-cone fan has group 0 | holds | none |
| 0.2 weight sets | ℙ¹ D=−D₋; D+div χ^m, m=1 | W=∅; W(D₊)={−1,0}=W(D₋)−1 | holds | none |
| 0.3 sections, base change | ℙ¹ d=0,1,2,−1 over ℤ/4 | ranks 1,2,3,0; global section = ∩ of chart supports | holds | none |
| 0.4 invariant representative | ℙ¹, t−a; A¹, x² | div=[a]−D₋; order 2 kept | holds | none |
| 0.5 integral line bundles | ℙ², D=D₃ | m_{12}=(0,0), m_{13}=(0,1), m_{23}=(1,0); transitions m₁₃−m₁₂=(0,1), m₂₃−m₁₃=(1,−1), m₂₃−m₁₂=(1,0); cocycle (0,1)+(1,−1)=(1,0) | holds | none |
| 0.6 class presentation | ℙ²; A²; rays (1,0),(1,2) | ℤ²→ℤ³, u↦(u₁,u₂,−u₁−u₂), coker ℤ; A²: iso, Cl=0; det 2 gives ℤ/2 | holds | none |
| 1.1 unit model | cone(e₁,e₂); zero cone in ℤ² | polydisc \|x\|,\|y\|≤1; \|x\|=\|y\|=1; Gauss norm of (1+ϖt)(1−ϖt) is 1=1·1 | holds | none |
| 1.2 comparison | A², x=ϖ⁻¹; ℙ²; FS25 fan | \|x\|=1/r>1 so x is outside the unit model; ℙ² equal; FS25 dets ±1, complete, three relations | holds | none |
| 1.3 power maps | q=2,3 on ℙ²; 𝔽₄, p=2 | φ₂φ₃=φ₆; φ₂*D=2D; a²=a+1 checked in 𝔽₄ | holds | none |
| 2.1 perfectoid charts | ray, p=3 | pr₁*t=t^{1/3}; (φ∘pr₂)*t=t^{3/9}=t^{1/3} | holds | none |
| 2.2 perfected sections | ℙ¹ D=D₋, p=2; complete D=0 | weights ℤ[1/2]∩[0,1]; module is K; δ₀*δ₁=δ₁, pointwise product 0 | holds | none |
| 2.3 divisor cone | ℙ², D=D₃; complete D=0 | degree 0 gives (0,0) only; degree 1 is the triangle W(D₃); Q₀={0}×ℤ[1/p] | holds | none |
| 2.4 graded algebra | ℙ², D=D₃ | (u,j)↦(j−u₁−u₂,u₁,u₂) is a bijection onto ℤ[1/p]³≥0, giving exactly the P2.1 polydisc | holds | none |
| 3.1 tilt | ray; rank 0, char. p | K♭⟨t^{1/p^∞}⟩; identity | holds | R05 notation |
| 3.2 tilde-limit | ray, levels 0,1,2 | 1, 1/p, 1/p²; p·(1/p²)=1/p; completed colimit K⟨t^{1/p^∞}⟩ | holds | R04 locator |
| 3.3 homeomorphism | x=0,1,∞; classical x | constant towers; ((x^{1/p^{n+1}})♯)^p=(x^{1/p^n})♯ | holds | none |
| 3.4 projection | [1:1:0], p=2; λ-rescaling | sum 0 in K♭, sum 2 in K; (λx)♯=λ♯x♯ | holds | none |
| 3.5 étale topoi | algebraically closed point; t^{1/p}, char. p | finite étale objects K^r↔(K♭)^r, r=0 empty; inseparable, so no new covers | holds | none |
| 3.6 open restriction | U={\|t−ϖ\|≤r²} | t=ϖ: 0≤r²; \|ϖ^p−ϖ\|=r>r² | holds | none |
| 3.7 affine line | t=ϖ⁻¹; φ⁻¹(∞) | \|t\|=1/r>1 is kept; {∞} | holds | none |
| 4.1 φ_p* automorphism | ℙ², p=2, Λ=ℤ/5; mixed char., ℓ=p | H² ×2: 1→2→4→3; H⁴ ×4 (unit); ×p≡0 mod p | holds | R01 supplier |
| 4.2 π* isomorphism | ℙ¹, Λ=ℤ/3, p=2 | transitions 1↦2↦1, colimit Λ | holds | R01 supplier |
| 5.1 tubes | f=t, c=1/2; f=t²; ϖf | \|t\|²≤r; radius r^c kept with exponent 2c; threshold c−1; constructible compactness gives one c | holds | R07 Needs |
| 5.2 approximation | f=ϖ²χ^u, p=2, ε=1/2 | at c=0, g=0 passes (r²≤r^{1/2}); at c′>2 the bound r^{5/2}<r² excludes it | holds | none |
| 5.3 hypersurface | conic in ℙ², p=2, N=1; rank 0 | class 2 becomes 4≠0 in Pic=ℤ; rank 0 is vacuous | holds | R08 page |
| 6.1 Minkowski weights | ℙ² rays; O(D₃) at wall e₁ | c₁=c₂=c₃ so MW¹=ℤ; m₁₃−m₁₂=(0,1)=1·b, giving c=1 | holds | R06 sign note |
| 6.2 displacement | ℙ², v=(1,2) | only (e₂,v₃) contributes, index \|det\|=1, so O(1)²=1; ℙ¹×ℙ¹ (2,0)·(1,1)=2 | holds | none |
| 6.3 positive degree | ℙ², conic and H; repeated line | δ=2; powered 2p^N; excess class has degree 1 | holds | R02 gap |
| 6.4 complete intersection | point in ℙ² (c=2); c=0; x^p−t | dim 0; dim n; length p against 1 | holds | R02 gap |
| Gap toric-field-fibres | singular cone (1,0),(1,2) | normal but not regular; regular case is C0.10 | precise | note |
| Gap homogeneous-cone | rational c=1/3, p=2 | take c′=1/2≥c, since \|ϖ\|^{c′}≤\|ϖ\|^c | precise | none |

## Not verifiable

- The FS94 sign question in R06. Whether (2.3) is a sign slip depends on the convention for u(ρ) in FS94's notational reference (Fulton's *Introduction to Toric Varieties*), which is not in the manifest and which I did not open. I have therefore not recorded it as a source issue. R06 only asks the README to state the translation it already relies on.
- FS94's Proposition 1.4 over arbitrary fields. It rests on Fulton–MacPherson–Sottile–Sturmfels, which I did not open. The README attributes the split-orbit form over arbitrary fields to the supplier gap, not to FS94, so nothing depends on it.

## Source issues

- **Misprint** in SCH12 at Definition/Proposition 8.4, p. 304: the source says a ray chart is the affine line times a torus whose exponent uses the base-field letter minus one; it should be the rank of N minus one; affects nothing.
- **Misprint** in SCH12 at proof of Proposition 8.7, p. 306: the source says two local trivializations of O(D) on the integral model differ by a unit of K°; it should be a unit of the model's structure sheaf on the overlap, a character of absolute value one; affects nothing.
- **Misprint** in SCH12 at proof of Proposition 8.7, p. 306: the source says the perturbed g has weights u with ⟨u,v_i⟩ ≥ −j·a_i, with j unbound; it should be ⟨u,v_i⟩ ≥ −a_i, since g has degree one; affects nothing.
- **Misprint** in SCH12 at proof of Proposition 8.7, p. 306: the source says a large p-power of g is a regular function on the toric variety over K♭; it should be a section of O(p^N D), because regular functions on a proper variety are constant; affects the proof.
- **Gap** in SCH12 at proof of Corollary 8.8, p. 307: the source says the intersection over K♭ has positive combinatorial degree as a complete intersection; it should note that the approximants may meet in excess dimension, so nonemptiness needs the refined intersection class supported on their intersection; affects the proof.
- **Misprint** in FS94 at Theorem 3.2, p. 11: the source says the generic displacement avoids finitely many proper subspaces of N_γ⊗ℝ; it should be subspaces of N⊗ℝ (images in (N/N_γ)⊗ℝ), since displacements inside the span of γ never separate cones; affects nothing.
- **Misprint** in FS94 at proof of Lemma 3.4, p. 12: the source says it proves Lemma 3.3 in the case d = n−1; it should be Lemma 3.4, since 3.3 is an Example; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "29d6cf7", "job": "REV-PKG-AnalyticToricGeometryPartII", "model": "opus", "worker": "fable-rev48"} -->
