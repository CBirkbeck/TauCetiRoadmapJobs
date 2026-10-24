<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1092#issuecomment-6380962840 -->
Review (claude) of 37bbd60

Verdict: needs changes

1. **F01** (P2) The Summary states the general Ax–Lindemann conclusion as "special", but the theorem gives only opposite-special

   - **Location.** `packages/AdmissiblePairsAndPadicHodgeStructures/README.md` line 3: "the main result identifies the opposite analytic closure of an irreducible analytic set with a special subvariety, subject to the empty-intersection convention in the general case."
   - **Claim.** In the general (non-minuscule) case the Hodge–Tate (resp. Hodge) analytic closure of an irreducible Hodge (resp. Hodge–Tate) analytic set is *special*. By the README's own §9.4 (line 1618), *special* means that all adjoint weights lie in [−1,1].
   - **Witness.** HKII Theorem 9.1.3(2) (HKII line 2486) concludes only *Hodge–Tate special*, and README §11.5 (line 1853) says the same. Take G = E^×⋉E (mirabolic of Res_{E/Q_p}GL_2), μ=(−1,−1,2), b=1. The Lie weights are 0,−1,−1,2. The whole component is HT-special but not special (2>1), and it is the HT closure of a generic classical point.
   - **Repair.** Replace "with a special subvariety" by "with an opposite-special (Hodge–Tate special, resp. Hodge special) subvariety; in minuscule type the three notions agree and the closure is special". Tested: in the mirabolic instance the closure is HT-special, which the repaired sentence states.

2. **F02** (P2) Goodness and the exactness criterion (§§0.2, 0.4) omit the algebraically closed residue field that the source assumes

   - **Location.** README line 236 (§0.2): "For a connected linear algebraic G/k in characteristic zero and a bilatticed G(K)-torsor …, call it good of type [mu] when, after trivializing the first lattice, the second lies in G(R)t^muG(R)." Line 275 (§0.4) states the three-way equivalence on this definition.
   - **Claim.** The definition and HKI Theorem 3.2.6 hold over any characteristic-zero complete DVR R with residue field k.
   - **Witness.** HKI line 1151 trivializes the two G-bundles over B⁺ "because the residue field C is algebraically closed"; HKI line 1029 uses an algebraically closed coefficient field. Take G=PGL_2, k=Q_p, R=Q_p[[t]], L_1 the quaternion-algebra torsor (H¹(Q_p,PGL_2)=Z/2) and L_2=L_1. Then BB_1 is the trivial, exact filtration, yet "after trivializing the first lattice" cannot be carried out, so §0.4 (1)⇔(2) fails as written.
   - **Repair.** In §0.2 and §0.4 add "with k algebraically closed (HKI §3.2), or define goodness and [mu] after base change to the completed k̄[[t]]". Tested: after base change the torsor is trivial, L_2=L_1 has type 0 and is good, matching BB_1 exact. Conventions line 30 already announces this extension. §0.3 and §0.5 state it; §§0.2 and 0.4 do not.

3. **F03** (P2) Two declared gaps ask ReductiveGroups for Chevalley's line-stabilizer theorem, which the Tau Ceti pin already proves

   - **Location.** README line 77 (gap:countable-chevalley-lines): "Supply a countable exhaustion of the regular representation by finite-dimensional subrepresentations and its exterior-power Chevalley-line criterion for every closed subgroup." Line 81 (gap:observable-subgroup-embedding) asks for "Chevalley line stabilizers" as well. The same slugs appear in `design/plan.json` `gaps`. "From Tau Ceti" (line 61) cites only the Tannaka isomorphism.
   - **Claim.** These are missing prerequisites that need a supplier.
   - **Witness.** `TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer` (`TauCeti/Algebra/AlgebraicGroup/Representation/ExteriorStabilizer/Character.lean` line 101, pinned Tau Ceti) proves the following. Every closed subgroup with a finitely generated ideal is the scheme-theoretic stabilizer of a line in ⋀ⁿV, with V a finite subcomodule of the regular comodule, and it acts on that line by a unique character. `TauCeti.Subcomodule.exists_finite_subcomodule_mem` and `iUnion_finiteSubcomodules_eq_univ` (`TauCeti/Algebra/Coalgebra/Subcomodule/Finite.lean` lines 144 and 292) give the exhaustion. This is exactly the argument of HKII Prop. 9.3.4, HKII lines 2679–2685.
   - **Repair.** Under "From Tau Ceti", cite these three declarations with their exact hypotheses (field, commutative Hopf algebra, finitely generated Hopf ideal). Cite them in the *Needs:* of §§2.5, 5.2, 5.3, 7.6, 8.3 and 10.2. Withdraw gap:countable-chevalley-lines: countability follows from a countable basis of Q_p[G] together with `exists_finite_subcomodule_mem`. Narrow gap:observable-subgroup-embedding, in the README and in plan.json, to what the pins lack: an observable (vector-stabilizer) subgroup has a quasi-affine quotient, plus the representability distinction between affine and quasi-affine quotients. Tested on §10.2: the Tau Ceti line lies in ⋀ⁿV ⊂ ⋀ⁿV_i for some member V_i of the exhaustion, so the countable family {⋀ⁿV_i} suffices.

