# Review of FiniteFlatGroupsAndIntegralPadicHodgeTheory (pull request #879 at 1a17d7d)

**Verdict:** needs changes

## R01 (P1) — The automatic eigenline assertion needs rank q

**Location:** `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:2123`: “the condition `(**)` holds automatically when `S` is connected with an étale or multiplicative fibre”.

**Claim:** An F-action and this fibre condition imply Raynaud's eigenline condition without a rank hypothesis.

**Witness:** Take F=F₃ and constant F₃² over a characteristic-zero splitting field. Its eight nonzero points give four scalar orbits and augmentation eigenrank 4≠1. README:2150 itself supplies this counterexample.

Raynaud Prop.1.2.2 assumes rank q (`raynaud-1974` lines 241–251, p.247). **Repair:** Insert “of rank q”, as the API at README:2134 already does. Constant F₃ then has one orbit and eigenrank1; F₃² is excluded by rank9≠3. Keep that negative control.

## R02 (P1) — The perfect-residue ramification prerequisite is not supplied on main

**Location:** `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:386`, also :8210: “Consume LocalFieldsRamification Layers 3–4's input contract `perfectResidueHerbrand`.”

**Claim:** This supplies Herbrand theory, the different, Hasse–Arf and completed maximal-unramified comparison for arbitrary perfect residue fields.

**Witness:** Main `TauCetiRoadmap/LocalFieldsRamification/README.md:786` imports the local-field filtration. Pinned `TauCeti/NumberTheory/LocalField/RamificationGroup.lean:91` requires `IsNonarchimedeanLocalField`. Main has no `perfectResidueHerbrand` contract.

K=Frac W(F̄₃) is not locally compact. Nevertheless L=K(ζ₃) must be covered: e=2, different exponent1, tame upper break0. The open revision adds the general contract, but revisions of existing roadmaps are not eligible suppliers here. No declared gap exists. The index also did not resolve a LocalFieldsRamificationPartII source.

**Repair:** Keep arbitrary perfect residue fields. Assign the extension to an eligible owner with an exact section, or declare precise supplier gaps in the design and README; until then, own the missing target here. Preserve the imported finite-residue case. Test the contract on this infinite-residue tame extension, including completion comparison.

## R03 (P1) — Unit-filtration reciprocity is an undeclared supplier extension

