<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/952#issuecomment-6377445708 -->
Review (claude) of efff8a4

Verdict: accepted
Conditional on the announced gaps: `smooth-whitney-extension`, `flat-ideal-regular-situation`

1. **F01** (P3) §2.0a's new pairing clause names neither its vertex pairing nor the route to Adams multiplicativity on total fibers

   **Location.** `packages/MotivicEtaleKTheory/design/README.md:207` (same text at `design/plan.json:250`, supportedCubeKApi2): "construct the pairing of total-fiber spectra inducing the bilinear pairing … Adams operations commute with restrictions and pullbacks and satisfy ψᵃ(x·y)=ψᵃx·ψᵃy for these pairings". The route paragraph at `:202` covers only full-cube relativity. The *Needs:* line at `:219` and the supplier contract at `:49` cite SchemeKTheoryOperations §§2.5, 3.1–3.3, 4.3, 6.7–6.9 but not §6.1.

   **Claim.** The pairing exists on iterated fibers for arbitrary opens and supports, and ψᵃ is integrally multiplicative on it.

   **Witness.** Levine94 line 699–705 (p.258): standard properties of relative Adams operations are known only in the Hiller–Kratzer, Soulé and K₀ cases. `TauCetiRoadmap/SchemeKTheoryOperations/README.md:2076` covers products on scheme vertices only. §6.1 (`:1631`, `:1650`) owns the pairings.

   **Exact repair.**
   1. Add "SchemeKTheoryOperations §6.1" in four places:
      - the *Needs:* line at `:219`;
      - the 2.0a prerequisites at `design/plan.json:236`;
      - the SchemeKTheoryOperations contract at `:49`;
      - the plan's SchemeKTheoryOperations supplier entry at `design/plan.json:1516`.
   2. Append to the route paragraph at `:202`: "The pairing is induced by SchemeKTheoryOperations §6.1's supported external pairing on every vertex of the two face diagrams. Its Adams multiplicativity on total fibers does not follow formally from the vertices. Every vertex, face and support complement is smooth over the regular base X, so SchemeKTheoryOperations §6.9's several-variable identification of operations on ℤ×Gr in the pointed A¹-homotopy category over X gives ψᵃ∘μ=μ∘(ψᵃ×ψᵃ) on the K-theory object, hence on all iterated cofibers. External pairings first pull back to X×_ℤX′."

   **Tested.** Take X=Spec ℤ_(3), Y=Y′=X×□ and full supports, with u=2, v=−1.
   - Both sides give ψ²{2,−1}=4{2,−1} and ψ²[2]·ψ²[−1]=(2[2])(2[−1]), which agree.
   - The repaired route also covers the localized open (X×□)∖{t=2} of Check `:215`, where relativity does not apply.
   - Neither two-variable operation (x,y)↦ψ²(xy) nor (x,y)↦ψ²x·ψ²y is zero. On K₀, both send line bundles (L,M) to [L²M²], so the identification gives one map.

2. **F02** (P3) The ColemanIntegration ownership sentence gives the new cube pairing two owners

   **Location.** `packages/MotivicEtaleKTheory/design/README.md:13`: "The shared supported multi-relative cube construction of §2.0a supplies ColemanIntegration §L3.Fa.2; its L3.Fa.1 Quillen package, special-unit localizations and de Jeu symbols remain there." `:677` (and `design/plan.json:1622`) lists the cube K-theory, relativity and weight pieces, but not the pairing.

   **Claim.** The scope paragraph allocates every overlapping object.

   **Witness.** `TauCetiRoadmap/ColemanIntegration/README.md:2391` assigns "relative and multi-relative groups, products" to L3.Fa.1. Line `:2395` requires weight-additive cup products for multi-relative pairs, and line `:2458` (L3.Fa.3) takes cup products along coordinate projections. Line `:207` here now constructs that pairing.

   **Exact repair.**
   - At `:13`, replace "; its L3.Fa.1 Quillen package" with ", including the common-base pairing of total fibers and its Adams multiplicativity, which supply the multi-relative cup products of L3.Fa.1 and those of L3.Fa.3 along coordinate projections; its L3.Fa.1 Quillen exact-category model".
   - At `:677` and `design/plan.json:1622`, after "ordered relativity equivalence with its weightwise form," insert "the common-base pairing with Adams multiplicativity,".

   This roadmap is the owner because it comes earlier: the check places it after merge-order line 87, and ColemanIntegration is at line 155.

   **Tested.** Over O=ℤ_(3), take weight-one relative classes [u],[v]∈K₀(X_O;□¹) with u,v units. Their common-base product lies in K₀(X²_O;□²) with ψ²-eigenvalue 2·2=4=2², which is weight 2. Generalized weights add as well: if (ψ−aⁱ)ᴺx=0 and (ψ−aʲ)ᴹy=0, then (ψ−aⁱ⁺ʲ)ᴺ⁺ᴹ⁻¹(xy)=0 by multiplicativity.