4. **F04** (P3) §10.2 uses closed projection from a profinite product but does not cite its owner

   - **Location.** README line 1739: "Exhaust the non-global lines by compact subsets; properness of the parameter projection makes the incidence images closed." The *Needs:* on line 1743 and the Layer 10 Dependencies (line 1763) omit the supplier.
   - **Claim.** The route's inputs are §10.1, §8.1, §4.3, ReductiveGroups Layer 1 and RG2.0.
   - **Witness.** DiamondsAndVStacks D5.10 (`profinite-products-of-locally-spatial-diamonds`, at the head of its open pull request) proves |P̲×S|≅P×|S| and that the projection is universally closed. It is written for exactly this step, citing the HK proof of Prop. 9.3.4. At HKII line 2706 the source deduces closedness of the incidence images from properness of that projection.
   - **Repair.** Add "DiamondsAndVStacks D5 / profinite-products-of-locally-spatial-diamonds" to the §10.2 *Needs:* and to the Layer 10 Dependencies. DiamondsAndVStacks is already a supplier earlier in the merge order, so the dependency check is unchanged.

5. **F05** (P3) §5.3 and §11.6 are stated more narrowly than the source supports

   - **Location.** Line 975 (§5.3): "Every Gr_[mu] is locally closed; it is closed in Gr_G if [mu_M] is minuscule". Line 1865 (§11.6): "For an algebraic Z′⊂Fl_[mu] over its reflex field".
   - **Claim.** These are the statements of HKII Theorem 5.0.4(2) and Example 1.1.5.
   - **Witness.** In HKII line 1425, Gr_[µ] is a locally closed *locally spatial* subdiamond of Gr_G×Spd L([µ]), *partially proper* over Spd L([µ]), and closed in that base change. HKII line 274 allows Z′ ⊂ Fl_[µ],L([µ]), that is, defined over L([µ]) and not only over the reflex field.
   - **Repair.** In §5.3 state the base change to Spd L([mu]) and add "locally spatial, partially proper over Spd L([mu])". In §11.6 replace "over its reflex field" by "defined over L([mu])". Check: Remark 1.1.7 (HKII line 289) explains that L-analytic conditions for a larger residue field are the point of allowing arbitrary L.

6. **F06** (P3) §8.5 calls a local quadratic extension a "CM field"

   - **Location.** Line 1485: "In the height-two Lubin–Tate case a quadratic CM field F gives the special period points P^1(F) … These are local special points, without a global CM algebraicity condition."
   - **Claim.** F is a quadratic CM field.
   - **Witness.** HKII Remark 7.5.8 (HKII lines 2210–2215) takes F/Q_p of degree two. A CM field is a global notion, and the README's next sentence denies any global CM condition.
   - **Repair.** Write "a quadratic extension F/Q_p (embedded in the quaternion division algebra)". Check: the special points form one D^×-orbit identified with P^1(F); D^×/F^× and P^1(F) both have Q_p-dimension 2.

7. **F07** (P3) Internal target labels appear in the prose in place of section numbers

   - **Location.** Line 612: "Layer 0 lattice_recovery". Line 1099: "Layer 8 special_loci". Line 1631: "Layer 11 bi_analytic". Line 1405: "Layer 10 exceptional". Line 594: "Layer 10 generic locus". Line 764: "Layer 11 closures".
   - **Claim.** These name consumers.
   - **Witness.** No such headings exist. The README's subsections are numbered (§0.5, §8.4, §11.5, §10.1–10.2, §11.1). snake_case labels are neither standard vocabulary nor declared names (house style: standard vocabulary, no catalogue ids).
   - **Repair.** Replace each label by its section: §0.5, §8.4, §11.5, §10.1, §10.1, §11.1.

