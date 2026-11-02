# Review of AdmissiblePairsAndPadicHodgeStructures (pull request #1511 at cd0db9d)

**Verdict:** needs changes

One P2 (a declared gap that is compound and half of which is already supplied by a cited earlier roadmap) and two P3 notes. The gate passes, the dependency check is clean, `Suggested.lean` elaborates, and the mathematics held on a 38-row adversarial table; the worker's sampled locators all resolve.

## R01 (P2) — gap:adjoint-kernel-and-orbit-differential is compound, and its orbit half is already supplied

Location: `TauCetiRoadmap/AdmissiblePairsAndPadicHodgeStructures/README.md` line 80 ("Prove ker(Ad) = Z(G) for connected characteristic-zero linear groups and the image and kernel formulas for differentials of their flag-orbit maps"), used at lines 383, 1954, 2002 and 2030.

Claim: the `needs` sentence asks ReductiveGroups Layer 2 for two unrelated facts, and the second one is consumed by this roadmap only as "the orbit map is submersive" (line 1954: "Pull it back along the G(C)-orbit map, which is submersive by gap:adjoint-kernel-and-orbit-differential"; line 2002 and line 2030 likewise).

Witness: the same `*Needs:*` lines (README lines 1958 and 2006) already cite AdicSpacesPartV RZ.6 / smooth-morphism-submersion, whose statement in the AdicSpacesPartV design (`packages/AdicSpacesPartV/design/plan.json`, target `RZ.6/smooth-morphism-submersion`) reads: for G a smooth linear algebraic group over a subfield E ⊆ F, H ⊆ G closed and y ∈ (G/H)(F), the orbit map G(F) → (G/H)(F) is a submersion at every point. That is exactly the "image" half of the gap, and no target uses a kernel formula. Only ker(Ad) = Z(G) (line 383, the basicness test on Ad(b)) is genuinely unsupplied: ReductiveGroups Layer 2 on main (`TauCetiRoadmap/ReductiveGroups/README.md` lines 227–233) lists Lie(G), differentials and Ad without that statement. The brief's gap rules make a compound `needs`, and a gap that asks for what an earlier roadmap already provides, P2.

Repair: narrow the contract to one sentence, "Prove that the kernel of the adjoint representation of a connected linear algebraic group over a field of characteristic zero is its centre", keeping the slug, and mirror the narrowed `needs` in the plan's `gaps` entry (the gaps list is the part of plan.json the package stage may edit; if the intake will not accept a narrowed `needs`, say so in the repair report). In §11.4, §11.7 and the Layer 11 Examples attribute submersivity of the orbit map to AdicSpacesPartV RZ.6 / smooth-morphism-submersion alone and delete the gap reference there. Tested on the instance that refuted the original: §11.4's route then uses RZ.6 for the pullback along the orbit map and nothing else changes.

## R02 (P3) — supplier labels that do not exist at the cited heads

Location: README lines 9, 94–96, 112–120, 124–126, 194–196, 212–216 and every `*Needs:*` line that repeats them.

Claim: six suppliers are cited by labels or anchors that their current heads do not carry. All the cited mathematics exists, so this is naming drift, not a missing supplier.

Witness (each checked with `roadmaps show` at the open head, or on main):