3. **F03** (P3) Layer 2 *Needs:* lines: §2.4 omits §2.0b, and §2.1 cites one supplier twice

   **Location.** `packages/MotivicEtaleKTheory/design/README.md:297`: "chₚ,ₙ=(−1)ᵖ⁻¹ cₚ,ₙ/(p−1)! for p≥1 with the universal higher Chern-class convention". Line `:299`: "Compare universal Chern classes". The *Needs:* line at `:308` begins "§2.2; §2.3; §2.0a; §1.4; GeneralAlgebraicKTheory §7.4" and has no §2.0b; the prerequisites at `design/plan.json:530` agree. Line `:256` cites "SchemeKTheoryOperations §§2.1–2.6, 6.8–6.9, 7.1–7.3" and later "SchemeKTheoryOperations §§4.3, 6.7".

   **Claim.** Each *Needs:* line lists what its statement and route use, item by item.

   **Witness.** cₚ,ₙ is §2.0b's operation (`:223`), and §2.4's statement and route use it directly. §2.0b reaches §2.4 only through §2.2, whose identification rests on the uncertified Bloch86 §7.

   **Exact repair.**
   - Add "§2.0b;" to `:308`, and "target:2.0b" to the prerequisites at `design/plan.json:530`.
   - At `:256` and `design/plan.json:368`, merge the two SchemeKTheoryOperations entries into "SchemeKTheoryOperations §§2.1–2.6, 4.3, 6.7–6.9, 7.1–7.3".

   **Tested.** At p=2 the factor is −1. On the symbol {2,t}, §2.0b's diagonal API gives c₂,₂{2,t}=(−1)¹·1!·{2,t}=−{2,t}, so ch₂,₂{2,t}={2,t}. That value is computed from §2.0b, so the edge is used. The edge creates no cycle, because §2.0b needs only §1.4 and suppliers.

4. **F04** (P3) §5.1's new product Check presupposes §5.2

   **Location.** `packages/MotivicEtaleKTheory/design/README.md:472` (`design/plan.json:990`, supported_transverse_product): "the supported divisor classes for V(x) and V(y) multiply to the origin class with coefficient +1 in support V(x,y); forgetting support agrees with §4.2’s product."

   **Claim.** A Check in §5.1 computes §5.1's product API.

   **Witness.** Divisor classes and the identification H⁴_D,{0}(𝔸²,ℝ(2))=ℝ·[0] come from §5.2's semipurity theorem (`:478`), whose *Needs:* line includes §5.1 (`:495`). Forgetting support gives H²_D(𝔸²,ℝ(1))=H⁴_D(𝔸²,ℝ(2))=0, so that clause reads 0=0.

   **Exact repair.**
   - Replace the Check at `:472` and `design/plan.json:990` with: "Classes supported on the disjoint divisors V(x) and V(x−1) of 𝔸²_ℂ multiply into support ∅, whose fiber is that of the identity, so their product is 0."
   - Add to §5.2's Checks, after `:493`: "Under §5.1's product, the supported classes of V(x) and V(y) in 𝔸²_ℂ multiply to the origin class with coefficient +1 in H⁴_D,{0}(𝔸²,ℝ(2))=ℝ; replacing V(x) by 2V(x) gives 2."

   **Tested.** V(x)∩V(y) is the origin with intersection length dim k[x,y]/(x,y)=1, so the coefficient is +1; with 2V(x) it is 2. For V(x),V(x−1), the support intersection is empty and D_log,∅=fib(id)=0, so the product is 0.