8. **F08** (P3) Source line locators point at page markers and disagree across the README; References and manifest are out of step

   - **Location.** 106 of the 124 "`<source>` line N" citations name a page-marker line. Examples: line 412 (§1.5) "HKII line 1213" is the page-27 marker, while Theorem 4.2.2 is at HKII line 1249. Line 1855 (§11.5) "HKII line 2449" is the page-55 marker, while line 7 cites HKII line 2481 for the same theorem. Similarly §11.6 has 239 vs 268, §11.7 has 479 vs 501, §4.6 "Scholze line 1892" is a page marker (Theorem 7.6 is at line 1936), and §6.4 "LiuZhu line 45" is a page marker.
   - **Claim.** The cited lines locate the statements.
   - **Witness.** Further problems. References line 2063 dates Scholze arXiv v2 to 2013 (the text is dated 3 Nov 2012) and adds "Definition 8.3 and Theorem 8.4, p. 48", which neither the body nor the `sources.toml` locator records. BhattHansen is cited only in References, although its manifest `cited_for` is §10.3. Daniels–van Hoften–Kim–Zhang (line 2009) and Chambert-Loir–Loeser (line 2021) are named without locator or manifest entry.
   - **Repair.** Replace each page-marker line by the statement's line. Examples: HKII Theorem 4.2.2 at line 1249, Theorem 5.0.4 at 1419, Def. 6.3.1 at 1710, Lemma 6.3.3 at 1731, Prop. 7.3.4 at 1985, Def. 7.4.1 at 2065, Def. 7.5.6 at 2182, Def. 8.4.1 at 2353, Theorem 8.5.1 at 2412, Theorem 9.1.3 at 2481, Prop. 9.3.4 at 2663, Lemma 9.3.5 at 2710; HKI Def. 3.2.5 at 1168, Theorem 3.5.1 at 1413, Def. 5.1.1 at 1841, Theorem 4.3.5 at 1646. Change the Scholze date to 2012. Cite BhattHansen Def. 2.5 and Cor. 2.10 in §10.3, or drop them. Bring the Scholze References entry into line with the manifest. Cite DvHKZ and Chambert-Loir–Loeser through HKII footnote 7 (HKII line 2920) and §10.2 (HKII line 2919), or record them in `sources.toml` with locators.

Independent review of `packages/AdmissiblePairsAndPadicHodgeStructures/README.md`, `Suggested.lean`, `metadata.toml` and `sources.toml` (round 1, no previous review). Three P2 findings block acceptance: a headline overclaim in the Summary, a missing residue-field hypothesis in Layer 0, and two declared supplier gaps that request a theorem already present at the Tau Ceti pin. Five P3 findings follow. The mathematics of the 78 subsections is otherwise sound in every instance computed below. The 15 sampled locators match the sources, and `Suggested.lean` is correct as an empty acceptance test.

## Verified sound

### Elaboration, form and headline theorems