**Location:** `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:394`: “Layer 7 (the local Artin map and unit-filtration reciprocity”; also :458–462 and the dependency gate.

**Claim:** ClassFieldTheory on main supplies Art_K(U_Kⁿ)=Gal(L/K)ⁿ, including n=0, and absolute density.

**Witness:** Main `TauCetiRoadmap/ClassFieldTheory/README.md:1312`–1431 gives Artin maps, norm compatibility, cyclotomic normalization and conductor minima, but no filtration-image theorem. That theorem is added in its open revision.

**Repair:** Keep main citations for the actual Artin-map results. Assign the missing theorem to an eligible extension or declare precise gaps, then update its trace/Sen consumers. Test Q₃(ζ₉)/Q₃: image orders at n=0,1,2 must be 6,3,1; for an unramified extension the n=0 image is trivial. No matching gap is declared.

The gate's blanket UPWARD edge is a false positive for existing main-branch Artin/global reciprocity inputs. It does not fill this missing extension. Its exact refusal-to-move diagnostic appears below; the tooling and order were not changed.

## R04 (P2) — Import the earlier Sen and Cohen-ring constructions

**Location:** `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:1578`: “construct the finite-dimensional Sen module”; also :1604–1610 and :5568–5578: “This target restates those statements”.

**Claim:** Labelled Sen/local character theory and the general Cohen-ring equivalence are new targets here.

**Witness:** Earlier `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:256`–265 constructs labelled Sen/local algebraicity. `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:3754` owns the same arbitrary-field Cohen equivalence and reduction API.

**Repair:** Import these by section and remove duplicate constructions. Retain the Kummer-frame comparison, tensor-order adapter and global/lifting applications. Finite coefficients do not distinguish the Sen target. Common controls agree: Θ(χ)=1, Θ(χ⁻¹)=−1, logχ gives a nonzero nilpotent operator; Cohen fixed vectors are Z_p for φ=1 and0 for φ=p.

## R05 (P2) — Three structure signatures lose coefficient hypotheses

**Location:** `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/Suggested.lean:128`, :188, :270; compare section variables at :124, :182, :259.

**Claim:** These are classical modules over Witt vectors of a perfect characteristic-p field.

**Witness:** `#check @...` shows `DieudonneModule`, `FLModule`, `TorsionKisinModule` and their Hom/categories retain `Field k` and prime p, but neither `CharP k p` nor `PerfectRing k p`.

The carriers therefore admit k=Q,p=2. Witt Frobenius shifts ghost coordinates on W(Q), so is not invertible and cannot support the stated σ⁻¹ interpretation. The classification theorems themselves retain the assumptions.

**Repair:** Bind both assumptions explicitly on the structures/APIs, or separately document broader carriers and restrict the named classical ones. The explicit-binder repair elaborated in scratch with all seven headlines unchanged: all three signatures now retain the assumptions. F_p is admitted, Q at p=2 excluded.

## R06 (P3) — Delete the nine HTML anchors rejected by the gate

**Location:** `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:2705`, :2745, :2774, :2810, :2842, :2898, :2940, :2967, :2997; example `<a id="admissible-global-models"></a>`.

**Witness:** The `residue` gate reports these nine lines; all nine remain present.

**Repair:** Delete the anchors and use Markdown heading links. This removes the nine reported matches while preserving the headings. Rerun the full gate, including the dependency issue in R03.

## R07 (P3) — Remove absent Lean names from API bullets and Checks

**Location:** `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:584`, :638, :6175: `frobeniusHom`, named Frobenius Checks and `BreuilModule.frob`.

**Witness:** These claim this roadmap's Lean declarations, but all three have zero matches in the acceptance-file declaration inventory.

**Repair:** State absent API targets and all Checks in prose; retain code names only for actual declarations or identified suppliers. Do not pad Suggested.lean with these lemmas. Also add the prescribed layer comments/module title there and the missing closing Examples/Dependencies subsections of Layer R07.G. The mathematical Checks remain in the README.

## R08 (P3) — Correct the sampled locators and crystalline supplier name

**Location:** `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:757`, :438, :8705, :166.

**Witness:** `stix-2012` lines 2197,2549 give Theorem44 p.42 and Theorem54 p.48. `illusie-1985` lines 1181–1210 give Cor.4.8 pp.180–181. AbelianSchemesAndArithmeticModuli §A4.CR.7.2 names `DieudonneCrystal.evaluate` in its own namespace.

**Repair:** Replace “Proposition44”, “p.46”, the Cor.4.8 pagination, and stale `LogCrystalline.dieudonneEvaluation`/CrystallineCohomology namespace claims accordingly. The statement hypotheses stay intact; constant and multiplicative crystal evaluations remain (W,σ) and (W,pσ).

## Verified sound

Reviewed the 9,029-line README and 342-line Lean file at the requested head. No outside-folder diff or PR edits; no good-prime shortcut, algorithm, sorry-defined data, `set_option`, copied passage or roadmap import found.

**Build, signatures and padding.** The targeted build and direct Lean elaboration passed with seven sorry warnings. All 30 declarations/instances were checked with `#check @name`: theorem hypotheses survive; R05 identifies three structures' dropped binders. All seven admissions resisted `rfl`, `simp` and `infer_instance`; pinned searches found no single proving lemma. No padding finding. The explicit-binder repair elaborated with all seven headlines unchanged.

**Headline inventory.** README:41–50 covers period realizations; Frobenius/étale dictionaries and rigidity; BT recognition, formal groups, Hodge–Tate and generic fibres; Raynaud/Oort–Tate classification, inertia and embeddings; global rank-one models, Ext, purity and dyadic amalgams; Dieudonné theory, slopes, crystals and universal covers; Fontaine–Laffaille realization/classification; Kisin, crystalline/semistable and all-weight classifications/descent; elliptic residual types, finite-flat representations and Serre weights; abelian torsion, ramification, deformations and determinants.

Seven are stated in Lean: Raynaud uniqueness/full faithfulness, global prime order, finite Dieudonné, odd-prime Fontaine–Laffaille, all-prime Kisin, and Fontaine's different bound. The docstring identifies missing BT, crystal, period, formal-group, vector-scheme, global-model, Robba, labelled-realization and extension-category carriers. The different bound is an endpoint, not a substitute for upper numbering.

**Pinned objects opened.** Mathlib pin `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Pinned file and line | What was checked |
|---|---|
| `TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean:74` | Native object property includes finite, flat, locally finitely presented and commutative; it does not assert étaleness or constant rank on a disconnected base. |
| Same file, lines 131, 271, 307, 331, 404 | Native category, dual equivalence, coordinate Hopf algebra, Cartier dual and biduality; the roadmap uses these carriers. |
| `TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/BaseChange.lean:90` | Base-change functor; coordinate and dual comparisons at lines 198 and 206. |
| `TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/Constant.lean:54` | Diagonalizable construction, constant construction at 94, dualities at 133 and 163. |
| `TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/Rank.lean:46` | Rank-at-stalk comparison; line 56 preserves the entire rank function under duality, with no extra base hypothesis. |
| `Mathlib/RingTheory/WittVector/Isocrystal.lean:113` | Invertible semilinear Frobenius; no finite-dimensionality field in the class itself. |
| Same file, lines 157 and 180 | Standard rank-one model and classification requiring algebraically closed k and dimension 1. It is not full Dieudonné–Manin. |
| `TauCeti/NumberTheory/LocalField/RamificationGroup.lean:91` | Local-field assumptions on the high-level filtration, as used in R02. |
| `Mathlib/NumberTheory/LocalField/Basic.lean:45` | `IsNonarchimedeanLocalField` includes local compactness, not merely completeness and a discrete valuation. |

Additional primary comparisons: `fontaine-1985` lines 92–200, §§1.1–1.5, pp.517–519, support the normalization and approximate-embedding calculations. `fontaine-1990` lines 345–446, A.1.2.6–7, pp.257–260, support the Cohen equivalence, with the finite-p-basis restriction explicitly declared inessential there. `panny-robert-sferlazza` lines 1795–1807, Appendix B, p.36, retain the σ-twist in the BBM comparison; this is secondary evidence for that unread book.

**Resolved ownership.** Object searches used `roadmaps show`/`grep`, main, supplied open heads and board packages. No kept fully qualified Lean name duplicated another roadmap. Cartier duality/rank-one isocrystals are imported; integral classifications belong here; R04 identifies Sen/Cohen overlap. Existing-roadmap revisions were not used as main. Open PRs without supplied files were not independently inspected.

| Supplier (README locations) | Resolved input |
|---|---|
| ModularCurves, main: 280,345,375,386,1510 | 0B–0E group schemes, quotients, Galois dictionary, descent; 7E elliptic tower and connected–étale sequence. |
| EllipticCurves, main, Layers 4–5; ProfiniteCohomology, main:1363 | Tate curves/twists; Hilbert 90/Kummer using a separable closure. |
| LocalFieldsRamification / ClassFieldTheory, main | Finite-residue ramification and Artin maps; expanded contracts fail R02–R03. CFT:1368 gives the arithmetic inverse-norm sign. |
| SchemeAndStackFoundations, main:1086,1825,5066,5194,5403 | §§0.14,0.29,4.1,4.4,4.8: henselian lifting, Frobenius, infinitesimal criteria, Schlessinger and complete-Noetherian effectivity. |
| EtaleCohomologyFoundations, main:200; DerivedModuleAlgebra, main:815,1018 | F.0.2 Galois categories with connectedness/nonemptiness; F.10 Frobenius. Cotangent complex §§0.4,0.8. |
| RestrictedPowerSeries, main:704; PurityOfBranchLocus, main:319,357 | §7.1 open-disc algebra (not all coefficients bounded); §§2.1–2.2 purity with normal source. |
| GlobalNumberFields, main:143,502; PerfectoidSpaces, main:4040,4292,4525,4611,4652 | Hecke/infinity types; P1.6,10,16–18 tilting, perfectoid fields, Fontaine map/kernel. |
| AdicSpacesPartIII, main:7714–7801 | R2.9: locally noetherian FSC, Berthelot generic fibre, open formal disc and base change. The bounded-functions theorem itself remains here. |
| AbelianSchemesAndArithmeticModuli, new open:1938–2003,2060 | A3.2 multiplication; A4.5/5a BT carriers; A4.CR.7.2 crystal and Grothendieck–Messing. Stale name: R08. |
| CrystallineCohomology, new open:6530; CR.7.1,7.3 | Full slope classification on native isocrystals, perfect-field descent, twists/direct images. |
| PadicPeriodRings, new open §§1.3,2,4.1–4.3 | Trace/Sen and general-base periods; its text also consumes the missing R02–R03 contracts. |
| NoncommutativeAndEquivariantIwasawa, new open:3725–3776 | F.6 period boundaries, Cohen equivalence, Robba/slope theory; x−y,1−φ,v_p(p)=1 agree. |
| PadicLocalLanglandsForGL2Qp, new open:245–273; §§0.3,2.7–2.8 | Filtered modules, admissibility, Sen/characters; ramification dictionary and Serre-weight/Hecke conventions. |
| Earlier arithmetic/PD inputs | ArithmeticGaloisRepresentations §§1.1–1.5,2.3,6.1,7.6; ArithmeticGaloisDuality R02.1.2,2.3a; DerivedDeRhamCohomology §0.20,PD.1–7; SmoothRepresentationsOfLocalGroups SR.2: named contracts located. |
| CyclotomicClassGroupsAndStickelberger, new open:1060 | §§0.2–0.3,2.1–2.5,3.1–3.2,8.1–8.3: integral annihilator, inverse-character vanishing and covariant ideal action; finite-flat Ext remains here. |

**Dependency check (verbatim diagnostic):**

```text
not movable: FiniteFlatGroupsAndIntegralPadicHodgeTheory consumes ClassFieldTheory (#253) and is consumed by AbelianSchemesAndArithmeticModuliPartII (#112), which comes first: moving FiniteFlatGroupsAndIntegralPadicHodgeTheory after ClassFieldTheory would put a supplier after a consumer, a cycle through FiniteFlatGroupsAndIntegralPadicHodgeTheory
UPWARD: FiniteFlatGroupsAndIntegralPadicHodgeTheory (#50) -> ClassFieldTheory (#253) at README lines [379, 394, 1618, 2467, 2683, 2791]
depcheck: 158 roadmaps, 1104 edges, 1 problem(s)
```

The gate **FAILS**: `residue=9`, `depcheck=1`, `build=0`; every other scanner count is zero. R06 covers residue; R03 qualifies the dependency failure against main. README:6643–6648 orders marked deformation before cyclotomic descent without a determinant cycle.

**Seeded source audit: 15 targets.** Fourteen were compared with readable text/scans; the Faltings/Kisin pairing remains uncertified. No locator was explicitly flagged “unverified”. These checks establish source support, not completed formal proofs.

| Sampled target | Source witness and outcome |
|---|---|
| Special-fibre types / ordinary count | `stix-2012` lines 2045–2057,2098–2114,2175–2189,2197–2214,2549–2562; Prop.37,40, Cor.43, Thm.44,54. Connected–étale and multiplicative dictionaries support the argument together with Raynaud Cor.3.3.6. The small-e and unramified-quotient assumptions are retained. R08 corrects the page/type of locator. |
| Global rank one | `mazur1977` lines 759–786, I Prop.1.5, pp.46–47. The ramification/marked-model scope is retained; over Z the two prime-order models are constant and multiplicative. |
| Global Ext vanishing | `mazur1977` lines 881 onward, I Prop.2.1 and its class-group proof, pp.49–54; lines 1254–1276 for the filtration consequence. Direction is Ext(μ_l,Z/l), base Z, not Z[1/P]. Devissage and the separate inverse-character supplier are identified. |
| Odd global purity | `mazur1977` lines 1201–1214 and 1254–1276, I Props.4.1,4.5, pp.58–60. Oddness is essential, and both mixed Ext directions enter splitting. |
| Dyadic D | `mazur1977` lines 1215–1253, I Props.4.2,4.4 and (4.3), pp.58–59. Killed-by-two, Q(i), marked generic-model rigidity and the nonsplit direction match. |
| Dyadic amalgam | `mazur1977` lines 3962–3985, II §17, pp.130–131. The source application has Jacobian context; the general pushout here additionally uses the explicitly supplied finite-flat quotient, with its kernel and ranks computed below. |
| Crystalline morphisms on tubes | `de-jong-1995` lines 1690–1776 and 1790–1812, §5.3 (5.3.2)–(5.3.7), pp.54–55; §5.4.1, pp.56–57. Cohen/Frobenius lifts, completed PD evaluation, the p⁻¹FV recurrence and pointwise evaluation match. |
| Bounded formal functions | `de-jong-1995` lines 2985–3010, Thm.7.4.1, pp.90–91; `de-jong-1998` lines 25–43. Flatness, formal normality and the corrected Artin–Rees construction are retained. |
| Formal lifting locus | `de-jong-1995` lines 3021–3045, Prop.7.5.2, pp.91–94, and lines 2163–2192, §5.7–5.8. Matching ideals, simultaneous versality, the dyadic case and the torsion-error clause are retained; the two tubes are not assumed an admissible cover. |
| Crystalline comparison for BT groups | README:6192–6211 cites Faltings Thm.7 and Kisin Lemma2.2.4. Unit/multiplicative normalizations were computed, but these primary texts could not be read through the service; see Not verifiable. |
| Crystal/window equivalence | `caislau-2017` lines 430–472,529–555,592–706: Def.2.4.1, Props.2.5.2,2.6.4,2.7.1,2.7.3, Cor.2.7.4, pp.10–17. Admissible filtration, p>2, complete regular relative base and auxiliary Frobenius restrictions agree. Prop.2.5.2 alone would not give the equivalence. |
| Strict actions/connections | `caislau-2017` lines 798–834,890–942: Lem.3.1.10, Prop.3.2.2, Lem.3.3.3, Prop.3.3.4, Cors.3.3.5–6, pp.19–23. The p^r logarithm factor and the split treatment of du and dt_i agree. |
| Effective intermediate descent | `caislau-2017` lines 972–1002: Lem.3.4.4, Prop.3.4.5, Cor.3.4.6, pp.23–24. Triviality on the special fibre, rather than generic descent alone, is the effectivity condition; the proof uses marked universal deformation. |
| Multiplicative Tate parameter | `serre-1972`, printed pp.276–277, §1.12, Prop.13 and footnote3, inspected as a scan. The unique positive-valuation q, v(q)=−v(j), and unramified splitting extension of degree ≤2 are explicit there. No OCR line numbers are available for these pages. |
| Marked universal deformation | `illusie-1985` lines 797–834 and 1105–1210: Thm.4.4, Cor.4.7, Cor.4.8. Full-tower rigidity and unobstructedness support the tangent calculation; Cor.4.8 itself assumes perfect k. The README explicitly derives the arbitrary-k form over R using the resolved Schlessinger and complete-Noetherian effectivity contracts. R08 corrects pagination. |

**Adversarial values: 219 rows.** Values/maps test both sides and wrong models. Pass means the instance agrees, not a general proof; uncertified marks unread sources. “Pass” requires no change. Target numbers below omit the common R07 prefix.

| Statement | Instances tried; computed values on the two sides | Result; repair |
|---|---|---|
| Native finite-flat carrier; rank; PGroup | Over F₃: constant Z/3 has rank 3 and 3 points; μ₃ has rank 3 and 1 point. Identity group has rank 1=3⁰; S₃ is excluded by commutativity. | Pass |
| IsEtale and base change | μ₃/F₃: étale=false; μ₃/Q₃: true. Constant Z/3: true on both fibres. | Pass |
| Prolongation and markings | A constant F₃²-model has GL₂(F₃) of order 48 automorphisms; an automorphism extending the fixed generic identity is uniquely 1. | Pass |
| Absolute ramification index | Z₃,p=3: 1; Z₃,p=2: 0. F₃[[t]],p=3: valuation ∞ becomes 0 under toNat; CharZero excludes it from Raynaud. | Pass |
| KilledBy | On constant Z/9, [9]=0, [3]≠0; on the identity group both maps are 0. Convolution power equals unit exactly in the killed case. | Pass |
| 1.1 relative F,V | Over F_p: Z/p has (F,V)=(1,0), μ_p=(0,1), α_p=(0,0); in every case FV=VF=0=[p]. | Pass |
| 1.1 flat-affine extension | G_a: F(x)=xᵖ,V=0; G_m: F=[p],V=1. For F₂² symmetric tensors have invariant dimension 3, norm quotient dimension 2. | Pass |
| 1.2 étale/Galois dictionary | Separably closed k: π₁=1, constant Z/3 gives a 3-element module. Nontrivial unramified sign action on F₃ gives 1 rational point, 3 geometric points. | Pass |
| 1.3 finite part | Remove nonidentity closed sections of constant Z/3 over Z₃: generic points=3, finite-part points=1, closed points=1. Already finite constant model: finite part has 3 points. | Pass |
| 1.3 special-fibre types | Z/p: étale/unipotent; μ_p: connected/multiplicative; α_p: connected and dual-connected. Duality exchanges (F,V)=(1,0),(0,1). | Pass |
| Ordinary counting identity | μ_(pⁿ)×Z/pᵐ with W=μ_(pⁿ): [M:W]=pᵐ=#special points; pure μ gives 1=1. | Pass |
| Ordinary count negative controls | Supersingular E[p], W=0: index p², special count 1; unramified quotient fails. Over Z₂, μ₂ and Z/2 have special counts 1 and 2; 1<2−1 is false. | Both excluded as required. |
| 1.4 rigidity | End(μ_p)=Z/p survives nilpotent thickening. On α_p over k[ε], scalings 1+cε all reduce to 1; α_p is not multiplicative. | Pass |
| 1.5 torsion levels | Height h, indices v,t: p^(h(v+t))=p^(hv)p^(ht); h=0 gives 1=1. A constant tower of order p fails rank at level 0 and 2. | Pass |
| 1.6 tower maps / effectivity | μ_(pⁿ) transitions include roots; a compatible scalar a∈Z_p acts by a mod pⁿ. Identity scalar 1 gives identity at every level; 0 gives zero. | Pass |
| 1.7 dual tower | Dual of μ_(pⁿ) is Z/pⁿ; dual transition is reduction. Inverse limit of reductions is Z_p, while the inclusion direct limit is Q_p/Z_p. | Pass |
| 1.8 Tate module and pairing | T_p μ_(p∞)=Z_p(1), T_p(Q_p/Z_p)=Z_p; evaluation pairs these into Z_p(1). Height 0 gives module 0. | Pass |
| 1.9 connected–étale tower | Ordinary elliptic height 2: connected/étale heights (1,1); supersingular: (2,0). Rank products pⁿ·pⁿ=p²ⁿ and p²ⁿ·1=p²ⁿ. | Pass |
| 1.10 exact recognition | In 0→α_p→E[p]→α_p→0 for supersingular E, middle is BT₁, outer terms are not: im F=0≠ker V=α_p. | Pass |
| 1.11 coLie / fibre recognition | μ_p: coLie=[R --p→ R]; over Z/p², ω=R/p is not free. Over F_p, dim ω=1. | Pass |
| 1.12 formal groups | Formal G_m in characteristic p has [p](X)=Xᵖ and height 1. Formal G_a has [p]=0, not a finite isogeny. Dimension-zero formal group has height 0. | Pass |
| 1.13 connected BT/formal equivalence | Formal G_m recovers μ_(p∞), dim=height=1; Q_p/Z_p has connected part 0 and is outside connected equivalence. | Pass |
| 1.14 dimension | μ_(p∞), Q_p/Z_p, supersingular elliptic BT have dimensions 1,0,1, respectively. Geometric p-torsion points have counts 1,p,1. | Pass |
| 1.15 dual dimension | μ and its dual: 1+0=1; supersingular self-dual height 2: 1+1=2; zero: 0+0=0. | Pass |
| 1.16 discriminant | μ_(pᵛ) over Z_p has discriminant valuation v·pᵛ; constant Z/pᵛ has 0. At v=0 both give 0. | Pass |
| 1.17 differentials/different | μ_(pᵛ) over ramification-e DVR: length ω=ve; absolute different generated by pᵛ. Constant group: length 0, unit different. | Pass |
| P2 periods | For t: θ(t)=0, φ(t)=pt, g(t)=χ(g)t. For 1: θ(1)=1, φ(1)=1. | Pass |
| P3 period sequences / boundaries | Pullback diagonal x↦(x,x) followed by x−y gives 0; companion first component gives (1−φ)x. For V=0 both cohomology boundaries are 0. | Pass |
| P3 e versus f | Trivial Q_p over finite K: H¹_e=0, unramified H¹_f has dimension 1. Replacing e by f would change 0 to 1. | Pass |
| P4 fixed fields / dimension | Trivial rank-one representation has D_cris=K₀, dimension 1=rank; zero representation gives dimension 0=0. | Pass |
| P5 de Rham/crystalline filtration | Q_p(1): covariant φ=p⁻¹σ, jump −1; dual realization φ=pσ, jump +1. Zero gives zero filtered space. | Pass |
| P5a integral predicates | Z_p(1) has interval [1,1], its mod-p quotient is torsion crystalline in that interval; Z_p has interval [0,0]. | Pass |
| P7.1 coefficient adapter | e⊗t⁻¹ maps to t⁻¹⊗e, jump −1 on both sides; embedded Lubin–Tate character has labelled weights (1,0,…), not all 1. | Pass |
| P7.2 Sen | χ and χ⁻¹ give operators 1 and −1; logχ extension gives [[0,1],[0,0]], eigenvalues (0,0), not semisimple. | Correct test; ownership repair R04. |
| P7.3 local/global characters | Arithmetic Artin sends χ(u) to Norm(u)⁻¹, giving weight +1; unramified Frob↦1+p has Sen 0 and infinite image. A square-root character has weight 1/2, not integral. | Pass |
| P7.4 tensor irreducibility | ρ′=ρ gives V⊗V=Sym²V⊕Λ²V, dimensions 3+1=4; equal weight gaps violate the hypothesis. | Pass |
| P7.5 projective lifts | Elliptic weights (0,1), determinant-finite twist: (−1/2,1/2); Sym² weights (−1,0,1), determinant weight 0. | Pass |
| 1.19 Hodge–Tate BT decomposition | μ: weight 1 multiplicity 1; étale: weight 0 multiplicity 1; ordinary product: one of each, total 2. | Pass |
| 1.20 schematic closure | A subgroup of generic order p has finite-flat closure rank p. Over Z_p[ζ_p], the graph of constant Z/p→μ_p keeps rank p despite a nonreduced special fibre. | Pass |
| 1.20a finite-subgroup quotient | μ_(p∞)/μ_p≅μ_(p∞); the quotient map on T_p has index p, while both heights equal 1. | Pass |
| 1.21 shifted closures | Whole and zero generic BT subgroups need shift 0; their heights are h and 0. Finite initial discrepancies are removed by the allowed p-power shift. | Pass |
| 1.22 Tate generic full faithfulness | End of each height-one BT over Z_p and of its integral generic Tate module is Z_p; rationalized endomorphisms are Q_p. | Pass |
| 1.23 simple groups | Z/p is simple of rank p; Z/p² contains order-p subgroup and is not simple. Identity object of rank 1 is excluded from “simple”. | Pass |
| 1.24 model order / Hopf order | Over Z₂, Z/2→μ₂ is a generic isomorphism but not an integral isomorphism; coordinate inclusions reverse the group-model order. | Pass |
| 1.24a point realization | Constant Z/3 has 3 geometric points with trivial action; μ₃ over Q₃ has 3 with cyclotomic action. Both forget to cardinal 3 but are different Galois modules. | Pass |
| 1.25 all-level extension | The compatible μ_(pⁿ) models give a height-one extension; ranks pⁿ and maps [p] satisfy exactness. Merely repeating μ_p gives rank p at level 2 instead of p². | Pass |
| 1.26 tame characters | Level 2 norm exponent p+1 gives θ₂^(p+1)=θ₁; for p=3 this is exponent 4. Level 3 Frobenius rotation uses exponent p² in the inverse rotation. | Pass |
| 1.27 Raynaud eigenlines | Constant F₃: eigenrank 1; constant F₃² with scalar F₃-action: eigenrank 4. Automatic assertion would require 4=1. | Fails; add rank q, R01. |
| 1.28 Raynaud parameters | Unramified rank-p examples have exponent 0 (étale) or e=1 (multiplicative); duality swaps these endpoints and preserves product parameter w_p. | Pass |
| 1.29 Jordan–Hölder | An irreducible tame F_p-module of dimension r has endomorphism field F_(pʳ), hence cardinal pʳ and rank one over that field. A direct sum of two trivial lines is not irreducible. | Pass |
| 1.30 uniqueness theorem | p=3,e=1: 1<2, unique marked model; p=2,e=1: 1<1 false, μ₂ and Z/2 are distinct models. | Pass |
| 1.30 full faithfulness | Same-model generic and integral endomorphisms of Z/3 are both F₃. At Z₂, generic Hom(μ₂,Z/2) has 2 maps, integral Hom has 1. | Pass |
| 1.31 boundary simple models | Over Z_p[ζ_p], simple trivial generic line has constant and multiplicative models. For two copies, constant², constant×μ and μ² give at least 3 models. | Pass |
| 1.32 tame exponent bound | Constant line has digit 0; μ_p has digit e. For p=3,e=1, both digits lie in [0,1]. | Pass |
| 1.33 determinant/different | Constant order-p: length ω=0, determinant 1=θ⁰; μ_p: length e, determinant θᵉ. | Pass |
| 1.34 Oort–Tate | p=2,(a,b)=(1,2): 1⋆1=1+1−2=0. Wrong plus gives 4 with 4²≠4. (2,1) gives μ₂. | Pass |
| 1.34 lift obstruction | α_p would require both a,b in the maximal ideal of an unramified DVR: v(ab)≥2, but v(w_p)=1. | Pass |
| 1.35 global prime-order classification | Over Z at p=2: μ₂ and Z/2 have equal generic module but special counts 1 and 2. At odd p their generic characters are χ̄ and 1. | Pass |
| 1.36 Katz–Mazur | ε=1 gives split rank p²; p=2,ε=−1 gives rank 4, exponent 2, fibre t²+1 above 1. | Pass |
| 1.37 orthogonals | For perfect pairing on two rank-p factors and one factor M, M⊥ has rank p and quotient rank p=rank Mᴰ; zero/whole interchange. | Pass |
| 1.38 gluing | μ₂ and constant Z/2 agree generically but differ over Z₂; keeping the specified local model distinguishes special counts 1 and 2. | Pass |
| 1.39 Mayer–Vietoris | The zero comparison class gives the split extension; changing gluing by u gives generic matrix [[1,u],[0,1]]. Replacing u by 0 kills the connecting class. | Pass |
| 1.40 abelian embedding | Over an algebraically closed characteristic-p field, μ_p embeds in ordinary E[p], α_p in supersingular E[p]; rank p≤p². Identity embeds as zero section. | Pass |
| 1.41 p-complete flat descent | Identity cover descends μ_(pⁿ) to itself, rank pⁿ on both sides; zero group to zero, rank 1. A nonfaithful empty cover cannot detect a nonzero object. | Pass |
| G1 marked global models | Constant Z/l: maximal retained fibre has l elements, minimal has 1; generic fibre has l for both. Zero group has one model. | Pass |
| G2 geometric lengths | Full constant (length,δ,α)=(1,0,1); minimal constant=(1,1,1); full μ_l=(1,0,0). Zero=(0,0,0). | Pass |
| G3 cohomology bound | Full constant: h¹−h⁰=−1=δ−α. μ₂: 1−1=0=0−0. Minimal μ₂ at P=5: 1≤1; at P=3: 0≤1. | Pass |
| G4 global rank one | Constant and μ_l have length 1; at l=2 their special étale lengths are 1 and 0 despite the same generic character. | Pass |
| G5 class-group obstruction | l=3: −1≡1 mod2, exceptional component vanishes. l=5: B₂=1/6 is a unit, inverse action of 2 is 3; 5L₁≡−1. | Pass |
| G5 Ext vanishing | Over Z, Ext¹(μ₂,Z/2)=0. Reversed Ext has nonzero killed-by-two class D; zero source/target gives Ext=0. | Pass |
| G5 admissible filtration | D over Z₂ has connected rank 2 and constant quotient rank 2, total rank 4; no splitting is asserted. | Pass |
| G6 odd purity | Z/3ᵃ×μ_(3ᵇ) has trivial inertia at P≠3 and product rank 3^(a+b). Cubic unipotent action at P=7 has inertia order 3 and fails purity. | Pass |
| G6 dyadic exclusion | D has trivial inertia at odd P and an integral model, yet its extension class is nonzero. Thus purity=false while extendability=true at l=2. | Excluded by oddness. |
| G7 D-model | Generic field Q(i), rank 4, exponent 2; special F₂ fibre μ₂×Z/2 has 2 points. Opposite two nonzero Ext classes have exponent 4. | Pass |
| G8 amalgam | M=μ₂: rank(M×D)/2=2·4/2=4, giving D. Rank-4 M: 4·4/2=8; special étale count 2. | Pass |
| G8 non-μ-type / zero | Nonconstant multiplicative rank-4 example at P=5 still gives rank 8, connected rank 4. M=0 has no μ₂ immersion. | Pass |
| 2.1 canonical decomposition | Over perfect k, Z/p, μ_p, α_p occupy étale, multiplicative-local and local-local factors respectively; unused factors have rank 1. | Pass |
| 2.2 filtration/splitting | Ordinary E[p]: ranks 1,p,p² in 0⊂μ_p⊂E[p], bi-infinitesimal quotient rank 1. Supersingular: multiplicative rank 1, bi-infinitesimal rank p². | Pass |
| 2.3 type loci | Order-p étale example has invertible F and zero V; multiplicative example zero F and invertible V; α_p has both zero. | Pass |
| 2.5 Dieudonné ring/module | Unit module over W(F_p): F=1,V=p, FV=VF=p; multiplicative: F=p,V=1; zero module: all maps zero. | Pass |
| Dieudonne Hom/category | Identity commutes with F,V; zero map does too. Composition of scalar 2 and 3 on W(F₅) is scalar 6 in either order. | Pass |
| 2.4 Witt kernels | W_n^m has rank p^(nm); n=m=1 gives α_p, rank p; geometric points=1. Killed by p iff min(n,m)=1. | Pass |
| 2.6 Dieudonné construction | Hom(μ_p,W_n)=0 for all n, whereas M(μ_p) has length 1. The separate dual treatment recovers it; the naive single Hom formula would give 0. | Pass |
| 2.7 descent | Constant line and its unramified sign twist become the same module over k̄; Frobenius descent acts by +1 versus −1. | Pass |
| 2.8 finite classification | Z/p, μ_p, α_p map to length-one modules with (F,V)=(σ,0),(0,σ⁻¹),(0,0); rank p=p¹. Zero length gives rank 1=p⁰. | Pass |
| 2.9 tangent comparison | On α_p, scalar a acts on Lie by a, on the compared dual quotient by aᵖ; σ* supplies that factor. Over F₉ choose a∉F₃: a³≠a. | Pass |
| 2.10 full BT classification | lim W_n(k)=W(k); étale and multiplicative height-one modules have W-rank 1. Zero tower gives rank 0. | Pass |
| 2.11 Lie/dimension | μ: M/FM=k, dimension 1; étale: M/FM=0. For M/VM these dimensions reverse. | Pass |
| 2.12 standard rank two | F=V=[[0,p],[1,0]] gives FV=pI and dim M/FM=1; diag(1,p) gives ordinary slopes 0,1. | Pass |
| 2.13 α-filtration | Supersingular E[p] has two α_p factors: ranks p·p=p². Constant Z/p has F bijective, so is outside biconnected category. | Pass |
| 2.14 elliptic modules | Ordinary slopes (0,1), a-number 0; supersingular slopes (1/2,1/2), a-number 1. Both have height 2, dimension 1. | Pass |
| 2.15 integral slope bounds | μ has slope 1; étale slope 0. Rank-one F=p² would require V=p⁻¹, not an integral endomorphism. | Pass |
| 2.16 slopes/a-number | Standard block F³=p has slope 1/3 and rank 3; rank-one slope 1/3 is impossible. End division invariant with the chosen variance is −1/3=2/3. | Pass |
| 2.17 isogeny classification | Over F_p, rank-one F=p and F=up (u≠1) have equal slope 1 but are not isomorphic isocrystals; algebraically closed base removes the unit twist. | Pass |
| 2.18 Witt constants | W(F_(p²))^(F=1)=Z_p; for k×k the fixed ring is Z_p×Z_p, not diagonal Z_p. For F_p, every vector is fixed. | Pass |
| 2.19 characteristic polynomial | Scalar σ-fixed t gives X−t over Z_p; empty matrix gives 1. Teichmüller ζ∉Z_p gives X−ζ and fails the conjugacy hypothesis. | Pass |
| 2.20 covariant comparison | At p=3, a∈F₉ with a²=−1 has a³=−a. Semilinear tangent map sends scalar a to −a; omitting σ would give a. | Pass |
| 2.20 normalized Frobenius | Covariant evaluation over F_p: étale F=p gives normalized φ=1 and fixed space Q_p; μ has F=1, normalized φ=p⁻¹ and fixed space0. | Pass |
| 2.21 Hasse invariant | Multiplicative BT₁: determinant V*=1; étale dim0: empty determinant 1; supersingular elliptic: determinant 0. | Pass |
| 2.22 Hasse–Witt duality | Ordinary group and dual have corank 0; supersingular elliptic and dual corank 1. Unequal dimensions can give unequal ranks despite equal coranks. | Pass |
| 2.23 BT stacks/polarizations | In char2, [[1,1],[1,0]] is skew-symmetric but not alternating: first diagonal entry 1. Family Δx=x⊗1+1⊗x+t x⊗x on x²=0 has μ₂ fibres for t≠0, α₂ at t=0. | Pass |
| 2.24 henselian lifting | μ_(p∞) and constant Q_p/Z_p lift with dimension-product 0; ordinary height2 has a one-dimensional family, so lifts are not unique. | Pass |
| 2.25 universal cover | Étale cover gives Q_p as sheaf, integral Tate sheaf Z_p; continuous maps Z_p→Z_p can have infinite image, unlike locally constant maps to discrete Z_p. | Pass |
| 2.26 nilpotent rigidity | μ_p over k[ε] has points 1+aε, but these do not form infinite p-divisible compatible chains; universal-cover infinitesimal contribution is 0. | Pass |
| 2.27 crystal tubes | Identity on constant or μ module: p⁻¹F·1·V=1 because FV=p; zero map gives 0 at every tube. | Pass |
| 2.27 bounded formal functions | Spf O gives O={x∈K: norm≤1}; on open disc Σtⁿ is bounded and lies in O[[t]], but not O⟨t⟩. | Pass |
| 2.27 normality/flatness controls | A=O⟨πt,t²⟩: bounded t exists generically but t∉A. Spf(O/π): formal sections nonzero, generic sections 0. | Both excluded by stated hypotheses. |
| 2.27 formal locus/descent | T=∅ yields Z_U; T=whole yields Z_T. The ideal (y) in O⟨x,y⟩ restricts and descends to (y), not merely its point set. Identity crystal gives whole lifting locus. | Pass |
| 2.27 de Jong classification | Constant/μ crystals have rank1, zero crystal rank0. On the node xy=0, a constant diagonal map extends unchanged; lci removes the torsion error. | Pass |
| 2.28 semiperfect comparison | Over F_p, End(Q_p/Z_p)=Z_p; after isogeny it is Q_p. Scalar p⁻¹ belongs only to the latter, not to integral Hom. | Pass |
| 2.28a Witt covectors | Over F_p, covectors give Q_p/Z_p with F=1,V=p and FV=p. Nilpotent tails need not have finite support. | Pass |
| 2.29 valuation-ring modules | M=V over a nonfield perfect valuation ring has fibre rank1 but is not finite length as a V-module; global finite-length replacement would exclude it. | Pass |
| 3.0 realization comparison | χ: D_cris jump −1, D*_cris jump +1; dual vector space dimension remains 1. | Pass |
| 3.1 filtered φ,N | F=diag(1,p), N(e₁)=e₀: Nφ(e₁)=p e₀=pφN(e₁); reverse normalization would give p² e₀. | Pass |
| 3.2 weak admissibility | Rank-one F=pʳ, jump r: t_H=t_N=r. Rank-two diag(1,p), Fil¹=span(e₀+e₁): totals 1=1; Fil¹=span(e₀) gives line 1>0. | Pass |
| 3.3 semistable equivalence / bound | Unit has t_H=t_N=0; zero has 0=0. An eigenline of slope0 in filtration1 violates 1≤0. | Pass |
| 3.3a translated filtered modules | Rank-one jump −1 at p=5 has raw effective realization 0; translating the interval recovers F₅(−1), dimension1. | Pass |
| FLModule and Hom | Zero filtration/module satisfies all laws. On a weight0 F_p line, φ⁰=σ generates; replacing φ⁰ by 0 gives generated subgroup 0≠M. | Pass |
| 3.4 torsion generation | W/p² with weight0 has length2 and generating φ⁰; zero has length0. Missing generation would admit the nonzero all-zero-φ object. | Pass |
| 3.5 abelian category | W/p→W/p²→W/p has lengths 1,2,1 and 2=1+1. The middle object is not killed by p. | Pass |
| 3.6 FL period ring | Unit and divided period t in the effective range realize inertia characters 1 and χ̄; no negative filtration jump is supplied by a raw positive-period formula. | Pass |
| 3.7 torsion realization | Effective weight0 line gives F_p, weight1 gives F_p(1); translating by a twists back by χᵃ. | Pass |
| 3.8 simple objects | h=2 and repeated digit pattern (0,0) has period1, not simple of period2; pattern (0,1) has period2 and endomorphism field F_(p²). | Pass |
| 3.9 tame inertia | h=2,(1,0): characters θ₂ and θ₂ᵖ under Frobenius conjugacy; p=3 gives exponents 1,3 mod8. | Pass |
| 3.10 length/exactness | W/p² realization has Z_p-length2, matching module length2; zero gives 0=0. | Pass |
| 3.11 full faithfulness | At endpoints 0,p−1, inertia ω⁰=ω^(p−1)=1; distinct filtered lines can have the same residual character. Safe interval excludes simultaneous endpoints. | Pass |
| 3.12 subquotients | Weight0 W/p² has subobject and quotient W/p of weight0; both remain in [0,p−2] for p>2. | Pass |
| 3.13 strong divisibility | Rank-one jump1, φ=p: p⁻¹φ(M)=M. Same filtration with φ=1 gives p⁻¹M≠M. | Pass |
| 3.14 lattice functor | Contravariant scaling M↦p⁻ⁿM corresponds to T↦pⁿT; indices reverse by pⁿ on a rank-one object. | Pass |
| 3.15 period embedding | φ(t)=pt and Fil¹ contains t; 1 has jump0 and φ=1. The embedding preserves these two generators' structures. | Pass |
| 3.16 FL admissibility | Rank-one jump r, φ=pʳ gives equality r=r; φ=p^(r+1) gives r≠r+1 and is not weakly admissible. | Pass |
| 3.17 crystalline lattices | At p=2 safe interval is [0,0]; χ has weight1 and is outside it, while the trivial lattice is inside. | Pass |
| 3.18 finite-flat FL dictionary | Over W(k), p>2: constant Z/p gives weight0, μ_p weight1, both length1/rank p. Zero gives length0/rank1. | Pass |
| 3.18 Honda subcategory | μ_(p∞) contributes weight1; étale group weight0. At p=2 an unipotent-only integral assertion cannot silently include μ. | Pass |
| 3.19 tame rank one | Ordinary height2 splits into connected and étale ranks1,1 after extension. At p=5 supersingular tame inertia order6 has fixed-space dimension0. | Pass |
| 4.1 Kisin coefficients | E=u−p: E(π)=0, φ(u)=uᵖ; constant E=1 has degree0 and is excluded from classification. Open-disc series with coefficients p^(−⌊√n⌋) are not bounded. | Pass |
| 4.2 finite height | Rank-one φ=1 has height0; φ=E has height1; φ=p has cokernel not killed by E. Zero object is allowed. | Pass |
| TorsionKisinModule and Hom | M=S/p with φ=1: u injective, pM=0, height≤1. M=k with u=0 fails injectivity; scalar maps commuting with φ compose normally. | Pass |
| 4.3 Kummer norms | At p=2, Norm(√2)=−2. Compatible negative uniformizer representatives give the norm-compatible frame; dropping the sign would give +2. | Pass |
| 4.4 Cohen étale condition | Over F_p(t), φ(x,y)=(xᵖ+t yᵖ,0) is injective, but linearization has rank1<2. Unit module fixed vectors=Z_p, φ=p line fixed vectors=0. | Correct controls; duplicate target R04. |
| 4.5 field-of-norms realization | Unit étale module gives trivial Z_p; reduction mod p gives trivial F_p on both sides. Noninvertible linearization is excluded. | Pass |
| 4.6 connection / filtered module | On a constant module, N₀=0 gives residue0; for N₀≠0 the connection residue is −N₀. λ(0)=1, so the sign survives specialization. | Pass |
| 4.7 Robba slope | φ(e)=pe: degree/slope1; φ(e)=ue: slope0 since u is a unit of integral Robba ring. diag(1,p) has slopes0,1, average1/2. | Pass |
| 4.8 slope filtration | M_(1,2): φ²=p, rank2, degree1, slope1/2. diag(1,p): filtration 0⊂Re₁⊂M, not a pure slope1/2 object. | Pass |
| 4.8a rational monodromy | N₀=0 gives regular zero residue; nonzero N₀ requires allowing the prescribed u-pole. Zero module gives N=0. | Pass |
| 4.9 weak admissibility / slope0 | Unit filtered object has t_H=t_N=0 and slope0 realization; jump1 with φ=1 has mismatch1 and is excluded. | Pass |
| 4.10 Kisin embedding | Q_p and Q_p(1) give rank-one modules φ=1 and φ=unit·E; Q_p(2) gives E-height2. | Pass |
| 4.11 full faithfulness | Identity and scalar p maps remain identity and scalar p after tensoring with O_E; zero map stays zero. Finite height excludes arbitrary Frobenius lattices. | Pass |
| 4.12 finite-height lattices | uS with φ(u)=uᵖ has cokernel killed by u^(p−1), not by any E-power; lattices pⁿT correspond contravariantly to p⁻ⁿS. | Pass |
| 4.13 semistable finite height | Tate curve has weights0,1 and N≠0; its finite-height module does not force N=0. χ² needs height2. | Pass |
| 4.14 crystalline restriction | A nontrivial finite Kummer character can restrict trivially to G_(K∞), but is ramified and not crystalline; unit crystalline object stays unit. | Pass |
| 4.15 torsion structure | S/p has p-torsion part itself and free quotient0. Ideal (p,u) has free hull S and finite-length cokernel k. | Pass |
| 4.16 all-weight functor | θ∘ι₀(E)=0; for E=u−p, θ∘ι₁(E)=pᵖ−p≠0, while the shifted theta map kills it. Dual χ⁻¹ is effective E-height1; χ has opposite weight. | Pass |
| 4.17 BT type | Contravariant χ has jump1 and φ=unit·E, height1; χ² has jump2 and height2, outside BT type. | Pass |
| 4.18 Breuil module | μ: Fil¹M=M, φ=p; étale: Fil¹M=Fil¹S·M, φ=1. φ₁=0 cannot generate nonzero M. | Pass |
| 4.19 crystalline comparison | Constant group: φ=σ,jump0; μ: φ=pσ,jump1 on D_cris(V∨), comparison period t. Height0: dimensions0=0. | Computed; primary source uncertified. |
| 4.19 integral pairing | μ at p=2: the extra t/2 period allows a cokernel killed by2; after inverting p both rank-one spaces agree. Unit pairing has rank1. | Pass |
| 4.20 crystalline 0,1 | Constant and multiplicative BT have weights0 and1; Tate curve has N≠0 and is not crystalline, so is excluded. | Pass |
| 4.21 BT Kisin classification | μ gives φ=unit·E, constant gives φ=1; both height1 groups and rank1 modules. Zero height gives rank0 module. | Pass |
| 4.22 finite-flat Kisin | Cokernel of p on the μ-line gives μ_p; cokernel on unit line gives Z/p; both underlying S/p but different φ. | Pass |
| 4.23 dyadic classification | At p=2 the same two S/2 objects have φ=E versus1; they remain distinct even when generic μ₂ and Z/2 agree. | Pass |
| 4.24 restriction on finite-flat reps | Two maps on a constant F_p module agreeing on the restricted representation are the same linear map; finite-flat hypothesis excludes arbitrary ramified characters. | Pass |
| 4.25 crystalline integral comparisons | Duality changes T_p(H) to T_p(H)∨, not T_p(Hᴰ)=T_p(H)∨(1). For μ these are Z_p(−1) and Z_p, different weights −1 and0. | Pass |
| 4.26 windows/base change | Unit: Fil¹=Fil¹S,Φ=1; μ: Fil¹=P,Φ=p. Their quotient ranks are1 and0 respectively. | Pass |
| Crystal/window equivalence | Unit and μ have ∇e=0 with F=σ and pσ; changing auxiliary Frobenius changes semilinear presentation, while evaluation on the same PD thickening stays the same crystal. | Pass |
| Strict action/connection | p⁻¹dφ(du)=(1+u)^(p−1)du has residue1; p⁻¹dφ(dt_i)=t_i^(p−1)dt_i has residue0. For t_i e, ∇=e dt_i and ∇Φ=p t_i^(p−1)e dt_i. | Pass |
| Logarithm normalization | On scalar u, γ(u)=(1+u)^χ(γ)−1; normalized logarithm gives (1+u)log(1+u). Multiplication by pʳ converts log(1+u) to τ. | Pass |
| Intermediate descent | K′=F_r: quotient group1, every special action trivial. Nontrivial order-(p−1) action on constant BT has nontrivial special action and fails integral descent. | Pass |
| Wach comparison | μ dual Tate lattice has Wach φ=E, γ(e)=γ(u)/(χ(γ)u)e, residue action1; unit has φ=1 and residue action1. | Pass |
| 4.27 WD normalization | Arithmetic element of degree f acts through φ^(−f); Nφ=pφN gives the pᶠ scaling. Unramified quadratic φ has φ⁻²=1, not φ⁻¹=1. | Pass |
| 4.28 potential semistability | Tate curve has N≠0 after every finite extension, so it is potentially semistable but not potentially crystalline. | Pass |
| 4.29 tame type weak admissibility | x₁=1,x₂=p: t_N=1=t_H. x₁=x₂=1 gives t_N=0≠1. | Pass |
| 4.30 descended lattices | Finite-order descent twist changes the special action but not height or rank; trivial descent returns the original BT lattice. | Pass |
| 4.31 strongly divisible descent | Unit quotient map p acts as reduction on dual finite realizations; inverse limit gives Z_p(1), whereas direct limit gives Q_p/Z_p(1). | Pass |
| 4.31 saturation | Fil=I·M+pM can have pM∩Fil≠pFil; p e belongs to the left, need not belong to the right. | Pass |
| 4.32 classification of lattices | Rank-one unit and cyclotomic lattices give height1 BT objects, with respective filtration jumps0 and1; zero object gives rank0. | Pass |
| 4.33 coefficient strong divisibility | Coefficients R=Z/p² preserve a free rank-one module of cardinal p²; replacing it by its residue module gives cardinal p and is not the same lattice. | Pass |
| 4.34 min/max Breuil models | Semilinear φ on truncated polynomial coefficients can kill nonzero u^e e, while linearized φ on the stated quotient is bijective. | Pass |
| 4.35 characters | At p=5, a covariant character parameter 2 inverts to3 under the contravariant realization; j=0,a=1 yields the indicated ω twist. | Pass |
| 4.36 Kisin coefficients | Free rank1 over Z/p² remains length2 after the construction; reduction mod p gives length1. | Pass |
| 4.37 étale/multiplicative | In the contravariant convention φ=1 corresponds to étale, φ=E to μ; composing Cartier duality reverses the two. | Pass |
| 4.38 coefficient Breuil functor | S⊗_(φ,Sfrak) unit has Fil¹=Fil¹S; the μ-line has Fil¹ all of M. Both remain coefficient rank1. | Pass |
| 4.39 finite-coefficient étale realization | Mod p unit gives F_p with trivial action; mod p² gives Z/p², not F_p² as Z_p-module. | Pass |
| 4.40 coefficient crystalline modules | Embedded Lubin–Tate character has labelled vector (1,0,…); coefficient extension repeats the embeddings compatibly without replacing it by (1,1,…). | Pass |
| 5.1 formal height inertia | Height2,p=3,e=1: tame character order p²−1=8; height1 order p−1=2. Height0 has no nonzero torsion. | Pass |
| 5.2 ordinary elliptic inertia | At p=3 semisimple inertia order2; nonzero wild extension can give order6. In both cases determinant is χ̄. | Pass |
| 5.3 supersingular inertia | p=3: nonsplit Cartan inertia order8 and normalizer order16; p=2 gives tame order3. | Pass |
| 5.4 multiplicative inertia | q=π has v(q)=1, nonzero wild Kummer class; q=πᵖu has unit class and valuation0 mod p. | Pass |
| Multiplicative Tate parameter | For E_q, j=q⁻¹+744+…, hence v(j)=−v(q). Nonsplit multiplicative twist has unramified η, so η on inertia=1. Good reduction v(j)≥0 is excluded. | Pass |
| Multiplicative finite-flat iff | q=π: 1 mod p≠0, no model; q=πᵖu: 0 mod p, unit model. Over Q₂, q=−4 has valuation2 and unit class−1; q=2 has valuation1. | Pass |
| 5.5 peu/très | Q₂ classes −1,2,5: unit/valuation values 0,1,0; −1 is ramified peu,2 très,5 unramified and outside the restricted predicate. | Pass |
| 5.6 flat Kummer extensions | Over Z₃, 4 is a noncube unit (mod9), giving a flat class; 3 has valuation1 and no flat killed-by-3 model. | Pass |
| 5.6 exponent condition | Over Z₂ the law with carry −1 gives (1,1)²=(−1,0), exponent4 despite trivial fibre torsor; killed-by-two hypothesis excludes it. | Pass |
| 5.6a finite coefficients | Enlarging F₃ to F₉ scales dimension by2 but preserves the underlying unit-Kummer condition v(q)=0 mod3. | Pass |
| 5.7 Serre finite-flat criterion | μ_p⊕Z/p: determinant χ̄ and flat. At p=3, the very ramified Tate class q=3 has same determinant but nonunit class, so is excluded by the extension condition. | Pass |
| 5.8 dyadic dichotomy | Nonzero unipotent class over Q₂ has rank2 representation, determinant1; unit−1 is flat, uniformizer2 is not. Unramified class5 becomes0 after strict henselisation. | Pass |
| 5.9 principal-series reductions | At p=3,i=0,j=1 the level-two exponents are2 and6 mod8; their difference is4, so they are conjugate under ×3. | Pass |
| 5.10 residual tame types | Reducible alternatives at p=3 give (ω,ω) or (1,1); wildly nontrivial extension information is not recovered from these semisimplifications. | Pass |
| 5.11 FL residual weights | χ^(p−1) reduces to1 but lies outside a fixed safe interval containing weight0. Within the stated interval, weights0 and1 remain distinct for p>2. | Pass |
| 5.12 induced determinant | Choosing θ(Φ²)=−1 makes the induced Frobenius determinant +1; θ(Φ²)=+1 would give −1. The extra unramified inverse factor is required. | Pass |
| 5.13 peu subspaces | Kummer units form valuation kernel; uniformizer has valuation1 mod l. Over Q₂ the unit5 is included even though its wild character is0. | Pass |
| 5.14 integral lifting | For a nontrivial χ≡1 mod l the integral image can have codimension1; for χ=1 the completed unit map surjects onto unit classes. | Pass |
| 5.15 Serre weights | Number of irreducible weights: p(p−1), giving2 at p=2 and6 at p=3. At p=5 central scalar5 with character value2 acts by4 after the square; Hecke scalar remains2. | Pass |
| 5.15 representation versus determinant | At p=5, on diag(2,1) the natural trace is3; twisting by det² gives trace2, although determinant data can agree. | Pass |
| 6.1 abelian torsion | g=1,n=2: rank4=2²; n=−1: rank1; n=0 is excluded since A[0]=A is not finite in positive dimension. | Pass |
| 6.1a Herbrand contract | F̄₃ Laurent-series Artin–Schreier break1 has different exponent4=2(3−1); over F̄₅((t)), a tame e=3 extension gives ψ(u)=3u for u≥0. | Mathematics consistent; supplier missing, R02. |
| 6.2 Fontaine normalization | Q₃(ζ₉): Fontaine u=2, normalized different=3/2; Serre's final upper break is1=u−1. | Pass |
| 6.3 approximate homomorphisms | Q₃(ζ₉)/Q₃ at m=11/6 gives eψ(m)=8/3; identity extension has different0 and the identity embedding. | Pass |
| 6.4 PD nilpotence | At p=3, v(x^[3ʳ])=c·3ʳ−(3ʳ−1)/2: c=1 tends to∞, c=1/2 stays1/2, so only the first is topologically nilpotent. | Pass |
| 6.4 lifting precision | For B=Z₃[X]/(X³−1), approximate X=4 mod9 has 4³−1=63 divisible by9; the exact lift X=1 agrees mod3, not mod9. | Pass |
| 6.5 ramification bound | μ_(pⁿ): normalized different n−1/(p−1) < n+1/(p−1); p=3,n=2 gives 3/2<5/2. Unramified field:0<positive bound. | Pass |
| 6.5 denominator/degenerate inputs | Finite extension degree≥1; p≥2 gives p−1≥1. n=0 excluded; trivial group with n=1 yields L=K and different0. | Pass |
| 6.6 obstruction | Identity of k[0] has cone0; cone(k[0]→0)=k[1], with H⁻¹ of dimension1. These test the indicated obstruction-complex shift. | Pass |
| 6.7 flat Ext dimensions | V=k(1)⊕k: h⁰=2,d(n−d)=1, total3. Trivial k²: h⁰=4,d=0,total4. Schur case h⁰=1,d=1,n=2 gives2. | Pass |
| 6.8 unramified descent/twists | μ_p twisted by unramified character has same connected special rank p and inertia χ̄; inverse twist recovers μ_p. Ramified twists are not covered. | Pass |
| Marked full-BT deformation | h=1,d=0 or1: d(h−d)=0, ring R. Ordinary h=2,d=1: one parameter and tangent dimension1. Marked infinitesimal automorphisms=0. | Pass |
| 6.9 determinant | μ has det χ and d=1; étale BT has d=0 and unramified determinant. Strict henselian base removes the unramified factor. | Pass |
| 6.9 purity normality | For regular local A of dimension2, B={(a,b)∈A²:a−b∈m} has normalization A² and étale codimension-one fibres, but its closed fibre has dimension3 and square-zero maximal ideal of dimension2, versus generic rank2. Normality excludes B. | Pass |
| 6.10 cyclotomic image | p=3: cyclotomic different 3/2 meets the excluded strict bound 3/2; p=5: 7/4>5/4. Height0 gives trivial image1 on both sides. | Pass |


## Not verifiable

All 66 bibliography entries and additional background works were submitted to the sources service. The audit above specifies which locators were actually read. No source manifest exists in the PR; none was created.

- `faltings-1999`, Theorem7, and `kisin-2006`, Lemma2.2.4, author-version p.26: the sampled crystalline comparison remains unverified at its primary locators. The DOI and official AMS PDF were tried; the service could not retrieve the AMS text. Harvard supplied Kisin's DVI, which the service cannot extract. The general-perfect-residue scope is therefore not certified by this review.
- `kisin-2006`, `kisin-2008`, `kisin-2009`, `kisin-2009b`: Harvard's author links respectively to wam.dvi, def.dvi, bt.dvi and serre2.dvi returned unsupported document formats. Layer R07.4's remaining Kisin locators, including Theorem2.5.5, coefficient comparisons and the dyadic Theorem0.8, remain unverified. The separate Kim/Liu sources were accessible; they do not certify Kisin's pagination.
- `schoof-2003`, §2 Prop.2.3 and Cor.2.4, pp.418–420, and `schoof-2005`, §2.4 p.850: both Rome author-page PDF requests failed with connection refused. The claimed variance error in Schoof was not independently verified and is not entered as a source error below.
- `serre-1987`, the residual/weight locators in R07.5: the DOI's Project Euclid landing page yielded no accessible PDF through the service. `serre-1972` is a different work and was inspected on the relevant scanned pages.
- `sga3`, XVII4.2.1: the bibliographic service query and primary-source search did not yield a readable original. The roadmap's cited later sources were not treated as certification of this locator.
- Settled paywall-only citations: `blochkato-1990`, `breuil-1999b`, `demazure-1972`, `tate-1967`, plus background `silverman-1994` V.5.3, `serre-local-fields` IV Props.4,14/V§7, and `bbm-1982` Thms.2.5.6,3.1.1,4.2.14. These remain uncertified and are not requested again. For BBM, [the publisher's record](https://link.springer.com/book/10.1007/BFb0093025) identifies LNM930 and subscription access.

The consolidated missing-reference file contains nine unresolved works; resolved ACC/Newton–Thorne entries were removed. The mathematical and supplier findings independently require changes.

## Source issues

- **Misprint** in schroer-2023 at §5 after Proposition5.3, arXiv v3 p.14 (lines 611–618): the source says the quadratic correction in the order-two group law has a plus sign; it should be a minus sign when ab=2 and f²=af; affects a stated result.
- **Error** in de-jong-1995 at Lemma7.1.13.1, p.82 (lines 2684–2698): the source says the displayed linear relations generate the presentation kernel; it should be replaced by the Artin–Rees construction of the auxiliary maps, without that assertion; affects the proof; corrected in print at de-jong-1998, p.175 (lines 25–43).