5. **F05** (P3) The repaired §2.0a text uses "full cubes" before defining it and reuses t in the new Check

   **Location.** `packages/MotivicEtaleKTheory/design/README.md:200`: "on full cubes the relativity equivalence below identifies them with the supplied simultaneous supported eigenspaces". Line `:677`: "simultaneous eigenspaces on full cubes". Line `:217` (`design/plan.json:287`): "singular at (1+i,t−i): in ℤ[i,t]/(t²+1)".

   **Claim.** The domain of the eigenspace conclusion is unambiguous.

   **Witness.** "Full cube" is fixed only at `:208` (Y=X×□ⁿ, S=T×□ⁿ). Section 2.1 (`:243`) projects on Y=X×□ⁿ with cycle supports, where only generalized pieces hold. At `:217`, t names the second ℤ[i] factor, not the cube coordinate.

   **Exact repair.**
   - At `:200`, `:677` and `design/plan.json:1622`, write "on full cubes Y=X×□ⁿ with product support S=T×□ⁿ".
   - At `:217` and `design/plan.json:287`, rename t to s: "singular at (1+i,s−i): in ℤ[i,s]/(s²+1), putting v=s−i gives v(v+2i)=0".

   **Tested.** For X=Spec ℚ, n=1 and the non-product support S={t=2}, the repaired wording makes no eigenspace claim, matching the actual scope. After the renaming, (1+i)²=2i still gives v²+(1+i)²v∈m², so the cotangent dimension is 2 and the local ring has dimension 1, as stated.

Conditional on the declared supplier gaps `smooth-whitney-extension` and `flat-ideal-regular-situation` (DifferentialGeometry, Part II: Whitney jets and flat functions).

All eight round-3 findings (two from the codex review, six from the claude review) are repaired. That includes the blocking claude F01: products over Spec ℤ left the regular Noetherian domain. The repairs introduced no false statement. Five non-blocking findings remain, all P3. Two concern the new §2.0a pairing clause: it names no input for the pairing or for the multiplicativity of the Adams operations on it, and its ownership against ColemanIntegration is not recorded. The other three are a missing *Needs:* edge, a Check that relies on a later target, and two wording points in the repaired §2.0a. Paths are repository-relative. `packages/…` is this board package. Main is `72d2b66`. Open roadmaps were read at their indexed heads: ColemanIntegration `ae078af`, SchemeKTheoryOperations `88dbd5a`, KTheoryFiniteLocalFields `afe02e8`, GeneralAlgebraicKTheory `e0552fe`, MotivesAndAlgebraicCycles `79b02f6`. The pins are Mathlib `6b7abb3c` and Tau Ceti `a91d3aaf`.

## Verified sound

### Round-3 findings, repair status

| Finding | Status | Repaired passage (at most 40 words) and check |
| --- | --- | --- |
| codex F01 | repaired | `:474` "*Needs:* §3.4; §4.2; Mathlib `CochainComplex.mappingCone`…". `design/plan.json:943` lists target:4.2. The new edge runs from Layer 4 to Layer 5 and creates no cycle. |
| codex F02 | repaired | `:596` "EnhancedDerivedSheaves §§0.1–0.4, E0.6, E2.6". E0.6 resolves at `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:259` on main. |
| claude F01 (P2, Spec ℤ products) | repaired | `:200` "the ambient cube X×□ⁿ is formed over Spec ℤ". `:207` "For two opens Y⊂X×□ⁿ and Y′⊂X×□ᵐ over the same X … The target is an open cube over X … external pairing over Spec ℤ is included when X×_ℤX′ also satisfies those hypotheses." See the computation after this table. Follow-ups: R01, R02, R05. |
| claude F02 | repaired | `:208` "The equivalence intertwines every ψᵃ, a≥1, and carries the rational generalized weight-q piece … onto the simultaneous weight-q eigenspace of Kₘ₊ₙ^T(X)⊗ℚ." `:677` adds "with its weightwise form". ColemanIntegration `:2433` relativityIso is weightwise; SchemeKTheoryOperations §6.9 (`:2078`) gives simultaneous supported weights. |
| claude F03 | repaired | `:256` no longer lists §2.0b, and nor does the 2.1 plan entry (`design/plan.json:368`). All four Checks evaluate without it (table below). The duplicated supplier entry left behind is part of R03. |
| claude F04 | repaired | `:272` "Its uniformizer-last localization residue at t=0 … is [2]∈CH¹(Spec ℚ,1)⊗ℚ … Reversing the loop order gives −[2]". The regulator is now only a pointer forward to §7.3. Recomputed at the cycle level below. |
| claude F05 | repaired | `:297` "The cycle product is Levine94 Theorem 5.2, p.313, Levine94 line 2226; compatibility of the character with it is proved here by the tensor-pairing route below." The plan locator and both manifest `cited_for` entries were updated to match. |
| claude F06 | repaired | `:360` "inclusion D(A,p)→cone followed by projection cone→D(A,p) equal to the identity of D(A,p), and projection followed by inclusion homotopic to the identity of the cone". Agrees with BKK line 4100 (ψ∘φ=id, φ∘ψ−id=dh+hd). |