- I ran `lake env lean` on `Suggested.lean` from the content checkout at the pins (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`). It exits 0 with no output: there is no declaration, so there is no `sorry` warning. There are no `TauCeti.*` imports to build.
- The file has a single `import Mathlib`, no `set_option`, the namespace `TauCetiRoadmap.AdmissiblePairsAndPadicHodgeStructures` and one module docstring of the required form.
- `#check @name` comparison: not applicable, since nothing is declared. One-tactic padding probe: not applicable, so there is no padding.
- Headline theorems named in the README: HKII Theorem 9.1.3 (§11.5), Theorem A (§11.6), Theorem B (§11.7) and HKI Theorem B (§3.4). Deep results it is built to reach include §§2.3, 6.2–6.8, 9.6 and 9.7.
- None of these is statable at the pins. Mathlib has `BDeRhamPlus`/`BDeRham` (`Mathlib/RingTheory/Perfectoid/BDeRham.lean` lines 75 and 88) and `WittVector.Isocrystal` (line 113), but no Fargues–Fontaine curve or diamonds. Tau Ceti's `AlgebraicGeometry/AdicSpace/FarguesFontaine/Quotient.lean` is only the topological Frobenius orbit space ("The adic curve additionally requires a sheaf …"), and `Geometry/Hodge/*` holds classical complex Hodge structures. So admissibility (semistability of a modification) cannot be stated, and the docstring correctly names each headline with its missing carrier.
- Mathlib declarations opened: `Isocrystal.lean` lines 113, 132, 138, 157, 172, 180; `Topology/Baire/Lemmas.lean` lines 141, 256; `CompleteMetrizable.lean` line 25. Tau Ceti: `Tannaka/GroupFunctor.lean` line 138. The hypotheses quoted in the README match.

### Dependency check (verbatim)

```
depcheck: 30 roadmaps, 281 edges, 0 problem(s)
```

The roadmap is listed in `merge-order/ORDER.txt` at line 245, right after HeckeStacksAndLocalShtukas (line 244); every named supplier is earlier. There is no UPWARD, CYCLE or `moved:` line.

### Supplier citations resolved (by object, at the heads given)

- **Anchored citations (56 checked).** Every anchor exists:
  - BunGAndNewtonStrata BG0–BG3: 10 anchors;
  - VectorBundlesAndIsocrystals VB0–VB4: 9;
  - DiamondsAndVStacks D1–D6: 11;
  - GeometricSatakeAndFusion GS0: 5;
  - ReductiveGroupsPartII RG2.0–RG2.1: 5;
  - AdicSpacesPartIIPartII RZ.0–RZ.6: 16, in its board design README (merge order line 10).
- **Sections opened, at the heads of their open pull requests:**
  - RelativeFarguesFontaine §§4.10–4.12, 6.6–6.9, 7.2, 7.4, 7.6. §7.6(b) gives v-descent of B⁺ bundles and of B-isomorphisms, not of B_D-modules, so gap:localized-period-module-descent is genuine.
  - MotivesAndAlgebraicCycles §§6.1–6.3, 6.8;
  - AInfCohomology §AI.2.2 (crystalline-rigidified BKF, "Operations in valid BKF subcategories") and §AI.2.3. There is no rational rigidified-modification equivalence, so that gap is genuine.
  - PadicHodgeTheory §§2.2–2.3, 5.5, 7.1, 7.4. There is no Serre openness and no full-rank de Rham criterion, so those two gaps are genuine.
  - HeckeStacksAndLocalShtukas §HS2.12, §HS2.15;
  - EndoscopicTransferAndUnitaryTraceComparison §12.5, §12.11;
  - HilbertModularVarietiesAndShimuraCurves §R18.5.7, .15, .20, .21;
  - PerfectoidShimuraVarieties §§2.2, 3.1, 3.5;
  - IgusaVarietiesAndTorsionConcentration Layer IG.1;
  - DiamondSixOperations §§S2.4, S3.2, S4.2, S4.3.
- **On main:** ReductiveGroups Layers 1–3, 5, 6A (line 479) and 7; AdicSpaces Layer 6; AlgebraicVectorBundles L0A–L0C and L2A–L2B; PerfectoidSpaces §P4.15.6 and §P6.11.
- **Declared gaps.** The 10 slugs are identical in the README and in `design/plan.json`, and each names a supplier. Eight are precise and not already provided. Two are R03.
- **Arbitrary-field de Rham gap.** This gap is justified. LiuZhu line 86 restricts to k finite over Q_p. HKII line 1938 applies LiuZhu Theorem 3.9(iv) over L ⊇ Q̆_p. Scholze Def. 8.3 (Scholze line 2210) presupposes the filtration.

### Duplication and ownership

- I ran `roadmaps grep` across main, the board packages and all 333 open roadmap pull requests. The patterns were Howe/Klevdal, Ax–Lindemann, p-adic Hodge structures, admissible pairs, and non-reductive Grassmannians and Bun_G.
- Howe–Klevdal is cited elsewhere only as a source: DiamondsAndVStacks D5.9/D5.10 and D6, RelativeFarguesFontaine §6–7, HeckeStacksAndLocalShtukas §HS2.15 ("[HK] treats connected linear groups more generally").
- No other roadmap owns admissible pairs, p-adic Hodge structures, non-reductive Grassmannians or basic strata, or bi-analytic Ax–Lindemann. This roadmap is their owner.
- Reductive theory is imported, not restated. Apart from R03, there is no Mathlib or Tau Ceti duplication.

### Sampled locators (15, all read in the cached texts)

| Target | Source passage checked | Outcome |
| --- | --- | --- |
| 0.2 | HKI §3.2 p. 23 (HKI line 1099), Def. 3.2.5 p. 25 (line 1168) | matches; residue-field hypothesis dropped (R02) |
| 0.3 | HKI Thm 3.5.1 p. 30 (line 1413) | matches (dominance, faithful equality ⇔ good) |
| 2.2 | HKI Def. 5.1.1 p. 39 (line 1841); (5.1.1.1)–(5.1.1.2) p. 40 (lines 1862, 1865) | matches |
| 2.3 | HKI Lemmas 4.3.1–4.3.2 (lines 1604, 1613), Thm 4.3.5 (1646), Thm 5.1.6 (1925) | matches |
| 4.4 | HKII §3.1 pp. 20–22: (3.1.0.1) l. 948, Ex. 3.1.1 l. 961, (3.1.1.1) l. 980, Lemma 3.1.2 l. 997 | matches |
| 5.3 | HKII Thm 5.0.4(1)–(3) pp. 31–32 (lines 1419–1429) | matches with narrowing (R05) |
| 6.8 | HKII Prop. 7.3.4 and proof pp. 43–44 (lines 1985–2026) | matches; README adds the needed nonemptiness |
| 7.4 | HKII Def. 6.3.1, Lemma 6.3.2 pp. 37–38 (lines 1710, 1721) | matches |
| 7.5 | HKII Lemma 6.3.3 p. 38 (line 1731) | matches; README avoids the source's smooth-only step |
| 8.1 | HKII Def. 7.4.1 p. 45 (line 2065) | matches |
| 8.4 | HKII Def. 7.5.4, Lemma 7.5.5, Def. 7.5.6 p. 48 (lines 2166–2185) | matches |
| 8.5 | HKII Ex. 7.5.7, Rem. 7.5.8 pp. 48–49 (lines 2189–2215) | matches except "CM field" (R06) |
| 11.6 | HKII Def. 1.1.2, Thm A, Ex. 1.1.5, Rem. 1.1.6 pp. 5–6 (lines 222–286) | matches with narrowing (R05) |
| 11.8 | HKII Rem. 9.1.4 p. 56 (line 2499) | matches (Borel, µ=diag(z⁻¹,1), b=diag(p,1)) |
| 12.4 | HKII §10.1 pp. 64–65 (lines 2892–2915), footnote 7 (line 2920) | matches; the diagonal quotient corrects the source's "×Γ" |

The author flagged no locator as unverified. I also checked: 0.1, 0.5, 1.5, 2.6, 3.1–3.4 (HKI Thm B line 204, Thm 6.3.2 line 2490), 4.3, 5.5–5.6, 6.6, 6.7, 7.3, 7.6, 8.3, 8.6, 9.4–9.6, 10.1–10.3, 11.5 and 11.7 (HKII line 501).

### Adversarial pass (one row per statement; values computed)

| Statement | Instances | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions, Tate table | Q_p(n), n=1 | Frob p⁻¹σ, slope −1; E(W) slope +1; L_et=Fil¹ gives slope 1−1=0; L_dR=Fil⁻¹ (HKI line 1584); weight −2 = 2·(−1) | holds | — |
| Conventions, weight ↔ slope | pure weight w | bundle slope −w/2 (HKI Def 4.2.1); Q_p(n): w=−2n gives slope n | holds | — |
| Conventions, cells | Gr_[µ], X_[µ] | BB: Gr_[µ]→Fl_[µ⁻¹]; X_[µ]⊂Gr_[µ⁻¹], flag Fl_[µ] (HKII diagram line 2321) | holds | — |
| 0.1 | L1=R, L2=tᵃR; L2=⟨e1,e2+t⁻¹e1⟩ | trFilⁱ=k iff i+a≤0 (jump −a); minors d1=−1, d1+d2=0 give {−1,1}; sub/quotient types {0},{0} | holds | — |
| 0.1, examples | same, index 0 | L1∩L2=Re1+Rte2, trace image ke1, which maps to 0 in quotient; quotient trFil⁰=k, so inexact | holds | — |
| 0.1, ramified | t=uᵉ | type a ↦ ea; swap L1,L2 gives a ↦ −a | holds | — |
| 0.2 | G_a⊂GL_2; split torus; PGL_2/Q_p[[t]] | G_a: only µ=0, so the cell is a point and t⁻¹ is not good; torus: every coset is tᵘ; PGL_2: nontrivial L1 torsor | fails without the hypothesis | R02 |
| 0.3 | G_a extension | Levi (0,0) ≤ GL_2 type (1,−1); det degree 0=0 | holds | — |
| 0.4 | G_a extension; PGL_2, L2=L1 | G_a: BB1 inexact (above); PGL_2: BB1 trivial and exact, goodness undefined | fails as stated | R02 |
| 0.5 | GL_2, µ=(1,0) and (2,0) | Ad weights {−1,0,1}: BB bijective; weight 2: stabilizer smaller than the parabolic preimage, nontrivial fibre (HKI Prop 3.1.7, line 1043) | holds | — |
| 1.1 | Borel B⊂GL_2, b=diag(p,1); torus; b=1 | Ad on Lie R_uB multiplies by p, slope 1≠0, not B-basic; torus classes central; b=1 slope 0 | holds | — |
| 1.2 | B, b=diag(p,1) | B(B)=B(T); basic in T, not in B (HKII fn. 1, lines 232–236) | holds | — |
| 1.3 | simple slope ½ GL_2; b=diag(p,1) | G_b(Q_p)=D^×, quaternion; J_b=T, a split torus, not an inner form | holds | — |
| 1.4 | trivial group; Borel | Bun_1=point; negative-degree unipotent extensions not classified by B(M) | holds | — |
| 1.5 | B, b=1 | unipotent isocrystal slope 0, H¹(FF,O)=0, stratum [*/B(Q_p)] (HKII Thm 4.2.2, line 1249, eq. (4.2.2.2)) | holds | — |
| 1.6 | G_m, b=pⁿ | F_b(E_{b′})=E_{b′b⁻¹}, slopes s ↦ s−n; F_b(E_b)=E_1, F_b(E_1)=E_{b⁻¹} | holds | — |
| 1, example σ_b | b=[[1,1],[0,1]], x=diag(2,1) | bxb⁻¹=[[2,−1],[0,1]]; b⁻¹σ_b(x)=xb⁻¹=[[2,−2],[0,1]]; b⁻¹xb=[[2,1],[0,1]] | holds | — |
| 2.1 | Q_p(±1); zero; O(1)⊕O(−1) | Fil⁻¹ weight −2; Fil¹ weight 2; zero object; degree 0 but slopes ±1, not pure | holds | — |
| 2.2 | trivial pair; Tate n | (Q̆_p,B⁺) gives E=O; D₋ₙ with Fil^n gives slope 0; L_dR=Fil⁻ⁿ (HKI Ex 5.1.4, line 1911) | holds | — |
| 2.3 | V=Q_p(1) | ⟨V⟩⊕ has gr only in degree 1 while V⊗² has gr in degree 2, so not tensor-stable and V is nontrivial (HKI lines 1653–1660) | holds | — |
| 2.4 | Q̆_p ⊕ Q̆_p(1) | slopes 0,−1 give weights 0,−2 (W_{w/2}; see Source issues) | holds | — |
| 2.5 | unit sum; Q_p(1); Ext(1,1) with x=t⁻¹ | groups 1, G_m, G_a; e1 line fixed for all u; e2 fixed iff u=0 | holds | — |
| 2.6 | G_m, Q_p(1) | L_et=t¹W, so µ=1; [b]∈B(G_m,µ⁻¹) means κ=−1, b=p⁻¹, i.e. D₋₁; ν=−1=w/2 | holds | — |
| 2.7 | trivial pair | (O,O,id,id) (HKI line 1940) | holds | — |
| 3.1 | Tate; Ext(1,1) with x≠0 | canonical lattice F^k·D₋ₖ; extension: G_a good means x∈B⁺, so only x=0 is analytic (HKI lines 2101–2105) | holds | — |
| 3.2 | unit pair | ω_GK=trivial representation, crystalline (HKI Thm 5.5.1, line 2137) | holds | — |
| 3.3 | Tate k≠0 over strict K | ρ=χᵏ, image open in Q_p^× (HKI Cor 5.5.3, line 2167) | holds | — |
| 3.4 | torus MG | torus flag variety is a point, so both lattices are algebraic (HKI Thm B, line 204) | holds | — |
| 4.1 | cusp K⟨u²,u³⟩ | seminormalization K⟨u⟩, same diamond; u ∉ cusp ring | holds | — |
| 4.2 | O(1) on Spa L | H⁰(Spa L′,O(1))=C(1)^{G_{L′}}=0 for every finite L′ | holds | — |
| 4.3 | X=A¹, f∈Fil⁻ⁱ | locus f∈Fil⁻ⁱ⁺¹ is V(θ(ξⁱf)), Zariski closed (HKII line 781) | holds | — |
| 4.4 | disc family; Fil^a | type {1,−1} for z≠0, {0,0} at z=0; jumps −a and a | holds | — |
| 4.5 | disc family | gr ranks jump at z=0, so not by direct summands, consistent with "iff" | holds | — |
| 4.6 | filtration in degree a=−1 | M=Fil^{−a}M₀=tM₀ (PadicHodgeTheory §7.1 Check) | holds | — |
| 4.7 | X=Spa K | canonical lattice Σ F^{−i}⊗Fil^i | holds | — |
| 5.1 | G_m; G_a | Gr_{G_m}(C)=Z; Gr_{G_a} contains ξ⁻¹, good cell {0} (HKII Ex 5.0.5, line 1458) | holds | — |
| 5.2 | U⊂GL_2; T⊂GL_2 | GL_2/U≅A²∖0, quasi-affine, gives locally closed; GL_2/T affine, gives closed (HKII Lemma 5.1.1, line 1495) | holds | R03 |
| 5.3 | G_a; GL_2, µ=(2,0) | G_a cell is a closed point; GL_2 cell (2,0) has closure containing (1,1), so not closed and not minuscule | holds | R05 |
| 5.4 | G_a⊂GL_2 | Levi (0,0); Gr_{≤(0,0)} is a point, so the cut-out is the point | holds | — |
| 5.5 | G_a | rigid maps constant 0 | holds | — |
| 5.6 | GL_2 (1,0); mirabolic (0,1,−2) | weights ≤1 give an isomorphism; inverse has weight 2, so no section (HKII line 1438) | holds | — |
| 6.1 | Y=Spd C ⊔ Spd C | a morphism is one fixed isocrystal map; independent fibre maps f1≠f2 are excluded | holds | — |
| 6.2 | constant family | evaluation at y faithful because maps are fixed | holds | — |
| 6.3 | norm-one T⊂SL_2 | H¹(Q_p,T)=Q_p^×/NE^×=Z/2, H¹(Q_p,SL_2)=0, kernel Z/2 | holds | — |
| 6.4 | S=Spa L | type of a classical point descends to L | holds (conditional on gap) | — |
| 6.5 | G_m, b=pⁿ, lattice t^m | E_b=O(−n); modification degree −n−m, zero iff m=−n | holds | — |
| 6.6 | torus | nonempty iff κ(b)=(µ⁻¹)^♮ (HKII line 1968) | holds | — |
| 6.7 | X=Y=Spd C | H⁰=F_ℓ⊗F_ℓ=F_ℓ (HKII lines 2052–2062) | holds | — |
| 6.8 | torus | locus Spd Q̆_p([µ]), a point; wrong κ gives empty (HKII Ex 7.5.7) | holds | — |
| 7.1 | order-2 character | monodromy −1, so no fixed global V-frame | holds | — |
| 7.2 | constant unit | weight 0, abelian | holds | — |
| 7.3 | Borel GL_2, (1,0); torus | Levi Newton diag(1,0) not central in B, so empty; torus gives a point | holds | — |
| 7.4 | Q_p(−n); Fil^a; n=−1 | Fil^n⊂Fil^a iff n≥a; Fil⁻¹⊄Fil⁰ while B⁺⊂Fil⁰ | holds | — |
| 7.5 | S=Spa L | s∈Fil^{−n}V_L gives s⊗Fil^n⊂M₀ (HKII line 1755) | holds | — |
| 7.6 | torus; weight −2 | torus gives a point; −2 fails ≥−1 | holds | — |
| 8.1 | Tate index n | ℓ⊗Fil^n=L_et, so the locus is the whole base | holds | — |
| 8.2 | f=id, g=1 | identity map | holds | — |
| 8.3 | T⊂SL_2, odd µ | T class 1∈Z/2 nonneutral; pushforward neutral (B(SL_2)_basic={1}) | holds | — |
| 8.4 | torus; weight 2 | special point; weight 2 excluded | holds | — |
| 8.5 | LT height 2, F/Q_p quadratic | special points form a D^×-orbit ≅ P¹(F) (both of Q_p-dimension 2) | holds | R06 |
| 8.6 | Borel b=diag(p,1); GL_3 parabolic | L_[a:c]: G-adm iff a≠0, B-adm iff c=0, so [1:1] separates; b=diag(1,p): A¹ cell all B-adm, G-adm=P¹∖[1:0]; GL_3 type (1,0,−1) at z=1 and z=0, Levi (1,−1;0) vs (0,0;0) | holds | — |
| 9.1 | G_m | frame fibre Q_p^× | holds | — |
| 9.2 | diagonal (a_i) | flags of types µ⁻¹ and µ | holds | — |
| 9.3 | identity data | identity | holds | — |
| 9.4 | mirabolic, µ=(1,1,−2) | Lie weights {0,1,−2}: ≤1 holds, ≥−1 fails; µ^♮=0, b=1 (HKII Ex 8.4.4, line 2386) | holds | — |
| 9.5 | GL_4, (1,1,0,0) | Lie weights {−1,0,1}, so subgroups lie in [−1,1] and the notions agree | holds | — |
| 9.6 | G_m, b=pⁿ | dual b⁻¹=p⁻ⁿ, µ ↦ µ⁻¹ (HKII Thm 8.5.1, line 2412) | holds | — |
| 9.7 | torus | X_[µ] is a point, the b⁻¹-admissible locus of T | holds | — |
| 10.1 | two CM points, T1≠T2 | ⟨T1,T2⟩=GL_2 while MG_i=T_i, so the converse is false (HKII Lemma 9.3.3, line 2652, overstates) | holds | — |
| 10.2 | constant family | exceptional locus empty | holds | R03, R04 |
| 10.3 | residue field F_q | x∈O_L gives |x^q−x|≤|π|; Gauss value 1; U∩{|π|≤|x^q−x|²} needs |π|≤|π|², so empty | holds | — |
| 11.1 | {a,b}, A={a} | intersection {a}; the union model would give {a,b} | holds | — |
| 11.2 | torus special point | closed in both structures | holds | — |
| 11.3 | empty index | closure M_C | holds | — |
| 11.4 | GL_2 (1,0) | rank of dπ = dim Fl = 1; weights ≥ −1 | holds | — |
| 11.5 | mirabolic (1,1,−2) | Hodge-special; HT side not rigid, so empty index and closure M_C | holds | — |
| 11.6 | point | reduces to HKI Thm B (HKII Rem 1.1.6, line 279) | holds | R05 |
| 11.7 | Lubin–Tate | π_HT of a component is open, hence dense | holds | — |
| 11.8 | Borel, diag(p,1) | HT image a point (HKII line 2504) | holds | — |
| 12.1 | order-2 character | weight 0, monodromy −1 vs 1 | holds | — |
| 12.2 | ordinary rank one | Z_p^× integral fibre; Q_p^× = Z × Z_p^× components | holds | — |
| 12.3 | Katz–Igusa | Z_p^× infinite profinite, not locally of finite type | holds | — |
| 12.4 | — | conditional on the uniformization gap; matches HKII §10.1 | holds | — |
| 12.5 | D ramified at p, split at ∞; B the reverse | M/O_p^× = ⊔_{p^Z}Ω; Γ⊂B^×(Q) (HKII lines 2924–2946) | holds | — |
| Summary | mirabolic (−1,−1,2), b=1 | Lie weights 0,−1,−1,2: HT-special holds, special fails | overclaim | R01 |

## Not verifiable

- The published versions (Alg. Number Th. 20 (2026); Invent. Math. 244 (2026)) were not opened. All locators use arXiv v2, as the manifest's `version_note` says, so no collation is asserted.
- Daniels–van Hoften–Kim–Zhang and Chambert-Loir–Loeser are named without locator and are not in the manifest; their texts were not read (R08).
- The secondary results HK rely on (Serre, Théorème 1; Gleason–Lourenço; Rapoport–Viehmann, Prop. 3.1) reach this roadmap only through the declared gaps or supplier contracts, and were not opened.
- Whether the arbitrary-field full-rank de Rham criterion has a published proof was not determined. It stays a declared contract.
- Ownership against open pull requests was checked through the roadmap index (`roadmaps grep`) for all 333 open heads, not by opening each checkout.

## Source issues

- **Gap** in HKII at proof of Theorem 7.2.3, printed p. 42: the proof invokes Liu–Zhu Theorem 3.9(iv), proved only over finite extensions of Q_p, for L ⊇ Q̆_p. It also uses Scholze's smooth de Rham formalism on a seminormal S. It should prove a full-rank de Rham criterion over arbitrary p-adic L and resolve S. Affects the proof.
- **Gap** in HKII at proof of Lemma 6.3.3, printed p. 38: the proof applies Theorem 3.3.1(3), which is stated for smooth X, to a seminormal rigid S. It should use the rigid-source form of Theorem 5.0.4(4), or resolve and descend. Affects the proof.
- **Error** in HKII at Remark 7.5.3, printed p. 47: with b_H=b_G=diag(p,1), the remark says the preimage of the ambient admissible locus is the subgroup-admissible locus and gives A¹≅A¹. In fact [1:1] is ambient-admissible but not Borel-admissible. The A¹ statement needs b=diag(1,p). Affects a stated result.
- **Misprint** in HKII at Proposition 7.3.3, printed p. 43: the rigid analytic point is asserted in the whole type cell. It should be asserted in the b-admissible part of that cell. Affects nothing.
- **Gap** in HKII at proof of Lemma 9.3.5, printed p. 60: the Gauss-point step relies on an algebraically closed residue field, but L ⊇ Q̆_p need not have one. An infinite residue field suffices to avoid the zeros of a nonzero residue polynomial. Affects the proof.
- **Misprint** in HKII at §10.1, printed p. 64: the crystalline-frame cover is set equal to the Katz–Igusa tower, but the former is a Q_p^×-torsor and the latter a Z_p^×-torsor. The tower should be its integral reduction, with S̃_cris = S̃ ×^{Z_p^×} Q_p^×. Affects nothing.
- **Misprint** in HKI at proof of Theorem 5.1.6, printed p. 42: the weight-w summand is indexed by the slope −w/2 piece of W. It should be the slope w/2 piece, since weight is twice the Newton slope. Affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "37bbd60", "job": "REV-PKG-AdmissiblePairsAndPadicHodgeStructures", "model": "opus", "worker": "fable-rev52"} -->