- BunGAndNewtonStrata (#1241): cited as `BG0 / g-isocrystals-and-B-of-G`, `BG0 / g-torsors-three-descriptions`, `BG1 / newton-and-kottwitz-maps`, `BG1 / admissible-finiteness-and-basic`, `BG1 / torus-norm-description`, `BG2:uniformization / beauville-laszlo-surjectivity`, `BG2:uniformization / bun-g-as-v-stack`, `BG3 / full-automorphism-v-group`, `BG3 / semistable-locus-and-basic-strata`, and in Scope "§§0.5, 2.3, 3.4 and 3.7". Its head has no BG labels and no anchors; it has `## Layer 0`–`## Layer 4` with `### k.n` headings (0.2, 0.6–0.9; 1.1–1.44; 2.1, 2.2, 2.7–2.23; 3.3, 3.6, 3.8, 3.10–3.12, 3.18), so §0.5, §2.3, §3.4 and §3.7 do not exist. Nearest owners: §0.6 The Kottwitz set B(G), §1.8 Newton and Kottwitz invariants, §1.13 Algebraic sigma-centralizer (the one label that already matches), §1.23 Acceptable classes B(G,{μ}) and §1.33 Finiteness and the basic acceptable member, §1.36 Torus norm and Newton average, §2.12 Beauville–Laszlo uniformization, §2.17 Isocrystal-family v-descent and strata, §3.3 Filtered torsor automorphism group schemes and §3.10 Reduction of full automorphism torsors, §3.12 and §3.18 for strata and components.
- VectorBundlesAndIsocrystals (#1205): cited as `VB0 / dieudonne-manin-isocrystals`, `VB2:classification / …`, `VB4 / slope-zero-local-systems` and similar. Its head has Layers 0–6 with titled, unnumbered subsections and no anchors: Dieudonné–Manin is Layer 1 "Coefficient category and rational blocks", the isocrystal-to-bundle functor Layer 2, classification and Hom/Ext Layer 4 "Classification and Hom/Ext calculations", slope-zero and relative local systems Layer 6 "Twisted and integral local systems".
- GeometricSatakeAndFusion (#1235): cited as `GS0:loop-geometry / grassmannian`, `GS0:loop-geometry / schubert-bounds-and-properness`, `GS0:Schubert-smoothness / open-cell-stabilizer-and-smoothness`, `… / truncated-positive-loops`, `… / truncation-of-the-loop-action`. Its head numbers Layer GS0 as §0.1–0.15: §0.6 Generic Schubert bounds, §0.12 Truncated positive loop groups, §0.13 Open Schubert cell smoothness, §0.14 Finite truncation of bounded actions, §0.15 Minuscule Bialynicki–Birula isomorphism.
- VStackSheavesAndLisseCategories (#1230): §VS4.0 exists, but the three names BunGeometry, BunNewtonGeometry and BunAutomorphisms (README lines 9 and 112) occur nowhere in it; its sub-paragraphs are "The stack of bundles", "Newton geometry" and the automorphism paragraph.
- IgusaVarietiesAndTorsionConcentration (#1090): "Layer IG.1" (lines 212–216, 2116, 2134, 2184 and the plan gap) is "Layer 1: Igusa towers, actions and cohomology"; the head carries no IG labels.
- AlgebraicModularFormsAndSerreWeights (#928): "R15.3 / target-igusa-interpretation-of-hasse-and-theta" resolves only through its line 18 alias (R15.3 = Layer 3) to "### 3.5 The Igusa interpretation"; the anchor does not exist.

Repair: cite each by the supplier's current heading (for example "BunGAndNewtonStrata §1.13", "VectorBundlesAndIsocrystals Layer 4, Classification and Hom/Ext calculations", "GeometricSatakeAndFusion §0.13", "IgusaVarietiesAndTorsionConcentration Layer 1", "AlgebraicModularFormsAndSerreWeights §3.5") and drop the three invented VS4.0 names.

## R03 (P3) — §12.1's one-faithful-representation test silently uses the arbitrary-field gap

Location: README line 2066 ("A pro-étale K-torsor … is de Rham if its associated representation local systems are de Rham, equivalently for one closed faithful representation").

Claim: the equivalence needs de Rham local systems on a smooth rigid S over an arbitrary p-adic L to be closed under subquotients, which is the full-rank criterion the README itself declares as gap:arbitrary-field-full-rank-de-rham (line 170) and assumes explicitly in §§6.4, 10.3, 11.4–11.7, 12.4 and 12.5 but not in §12.1.

Witness: for a sub-local system T′ ⊂ T with T de Rham, ν_*(T′⊗OB_dR) ⊂ ν_*(T⊗OB_dR) has rank ≤ rank T′, and passing from full rank (or from de Rham stalks at classical points) to a filtered flat bundle is LiuZhu Theorem 3.9(iii)–(iv) (LiuZhu line 1154), proved for k finite over Q_p (LiuZhu line 86).

Repair: either define de Rham torsors by all representations only, or add "under the arbitrary-field full-rank de Rham criterion" to the equivalence clause.

## Verified sound

**Gate and tooling.** The worker's gate at cd0db9d: every check passed (`gate.md`). Rerun of the dependency check on this head:

```
depcheck: 204 roadmaps, 1497 edges, 0 problem(s)
```

No UPWARD or CYCLE line; the roadmap is listed in the merge order at line 233, after AdicSpacesPartV (line 204) and after every other supplier it cites. `lake env lean TauCetiRoadmap/AdmissiblePairsAndPadicHodgeStructures/Suggested.lean` exits 0 with no output (the file declares nothing). The outside-folder diff is empty. No `lemma`, `set_option`, LaTeX delimiters, process words or pull-request numbers in the README (grep).

**Pins.** `lake-manifest.json` pins Mathlib 6b7abb3c and Tau Ceti a91d3aaf, as the README states (lines 52, 61). Declarations opened at the pin, file and line as cited: `WittVector.Isocrystal` (Isocrystal.lean:113), `IsocrystalHom` (:132), `IsocrystalEquiv` (:138), `StandardOneDimIsocrystal` (:157, Frobenius p^m σ at :172), `isocrystal_classification` (:180, `[IsAlgClosed k] [CharP k p]`, `finrank = 1`); `dense_iInter_of_isOpen` (Baire/Lemmas.lean:141, `[Countable ι]`), `nonempty_interior_of_iUnion_of_closed` (:256, `[Nonempty X]` at :252 as the README says), `BaireSpace.of_completelyPseudoMetrizable` (CompleteMetrizable.lean:25); `BDeRhamPlus` (Perfectoid/BDeRham.lean:75, adic completion at ker of the p-inverted θ, zero ring when p = 0); `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor` (GroupFunctor.lean:138, with `GrpCat.uliftFunctor`); `TauCeti.Subcomodule.exists_finite_subcomodule_mem` (Finite.lean:144, `[Module.Free R C]`) and `iUnion_finiteSubcomodules_eq_univ` (:292); `TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer` (Character.lean:101, `I.toIdeal.FG`). All match the README's descriptions.

**Headline theorems.** HKII Theorem 9.1.3, Theorem A, Theorem B and HKI Theorem B. None is statable at the pins: the pinned libraries have no Fargues–Fontaine bundles, no B_dR⁺-lattices with modifications, no diamonds and no period moduli (confirmed by grepping the pinned Tau Ceti; the only Frobenius carrier is the topological orbit space the docstring names). The empty file with a docstring naming the 23 unstatable headline groups is the correct form; no stand-in is stated, so there is no padding to probe. The one elementary GL_n fact that could be written on `BDeRhamPlus` (lattices between tL₀ and L₀ versus subspaces of L₀/tL₀) would be padding, not a headline.

**Seeded sample (every locator read at its line; printed pages from the `=== page N ===` markers).** 0.5: HKI line 1043 (Prop 3.1.7, p. 22), line 1083 (Ex 3.1.10, p. 23), line 1047 (part (2)), line 1065 (the descent step, p. 23). 1.1 and 1.2: HKII line 1173 (§4.1, p. 26), line 1191 (Remark 4.1.1), HKI line 636 (§2.2.3, p. 14). 2.3: HKI lines 1604, 1613 (Lemmas 4.3.1–4.3.2, p. 34), 1646 (Thm 4.3.5, p. 35), 1925 (Thm 5.1.6, p. 41). 2.4: HKI lines 1925, 1544 (Def 4.2.1, p. 33). 3.1: HKI lines 2030 (Def 5.4.1, p. 43), 2098 (Thm 5.4.4, p. 45), 2293 (Prop 5.7.1, p. 49). 3.2: HKI line 2137 (Thm 5.5.1, p. 46). 4.1: HKII lines 691, 711 (Def 2.2.1, Lemma 2.2.3, p. 15). 4.2: HKII lines 728, 794, 807, 820 (pp. 16–18). 7.6: HKII lines 1765, 1786 (Prop 6.4.1, Def 6.4.2, p. 39). 11.1: HKII lines 2458, 2470 (p. 55). 11.6: HKII lines 268, 272, 279 (p. 6), 222 (p. 5). 11.7: HKII line 501 (Thm B, p. 11), line 2632 (p. 58). 12.2: HKII lines 2860, 2869 (p. 63). 12.3: HKII line 2882 (p. 64). Also read: Thm 9.1.3 and its proof (HKII lines 2481–2600), Thm 5.0.4 (1419–1442), Prop 5.0.3, §§6.2–6.3, 7.1–7.5, 8.1–8.5, 9.3, 10.1–10.2, HKI §§3.2, 3.5, 4.4, 5.2, 5.7, 6.2–6.3; BhattHansen lines 310, 314, 346 (pp. 7–8); LiuZhu lines 86, 89 (pp. 2–3), 1154 (p. 24); Scholze line 1936 (Thm 7.6, p. 42). Every theorem number, page and hypothesis matches, with the source slips listed under Source issues (each already absorbed by the README).

**Cross-roadmap citations resolved.** On main: ReductiveGroups Layers 1–3, 5, 6A, 7 (6A at line 479); ReductiveGroupsPartII RG2.0.1–RG2.0.4 and RG2.1.1 with the slugs scheme-point-topology, points-topological-group, congruence-neighbourhood-basis, smooth-morphism-open-map, steinberg-quasi-split present as italic markers; AdicSpacesPartII R1.3 (line 8968, analytification-functor); PerfectoidSpaces P4.15.6 (line 11208) and P6.11 (line 14821); AlgebraicVectorBundles L0A–L0C, L2A–L2B (lines 215–340); Completed/AdicSpaces Layer 6 (line 691); Completed/HodgeStructures. At open heads: RelativeFarguesFontaine §§4.10–4.12, 6.6–6.9, 7.2, 7.4, 7.6; HodgeTateAndCanonicalSubgroups §2.14 (line 1008) and §5.1 (line 1371); PadicPeriodRings §2 with `tateSen_H0` (line 368), §4.1, §4.3; MotivesAndAlgebraicCycles §§6.1–6.3, 6.8; DiamondsAndVStacks: all fifteen cited slugs present as `(*slug*)` markers, D3.6, D3.9, D3.10, D5.10; HeckeStacksAndLocalShtukas HS2.12, HS2.15; AInfCohomology AI.2.2 (with "Operations in valid BKF subcategories" and the crystalline-rigidified variant) and AI.2.3; PadicHodgeTheory §§2.2, 2.3, 5.5, 7.1 (with the lattice-position uniqueness paragraph), 7.4; DiamondSixOperations S2.4, S3.2, S4.2, S4.3; EndoscopicTransferAndUnitaryTraceComparison §12.5, §12.11; PerfectoidShimuraVarieties §2.2, §3.1, §3.5; HilbertModularVarietiesAndShimuraCurves R18.5.7, R18.5.15, R18.5.20, R18.5.21. AdicSpacesPartV has no README on main or in a pull request: it is a board design (`packages/AdicSpacesPartV/design/plan.json`), already inserted in the merge order at line 204, and all sixteen cited RZ slugs exist there; the statements of gauss-point-in-closure (infinite residue field), subfield-identity-theorem, weakly-shilov-avoid-nowhere-dense, resolution-consequences, full-dimensional-closed-subset, smooth-morphism-submersion and constant-rank-theorem agree with the README's restatements at lines 176–182. Label drift is R02.

**Gaps.** Nine gaps; the plan's `gaps` list carries the same nine slugs with the same suppliers and sections. Checked against the suppliers: MotivesAndAlgebraicCycles §§6.1–6.3, 6.8 contain no canonical reduction of structure group; PadicHodgeTheory has no Serre openness and no Liu–Zhu rigidity or full-rank criterion (grep); ReductiveGroups has no observability statement and no ker(Ad) = Z(G); AInfCohomology AI.2.2–2.3 has lattice pairs and the crystalline rigidification but no modification-quadruple equivalence; PerfectoidShimuraVarieties has no basic uniformization; RelativeFarguesFontaine §§6.6–6.9, 7.6 descend lattices between ξ^k Ê and ξ^{−k} Ê over B⁺_D(S), not the localized B_D-modules; IgusaVarieties Layer 1 has the tower, not the crystalline-frame comparison. Eight are precise and minimal; the ninth is R01.

**Ownership.** `roadmaps grep` over the 438 open roadmap pull requests and main for admissible pairs, neutral G-admissible pairs, Howe–Klevdal and Ax–Lindemann finds no other roadmap building these objects (the hits in ColemanIntegration, K3BlochGroups and others are different "admissible" notions); the non-reductive Grassmannian, Hodge domains and infinite-level moduli are built only here, with the reductive cases imported as the Scope says.

**Shape.** Every definition has an API list and at least three Checks (counted: 41 definitional targets, minimum 3, maximum 5); every target has a locator; every layer ends with Examples and Dependencies; no Check names a Lean counterpart; the only backticked names are library declarations that exist at the pins.

**Adversarial table.** Values computed on each side.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions table, Q_p(n) | n = 1 against HKI Ex 4.2.5 (line 1583) and Ex 5.1.4 (line 1909) | Q_p-breve(k) = (D_{−k}, F^k B_dR⁺·D_{−k}), D_{−k} Frobenius p^{−k}σ; Q_p(k) ≅ (Q_p, F^{−k}B_dR⁺), weight −2k | matches all six rows | none |
| §0.1 trace filtration | L1 = R, L2 = t^aR | trFil^i = image(t^{i+a}R ∩ R) = k iff i + a ≤ 0 | jump at −a as stated | none |
| §0.1 elementary divisors | L2 = ⟨e1, e2 + t^{−1}e1⟩, L1 = R² | det valuation 0, minimal entry valuation −1 | type {−1, 1}; subline and quotient type {0} | none |
| §0.1 non-exactness | same lattice, i = 0 | L2 ∩ L1 = ⟨e1, te2⟩, image k e1; quotient's own trFil⁰ = k, image of ambient = 0 | exactness fails as stated | none |
| §0.1 strictness | t on (K, R, R) | f(R) = tR ≠ K ∩ R = R; cokernel R/tR | not strict as stated | none |
| §0.2 P_μ for G_m ⋉ G_a | μ of weight −1 on Lie G_a | HTCS 2.14: Lie P(μ) = weights ≥ 0 ⇒ P_μ = G_m, G/P = A¹; μ^{−1}: weight +1 ⇒ P = G, point | matches; HKI line 1057 convention (stabilizer of F_{μ^{−1}} = weights ≤ 0 of μ) agrees | none |
| §0.2 PGL_2 over Q_p[[t]] | quaternion algebra torsor | Br(Q_p((t))) ⊃ Br(Q_p), invariant 1/2 persists; 0 over Q_p-bar | as stated | none |
| §0.3 dominance orientation | G_a extension in GL_2 | Levi type (0,0) ≤ actual (1,−1), equal determinant 0 | agrees with HKI Thm 3.5.1 (line 1413) | none |
| §0.5 BB fibre | GL_2, μ = (2,0), ⟨t²e1, e2 + c t e1⟩ | trace flag k e2 ⊂ k² for every c; type (2,0); adjoint weight 2 | distinct lattices, same flag | none |
| §0.5 twisted-invariant hypothesis | C = alg. closure of Q(u), γ: u ↦ 2u, t ↦ 2t | ⟨e1, e2 + u t^{−1} e1⟩ is γ-invariant (2u·(2t)^{−1} = u t^{−1}), type (−1,1), flag Ce1 is K-rational; canonical lattice ⟨t^{−1}e1, te2⟩ is a second invariant point over the same flag; L ∩ K((t))² = ⟨e1, te2⟩ ≠ L | HKI Prop 3.1.7(2) needs the extra hypothesis; README has it | none (Source issue) |
| §0.5 p-adic case | K0 = Q_p, m ≠ 0 | PadicPeriodRings §2 `tateSen_H0`: C(m)^{G} = 0, C^{G} = Q_p | hypothesis supplied | none |
| §1.1 Borel non-basic | b = diag(p,1), E12 | Ad(b)E12 = p·E12, slope 1 ≠ 0 | not B-basic, basic in T | none |
| §1.3 σ-centralizer | GL_2, b = diag(p,1) | Aut of slope-1 ⊕ slope-0 isocrystal = T(Q_p) | Levi, not an inner form | none |
| §1.6 inner twist | b = [[1,1],[0,1]], x = diag(2,1) | bxb^{−1} = [[2,−1],[0,1]]; b^{−1}σ_b(x) = σ(x)b^{−1} = [[2,−2],[0,1]]; b^{−1}xb = [[2,1],[0,1]] | all three displayed values correct | none |
| §1.6 G_m twist | b = p^n | E_1 ↦ E_{b^{−1}}, isocrystal slope −n | subtracts n | none |
| §2.1 weight/slope | HKI Def 4.2.1 (line 1544) | weight λ ⇔ slope −λ/2 | matches "slope −w/2" | none |
| §2.2 admissibility | O(1) ⊕ O(−1) | degree 0, not semistable | excluded as stated | none |
| §2.6 G_m, Q_p(1) | standard character | L_et = Fil¹ ⇒ μ = 1; b = p^{−1}, κ(b) = −1 = μ^{−1}; weight −2 = 2·(−1) | as stated | none |
| §2.6 PGL_2 twisted unit | b = [[0,p],[1,0]] | b² = p·1 (Newton point 0), v_p(det b) = 1 odd ⇒ κ = 1 ∈ Z/2; B(PGL_2,[0]) = {[1]} | conclusion fails without the standard-fibre condition, as stated | none |
| §3.4 CM direction | T torus, reflex field E ≠ Q_p (CM elliptic curve, p inert) | Hodge line is E-rational, not Q_p-rational | README's Q_p-bar is right; HKI's "Q_p-analytic" is a slip | none (Source issue) |
| §3.4 centrality step | HKI Lemma 2.1.5 (line 586) | automorphisms of a fully faithful Rep G → C lie in Z(G)(k) | step valid | none |
| §4.1 equal characteristic | T ↦ T² over F₂((u)) | relative Frobenius, iso on diamonds; f(T)² = T forces 2·ord = 1 | no rigid inverse | none |
| §4.2 O(1) on Spa L | finite L′/L | H⁰(G_{L′}, C(1)) = 0 (Tate–Sen) | not étale-trivializable | none |
| §4.2 PGL_2, Λ = Q_p | P quaternion torsor | P(Q_p) = ∅ so the frame sheaf has no sections; P(C) ≠ ∅ | not a G(Q_p)-local system; trivial over O | none |
| §4.4 disc family | L2 = ⟨e1, e2 + (z/ξ)e1⟩ | z ≠ 0: lift of z is a unit, valuation −1 ⇒ {1,−1}; z = 0: {0,0} | type jump as stated | none |
| §5.1 Gr_{G_a} | ξ^{−1} | B_dR/B_dR⁺ ∋ ξ^{−1} ≠ 0; only cocharacter trivial | outside every good cell (HKII line 1458) | none |
| §5.3 Schubert closure | GL_2, (2,0) vs (1,1) | (2,0) ≥ (1,1), same determinant | boundary type as stated | none |
| §7.3 Borel, inverse invariant (1,0) | B(B,[(1,0)]) = {diag(p,1)} | Ad(b) on E12 slope 1 | no B-basic class, empty central-weight domain | none |
| §7.4/§7.7 HT loci | V = Q_p(−n), lattice Fil^a | L_dR = Fil^n; Fil^n ⊂ Fil^a ⇔ n ≥ a; n = −1: Fil^{−1} ⊄ Fil⁰ | as stated | none |
| §8.6 Borel, b = diag(p,1) | L_{[a:c]} = R² + Rξ^{−1}(ae1 + ce2) | E(W) = O(−1) ⊕ O; a = 0 ⇒ O(−1) ⊕ O(1); a ≠ 0 ⇒ 0 → O → E′ → O → 0, Ext¹ = 0 ⇒ trivial; sub e1 admissible ⇔ c = 0 | G-adm ⇔ a ≠ 0, H-adm ⇔ c = 0; [1:1] separates | none |
| §8.6 Borel, b = diag(1,p) | μ_H = diag(1,z^{−1}), ⟨e1, ξ^{−1}(e2 + xe1)⟩ | E(W) = O ⊕ O(−1); c ≠ 0 ⇔ admissible ⇒ P¹ ∖ [1:0]; H-cell = lines [x:1] | A¹ ≅ P¹ ∖ [e1], all x admissible | none |
| §8.6 GL_3 parabolic | ⟨e1, e2 + (z/ξ)e1, e3 + (1/ξ)e1⟩ | HKII line 2234: type (1,0,−1); Levi type (1,−1;0) for z ≠ 0, trivial at 0 | as stated | none |
| §8.5 Lubin–Tate | F quadratic in D | dim D×/F× = 4 − 2 = 2 = dim_{Q_p} P¹(F) | as stated | none |
| §9.4/§9.5 mirabolic | H = E× ⋉ E, μ_H = (1,1,−2) | weights on E: 1, 1, −2; on Lie E×: 0; coinvariant sum 0 = κ(1); ambient weights ±1, ±2 | Hodge-special, not HT-special; ambient not minuscule | none |
| §9.5 Borel inheritance | GL_2, μ = diag(t,1) | Lie GL_2: −1,0,0,1; Lie B: 0,0,1 | asymmetric, inside [−1,1] | none |
| §11.8 Serre–Tate data | b = diag(1,p), μ = diag(1,z^{−1}) | Ad(μ)E12 = +1 ⇒ Fl_{[μ^{−1}]} = B/T = A¹, Fl_{[μ]} = point; Ad(b)E12 slope −1, not basic; x = 1 lattice lacks ξ^{−1}e2; flags [0:1], [1:1] | HT image a point as HKII Remark 9.1.4 asserts; HKII's own data (μ = diag(z^{−1},1), b = diag(p,1)) give the opposite flags | none (Source issue) |
| §9.2/§11.1 G_m tower | b = 1, μ = 0, K_n = (1 + p^nZ_p) × I | M_C = Q_p×; ∩_n(1 + p^nZ_p) = {1}; Q_p×/Z_p× = Z | closures {1}, {1,p}, 1 + p^mZ_p as stated | none |
| §10.3 Gauss point | residue field of size q | {|x^q − x| ≤ |π|} contains O_L; at η, |x^q − x| = 1; {|π| ≤ |x^q − x|²} ∩ {|x^q − x| ≤ |π|} forces |π| ≥ 1 | infinite residue needed, as stated | none |
| §12.3 Katz–Igusa degrees | p = 2, m = 1,2,3 | (Z/2^m)× = 1, 2, 4; −1 ≡ 1 (2), 3 (4) | as stated | none |
| §12.5 invariants | Ram(D) = {p, ℓ} | Ram(B) = {∞, ℓ}; {∞, ℓ, q, r} fails at q, r | as stated | none |
| §12.1 p = 7 | μ₃ ⊂ Q_7 | 7 ≡ 1 mod 3 | as stated | none |

Hypotheses in scope were checked for each theorem that needs one: basicness in §§7.3, 9.2, 9.5, 9.6, 11.1–11.6; nonemptiness in §§6.7, 6.8; strictness of the field in §§3.2–3.4, 11.7; geometric connectedness in §§6.4, 11.7; the de Rham gap in §§6.4, 10.3, 11.4–11.7, 12.4, 12.5 (R03 for §12.1).

## Not verifiable

- Serre, [33] in HKI (Cor 5.5.3 applies it to a strict p-adic field): not in the cache; the README routes this through gap:strict-field-serre-openness, so nothing depends on my reading it.
- Milne, Algebraic Groups, Thm 13.4 (ker Ad = Z(G), cited at HKII line 1187) and Scholze–Weinstein Berkeley Prop 10.2.3 (seminormal full faithfulness, HKII line 689): not read; both are routed through gaps or suppliers.
- Daniels–van Hoften–Kim–Zhang (HKII footnote 7) and Chambert-Loir–Loeser (HKII §10.2): named as context only; not read.
- AdicSpacesPartV: no README exists on main or at any open head; its targets were checked in the board design plan only.

## Source issues

- **Gap** in HKI at Proposition 3.1.7(2), printed pp. 22–23: the proof asserts that a G-invariant lattice comes from a K[[t]]-lattice using only the infinite-order character hypothesis; it should add vanishing of the twisted invariants C(χ^m)^G for m ≠ 0 (false otherwise: C the algebraic closure of Q(u), γ: u ↦ 2u, t ↦ 2t, lattice ⟨e1, e2 + u t^{−1} e1⟩); affects the proof.
- **Error** in HKI at Theorem B, printed p. 5, and Corollary C, printed p. 8: the source says the de Rham lattice of a CM object is Q_p-analytic and its period lies in Gr_{[μ^{−1}]}(Q_p), with "Q_p-analytic" defined on p. 5 as a filtration over Q_p; it should be over a finite extension of Q_p (the reflex field, as the proof of Proposition 5.7.1 produces), since a CM point with nontrivial reflex field has no Q_p-rational Hodge line; affects a stated result.
- **Misprint** in HKI at §5.4, printed p. 43: the source says every strict p-adic subfield of C is contained in C0; it should say contained in the algebraic closure of C0 in C (as §6.2 does), since a ramified finite extension of C0 is strict p-adic; affects nothing.
- **Gap** in HKII at proof of Theorem 7.2.3, printed p. 42: the source invokes Liu–Zhu Theorem 3.9(iv) to check the de Rham property at one classical point, a theorem proved for a finite extension of Q_p, while L contains Q_p-breve; it should supply the rigidity or full-rank criterion over fields with perfect residue field; affects the proof.
- **Misprint** in HKII at Remark 9.1.4, printed p. 56: the source says the Serre–Tate chart for the upper triangular Borel has μ = diag(z^{−1}, 1) and b = diag(p, 1)σ; with the paper's conventions these give Hodge–Tate flag A¹ and a point as Hodge cell, so it should be μ = diag(1, z^{−1}) and b = diag(1, p)σ; affects nothing.
- **Misprint** in HKII at proof of Theorem 9.1.3, equation (9.2.0.1), printed p. 57: the source refines the Hodge–Tate level to K′_b = H(Q_p) × I ∩ K_b; on this side the level groups lie in G_b(Q_p), so it should be (g H_{b_H}(Q_p) g^{−1} × I) ∩ K_b; affects the proof.