**The Spec ℤ product computation (claude F01).** Over X=Spec ℤ[i], set π=1+i and v=s−i in ℤ[i,s]/(s²+1). Then s²+1=v(v+2i) and 2i=π², so the relation lies in m². The local ring therefore has cotangent dimension 2 but dimension 1: the external self-product is singular and excluded. The common-base target X×□² is smooth over X, hence regular, so it is included.

**Search for each repaired pattern in the rest of the design.**
- **Products leaving their domain.** The external products of §§1.4, 2.4, 5.1 (API 3), 5.4 and 7.3 are over a field or ℂ, where the products stay smooth. None found.
- **Equivalences missing a marked structure.** No other consumer contract requests weights through an unmarked map.
- **Missing or stale *Needs:* entries.** R03 is the only one. All seven layer Dependencies cover the suppliers named in their *Needs:* lines; checked by script.
- **Checks that use a later target.** R04 is the only one. The new Check in §2.2 uses only §§1.4 and 2.0a–2.0b, and KTheoryFiniteLocalFields §§3.0a and 6.10.
- **Citations claiming more than the source states.** One new instance, the multiplicativity of §2.0a (R01).
- **Reversed composites.** None.

### Dependency check

The command given in the brief exited 0:

```text
candidate: MotivicEtaleKTheory is not in the merge order yet; checked as if placed after MotivesAndAlgebraicCycles (the intake inserts it when its design is accepted)
depcheck: 28 roadmaps, 244 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. `roadmaps resolve` on the README reported no unresolved cross-roadmap citation or Lean name (main `72d2b66`, 331 heads). The suppliers of the changed passages are all earlier in the merge order: SchemeKTheoryOperations (line 41), KTheoryFiniteLocalFields (84) and GeneralAlgebraicKTheory (5). The consumer ColemanIntegration is later (155).

### Seeded sample (15 targets), checked against the text

No locator is flagged as unverified. Pages are printed pages.

| Target | Text read | Hypotheses, conclusion and convention |
| --- | --- | --- |
| 1.2 | BFT line 943, line 948 (§6.4, p.19), line 953–957, line 961 (Prop. 6.12, p.20) | Equidimensional quasi-projective over a field. Cycles meet every product face properly and are normalized only in the cube directions. Both axis maps are quasi-isomorphisms. The Jₙ transport is checked in the table. |
| 1.4 | Levine94 line 1794 (Cor. 4.9, p.297, rational pullback only); line 2226–2240 (Thm. 5.2, p.313, smooth quasi-projective, rational); BF line 661 (§2.2, p.14) | The README attributes integral pullback to KTheoryFiniteLocalFields moving and does not take it from the rational corollary. |
| 2.0a | Levine94 line 407 (p.247); line 539 (Thm. 1.10); line 625 (Cor. 1.11, p.256); line 655–711 (§2, pp.257–258); line 719–736 (proof of Lemma 2.1, pp.258–259); line 1101 (Thm. 2.7, infinite field, p.271); line 1215–1222 (relativity preserves the (q)-piece, pp.276–277) | The regular-base extension rests on the supplier's operations (SchemeKTheoryOperations §6.8). Line 699–705 leads to R01. |
| 2.1 | Levine94 line 1197–1214 (Thm. 3.1, p.276); BF line 961–997 (pp.21–22) | Smooth quasi-projective over a field, generalized (q)-piece. The character is the rational inverse on each weight. |
| 2.2 | Levine94 line 1210, line 1229 (proof uses Thm. 2.7 over k); BF line 905 (Thm. 3.5) and line 919 (proof assumes smooth quasi-projective) | The isomorphism holds weight by weight. Simultaneous weights come from SchemeKTheoryOperations §6.9; the identification with the universal-class character remains uncertified (Bloch86 §7). |
| 3.3 | BKK line 3999 (Def. 5.7, p.111), line 4027–4030 (πₚ), line 4035–4050 (Defs. 5.9–5.10, p.112), line 4060–4111 (Prop. 5.12, pp.112–113) | u(a,f)=−a+f. Both cases of D(A,p) and d_D match, as do φ, ψ and h. ψ∘φ=id. |
| 4.1 | BKK line 4129–4140 (Def. 5.14, p.114), line 4176–4180 (p.115) | All four cases, rₚ(x)=2πₚ(Fᵖdx), and the odd critical four-term formula match verbatim in content. |
| 5.2 | BF line 517–552 ((1.30), Prop. 1.31, p.11); BKK line 4795–4829 (§5.6, p.132), line 4841–4847 (Prop. 5.58, p.133) | Smooth ambient, arbitrary singular support, (2πi)^−(d−p) normalization, and both directions of the current criterion. Principal divisor (0,−½log ff̄). |
| 5.4 | BF line 720 (Prop. 2.8, p.15), line 741 (Cor. 2.9, p.16), line 753 (Lemma 2.11, p.16), line 766–785 (Prop. 2.13, pp.16–17) | Class isomorphism, projection quasi-isomorphism through semipurity, affine contraction. δ=Σ(−1)ⁱ(δ⁰ᵢ−δ¹ᵢ) (line 711) equals −∂□. |
| 6.1 | BF line 862–876 (§3.1, (3.1)–(3.2), p.19); BFT line 277–295 (p.7) | The roof is fundamental class → projection⁻¹ → forget support → constant-cube⁻¹, with lift independence (Cor. 2.15, Lemma 4.6). |
| 6.2 | BF line 319–322 (Lemma 1.10, p.7); line 877–885 (Prop. 3.3, p.19) | Flat contravariance on complexes, arbitrary maps on homology. Higher coherence is supplied by the enhancement and is not claimed from BF. |
| 6.3 | BF line 827–852 (Prop. 2.19, p.18), line 877; BFT line 961 | Graph-good-position subfamilies are quasi-isomorphic, and pullback is defined on them. |
| 7.2 | BF line 905–1053 (Thm. 3.5 and proof, pp.20–23), line 1033–1036; BFT line 296 | Grassmannian nerves, universal classes, and Remark 3.4's normalization of the class of a Chern class. Requires smooth quasi-projective. |
| 7.3 | BF line 1440–1449 (§5.1, sign (−1)ⁿˢ, p.31), line 1539–1542 (Def. 5.8, p.33), line 1619–1632 (Prop. 5.13, Cor. 5.14, p.35) | The supported fundamental-class product represents the product cycle, with multiplicities. |
| 7.4 | BKK line 3965–3990 (p.110, c₁ through the exponential); line 4176–4180 (p.115); BF line 550–552 (p.11); KLM line 553 (§5.3, p.13, R₁=log z) | Positive unit logarithm, negative Green representative, four-term odd product. |

### Supplier sections resolved

Changed passages were resolved at the heads. Main is `72d2b66`.

| Supplier | Anchor and finding |
| --- | --- |
| SchemeKTheoryOperations | `TauCetiRoadmap/SchemeKTheoryOperations/README.md:1627` (§6.1: supported pairing `:1631`, external pairing `:1650`); `:2031` (§6.8; products in scope at `:2076`); `:2078` (§6.9, simultaneous supported weights; Riou paragraph at `:2106`); §§2.1–2.6, 3.1–3.6, 4.3, 6.7 and 7.1–7.3 present. |
| KTheoryFiniteLocalFields | `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:19`: uniformizer-last ∂ₙ=(−1)ⁿ⁻¹Bₙ, so ∂{u,π}=ū. `:478` (§3.0a; motivicToK at `:501`, which fixes the diagonal residue as last-slot). `:1472` (diagonalChernMilnor). |
| GeneralAlgebraicKTheory | `TauCetiRoadmap/GeneralAlgebraicKTheory/README.md:1623` (§7.4, biexact pairings), `:1950` (§8.13, δ₂=−B₂ by KTheoryFiniteLocalFields `:53`). |
| ColemanIntegration | `TauCetiRoadmap/ColemanIntegration/README.md:2433` (L3.Fa.2: weightwise relativityIso, normalized as "t=0 minus t=∞", which equals (a,b)↦a−b at `:208` here); `:2391`, `:2395`, `:2458` (R02). |
| MotivesAndAlgebraicCycles | `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:675`, `:690`, `:710`, `:813`, `:858`, `:872` (§§4.7, 4.8, 4.8a, 4.14, 4.17, 4.18). |
| On main | EnhancedDerivedSheaves `:259`, `:429`–`:492`, `:580`, `:2293`; EtaleCohomologyFoundations `:57`, `:105`, `:139`; AlgebraicTopology `:326`, `:471`, `:946`, `:1602`; ComplexKahlerGeometry `:96`, `:193`; SchemeAndStackFoundations `:3265`, `:3309`, `:5613`, `:6075`, `:6567`–`:7107`. |

ResolutionOfSingularitiesCharacteristicZero, ComplexComparisonPartII and DifferentialGeometry are cited only by unchanged passages. Their round-3 resolutions are relied on, together with the resolver run above.

### Pinned declarations opened

Each declaration was opened at the stated line, at the pin.

Mathlib `6b7abb3c`, 11 declarations:
- AlgebraicCycle/Basic.lean:44 `AlgebraicCycle`: `Function.locallyFinsupp X R`, with no dimension condition.
- AlgebraicCycle/Basic.lean:69 `map`: requires `QuasiCompact f` and weights wx, wy.
- Scheme.lean:40 `Scheme`.
- ModuleCat/Basic.lean:56 `ModuleCat`.
- HomologicalComplex.lean:59 `HomologicalComplex`, and :72 `d_comp_d`.
- DerivedCategory/Basic.lean:87: `HomologicalComplexUpToQuasiIso C (ComplexShape.up ℤ)`.
- MappingCone.lean:57 `mappingCone` (homotopyCofiber), :261 `inl_v_d` and :269 `inr_f_d`.
- DoldKan/Equivalence.lean:167 `CategoryTheory.Abelian.DoldKan.equivalence`.

Tau Ceti `a91d3aaf`, 8 declarations. The namespaces `TauCeti` and `TauCeti.Hodge` were confirmed.
- GradedCochainComplex.lean:59 `gradedCochainComplex`.
- Hodge/Structure.lean:62 `HodgeStructureOn`.
- Morphism.lean:69 `IsMorphism`.
- Tate/Basic.lean:91 `tate`, :100 `tate_F` and :111 `tate_piece`.
- Mixed/Basic.lean:72 `MixedHodgeStructure`.
- Mixed/Strictness.lean:110 `range_inf_F_eq_map_F` (range ⊓ F p = map of F p).

### Duplication and ownership by object

`roadmaps grep` over main and the 331 heads, which include every sibling the brief names, searched for "multi-relative" (hits only in ColemanIntegration and SchemeKTheoryOperations), Whitney jets and extensions, flat ideals, and the supported/external K pairings. The board packages were searched too; their only "flat ideal" hits are a different object. The new pairing builds on SchemeKTheoryOperations §6.1's vertex pairings (R01) and overlaps ColemanIntegration L3.Fa.1. This roadmap is the owner because it is earlier (R02).

The other allocations from round 3 are unchanged: Polylogarithms §5.2 imports §§5.2–5.3, and KTheoryFiniteLocalFields owns the simplicial cycles. No Lean name is introduced.

### Declared gaps

Both gaps are unchanged since round 3. Each names DifferentialGeometry (on main), with the same slug at README `:93` and `:101` and in the plan `gaps`, and a precise domain and conclusion. Neither is provided at the pins, on main, or at the heads, by the searches above.

Their six Checks were recomputed:
- Whitney jet coefficients n! give derivatives (n!)².
- At m=2 and y=π/2, (m!)² sin y = 4.
- exp(−1/x²) shows that the extension is not unique.
- φ(x)+φ(y) has value e⁻¹ at (0,1).

### Shape and principles

- **Counts.** 27 targets (8 definitions, 6 constructions, 12 theorems, 1 example), 49 API entries, 99 target Checks and 6 gap Checks. Every definition and construction has at least three Checks.
- **Plan agreement.** Every plan statement and Check occurs verbatim in the README, checked by script. Four plan API entries (in 2.2, 3.2 twice, and 6.2) paraphrase their README proof paragraphs, as before.
- **Layer shape.** All seven layers have Examples and Dependencies.
- **Style.** No LaTeX, process words, pull-request numbers, machine paths, `set_option`, computational algorithm or copied passage.
- **Principles.** No route shortcut and no re-planned roadmap.

### Adversarial table

Rows cover every changed passage and every sampled target, with values computed this round. For unchanged, unsampled targets (1.1, 1.3, 2.0b, 2.3, 3.1, 3.2, 3.4, 4.2, 5.3, 7.1) the round-3 codex rows with computed values are relied on. Three of them were spot-recomputed: the 2.0b diagonal (1,−1,2 at n=1,2,3), the dz/z weight 2 in 3.2, and 30=30 for 4.2.

| Statement | Instances | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| 2.0a domain sentence | ℤ[i]; ℤ_(p); ∅ | ℤ[i]⊗ℤ[i]: relation v(v+2i) ∈ m², dimension 1 < cotangent dimension 2, excluded; ℤ_(p)×□² regular of dimension 3, included; ∅ gives 0 at every vertex | holds | R05 wording |
| 2.0a API2 pullback | generic point g: Spec ℚ→Spec ℤ_(3), S=Y | [u]∈K₁(ℤ_(3))↦[u]∈K₁(ℚ); ψ² gives 2[u] on both sides | holds | none |
| 2.0a API2 common-base support | S={t=2}, S′={t=3} in X×□ over ℤ_(5) | S×_XS′ is the section (2,3) of X×□², codimension 2, closed | holds | none |
| 2.0a API2 multiplicativity | [2],[−1] over ℤ_(3); line bundles L,M | ψ²{2,−1}=4{2,−1}=(2[2])(2[−1]); ψ²([L][M])=[L²M²]=ψ²[L]ψ²[M] | holds; no route | R01 |
| 2.0a API3 weights | unit 2 over ℚ; {u,v} over ℚ(u,v); Bott-type wrong model | relative ψ²: 2 and 4, equal to absolute K₁ weight 1 and K₂ weight 2; a 𝔾_m-loop model would give 4 and 8, excluded because □ with two faces is a simplicial circle (Levine94 line 1215–1222) | holds | none |
| 2.0a API3 sign | (1,0),(0,1),(1,1) | a−b: 1,−1,0; b−a: −1,1,0; ColemanIntegration: t=0 minus t=∞ is a−b | holds | none |
| 2.0a ℙ² Check | h=1−[O(−1)] | ψ²h=2h−h², ψ²h²=4h², ψ²(2h+h²)=2(2h+h²); index det [[2,1],[0,1]]=2 | holds | none |
| 2.1 without §2.0b | rank 2; O(±1) on ℙ¹; ∅; two points; unit 2 | 2; 2 against the total Chern class (1+h)(1−h)=1; 0; (2,1) against 3; ch₁,₁[2]=[2], v₂=1 | holds | R03 (duplicate entry) |
| 2.2 degree-two Check | {(t,2,t)} and {(t,t,2)} in 𝔸¹×□² | ∂□ of the closures: −[2] and +[2]; raw connecting: +[2] and −[2]; minus raw (=B): −[2] and +[2]; uniformizer-last (−1)¹·: +[2] and −[2]; KTheoryFiniteLocalFields ∂{2,t}=2, ∂{t,2}=2⁻¹ | holds | none |
| 2.2 weights | weights 0,1,2; K₁(k) | ψ² eigenvalues 1,2,4, differences −1,−3,−2; ψᵃ[u]=a[u]; ch₂(O(1)) on ℙ² is h²/2 | holds | none |
| 2.4 attribution | Levine94 line 2226; BF line 961–997 | rational cycle product only; construction and degree zero only | holds | none |
| 2.4 new Check | ξ=[O_pt] on ℙ¹ | ξ²=[O_p⊗ᴸO_q]=0; ch ξ=h; h²∈CH²(ℙ¹)=0; 0=0 | holds | none |
| 2.4 coefficient | p=1,2,3 | (−1)ᵖ⁻¹/(p−1)! = 1, −1, 1/2; ch₂,₂=−c₂,₂ | holds; edge | R03 |
| 3.3 composites | point, p=1, degree 1 | φ(r)=(0,0,r), ψφ(r)=r; φψ(0,0,log2+iθ)=(0,0,log2); difference (0,0,iθ)=d(−iθ,0,0) with iθ∈ℝ(1) | holds | none |
| 3.3 twists | ℂ[0], p=−1,0,1 | H⁰=ℝ(−1), ℝ, 0; H¹=0, 0, ℝ; d_D(zz̄)=−2dz∧dz̄ | holds | none |
| 5.1 new Check | V(x)·V(y); V(x)·V(x−1) in 𝔸² | coefficient +1 in H⁴_D,{0}=ℝ (from §5.2); forget: 0=0; disjoint: support ∅, fib(id)=0 | values hold; uses a later target | R04 |
| Layer 6 summary | *Needs:* of 6.2 | E0.6 present in both | holds | none |
| Consumer paragraph | L3.Fa.1–L3.Fa.3 | weightwise relativity present; pairing not recorded | partial | R02 |
| 1.2 | (1,1); total degrees 0,2; J | cross coefficients +1 (∂Δ∂□), −1 (∂□∂Δ); 1 and 3 summands; J D J⁻¹=δ+(−1)ⁿ∂Δ; (−1)ⁿ⁺ᵐ gives −1 at (0,1) | holds | none |
| 1.4 | 𝔽₂(t)/𝔽₂(t²); pt⊔ℙ¹; odd factors | f_*f*=2; CH¹=0⊕ℤ, CH⁰=ℤ²; exchange −1 | holds | none |
| 4.1 | log2·log∣t∣; zz̄ and 1 at weight 1 | (log2/2)(dt/t−dt̄/t̄)=i log2 darg t, period 2πi log2; −z̄dz+zdz̄, −F¹¹d gives −2dz∧dz̄=d_Dx•1 | holds | none |
| 5.2 | V(xy), cusp, origin (p=1,2), point with full support | ℝ², ℝ, 0, ℝ; H¹_D(pt,ℝ(1))=ℝ≠0 shows the codimension hypothesis is needed; −2∂∂̄[−log∣t∣]=−δ₀, so m=+1 | holds | none |
| 5.4 | point→𝔸¹; (n,s) | H¹_D=ℝ on both; (−1)ⁿˢ=−1,+1,+1 at (1,1),(0,1),(1,2) | holds | none |
| 6.1 | Spec ℂ; ℙ¹ | m↦m; CH⁰(pt,n>0)=0; Tate-normalized c₁O(±1)=±1 | holds | none |
| 6.2 | A=A′=ℤ[0], B=0, B′=(ℤ→ℤ), h=1 | (1,1)↦D′=(0,1−1)=(0,0); wrong sign (1,−1)↦(0,2) | holds | none |
| 6.3 | pt→ℙ¹; ℚ→ℝ→ℂ | c₁ pulls back to 0 in CH¹(pt) and in H²_D(pt,ℝ(1))=0; log 2 along both paths | holds | none |
| 7.2 | rank 2; [O_pt] on ℙ¹; units 2,−1 | 2; h_D; log 2; 0 | holds | none |
| 7.3 | {2}·{t}; units 2,3 at a point; rulings | ±i log2 darg t; H²_D(pt,ℝ(2))=0; point class of degree 1, doubled to 2 | holds | none |
| 7.4 | f,g units; u=2,3,½,i | x•y=i(log∣f∣darg g−log∣g∣darg f) from ∂log∣f∣=df/2f; log 6=log2+log3; −log 2; 0 | holds | none |

### Headline theorems and elaboration

The headline theorems are §§1.3, 2.2, 2.3, 3.2, 3.4, 4.2, 5.2, 5.4, 6.1–6.3, 7.2, 7.3 and 7.4. This is a design, so there is no `Suggested.lean` and no padding probe applies. Higher Chow complexes, scheme Kₙ and a geometric logarithmic Deligne complex are all absent at the pins. At the package stage the module docstring must name these missing carriers.

**Elaboration:** not available (this lane does not elaborate). No Lean command was run, and there is no `#check` binder comparison.

## Not verifiable

- **Bloch86 §7** is settled as uncertified, so the arbitrary-field universal classes (§2.0b) and their identification with Levine's inverse (§2.2) were not read. BF line 961–997 was read for the complex-field sketch only.
- **Beilinson85** (uncertified) and **Levine98** (waived) were not requested.
- **Riou**'s several-variable uniqueness, used in R01's repaired route, was not read in the source. The repair cites the supplier section `TauCetiRoadmap/SchemeKTheoryOperations/README.md:2106`, which states it.
- **ResolutionOfSingularitiesCharacteristicZero, ComplexComparisonPartII and DifferentialGeometry** anchors cited only by unchanged text rest on round 3 and the resolver run.
- **Lean elaboration** is not available in this lane.

## Source issues

- **Gap** in BF at Theorem 3.5, p.20: the source states the comparison for every equidimensional complex algebraic scheme, but its proof (line 919) assumes smooth quasi-projective X. It should assume that; affects a stated result.
- **Gap** in BF at Proposition 2.7, p.15: the source asserts an associative product on higher Chow groups of every quasi-projective scheme, citing a rational theorem for smooth schemes. It should require smoothness and rational coefficients; affects a stated result.
- **Misprint** in BF at Proposition 1.26, p.10: the source gives the associator homotopy codomain degree r+s+t. It should be r+s+t−1, as the identity dh+hd=associator forces; affects nothing.
- **Misprint** in BF in the proof of Theorem 3.5, p.22: the source parametrizes k-planes in ℂᴺ but uses a rank-N universal bundle and stabilizes in k. It should use N-planes in ℂᴺ⁺ᵏ; affects the proof.
- **Gap** in Levine94 at Theorem 3.1, pp.276–277: the source states the isomorphism over any field, but its proof verifies Theorem 2.7, which assumes an infinite field. It should add descent from coprime infinite extensions; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "efff8a4", "job": "REV-DESIGN-MotivicEtaleKTheory~4", "model": "opus", "worker": "fable-rev42"} -->
