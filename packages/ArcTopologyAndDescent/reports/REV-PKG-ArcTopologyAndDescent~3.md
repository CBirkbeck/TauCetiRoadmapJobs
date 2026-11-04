<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1051#issuecomment-6397047890 -->
Review (claude) of b2b744a

Verdict: needs changes

1. **F01** (P2) the limit-stability headline in the Summary is statable but absent

   - **Location.** `packages/ArcTopologyAndDescent/README.md` line 3 (Summary): "Arc-covers are exactly universal spectral submersions and are stable under cofiltered limits with affine transition maps". Also README line 451 (§2.7). `Suggested.lean` states only `arc_spectral_characterization`, and its docstring does not list the limit clause as unstatable.
   - **Claim.** The README presents this as a headline. The acceptance file treats it as neither stated nor unstatable.
   - **Witness.** Every carrier exists at the Mathlib pin:
     - `IsAffineHom` (`Mathlib/AlgebraicGeometry/Morphisms/Affine.lean:47`);
     - `IsCofiltered`, `Cone`, `IsLimit` and `Cone.postcompose`;
     - `Mathlib/AlgebraicGeometry/AffineTransitionLimit.lean` uses exactly this setup.

     The statement below, added to a scratch copy, elaborated with exit 0 and five `sorry` warnings. The one-tactic probe failed: aesop gave up after exhaustive search. The statement is BM21 Corollary 2.20, p. 14 (BM21 line 560).
   - **Repair.**
     - **`Suggested.lean`.** Insert this directly after `arc_spectral_characterization`:

       ```lean
       /-- Arc-covers are stable under cofiltered limits with affine transition maps (BM21 Corollary 2.20). -/
       theorem isSchemeArcCover_of_isLimit {I : Type u} [Category.{u} I] [IsCofiltered I]
           {X Y : I ⥤ Scheme.{u}} (f : Y ⟶ X)
           [∀ i, CompactSpace (X.obj i)] [∀ i, QuasiSeparatedSpace (X.obj i)]
           [∀ i, CompactSpace (Y.obj i)] [∀ i, QuasiSeparatedSpace (Y.obj i)]
           [∀ {i j} (φ : i ⟶ j), IsAffineHom (X.map φ)] [∀ {i j} (φ : i ⟶ j), IsAffineHom (Y.map φ)]
           {cX : Cone X} (hX : IsLimit cX) {cY : Cone Y} (hY : IsLimit cY)
           (hf : ∀ i, IsSchemeArcCover (f.app i)) :
           IsSchemeArcCover (hX.lift ((Cone.postcompose f).obj cY)) := by
         sorry
       ```

     - **README §2.7, line 451.** Name it: "… are stable under cofiltered limits of diagrams with affine transition maps (`isSchemeArcCover_of_isLimit`)". Add *Needs:* Mathlib `IsAffineHom`, `IsCofiltered`, `IsLimit`, and BM21 Corollary 2.20 to the locator.
     - **README line 144.** Change "four headline signatures" to "five headline signatures".

     The deprecated `Cones.postcompose` triggers a warning; use `Cone.postcompose` as written.
   - **Test on the refuting instance.**
     - For a one-object index category, the conclusion is the hypothesis on f.
     - Dropping `hY` would admit the cone with apex ∅. The map ∅ → lim X fails the residue-field test at any point when lim X ≠ ∅, so `hY` is required, and it is kept.

2. **F02** (P3) §3.7: the proof route asserts a map that the argument does not provide

   - **Location.** README line 586: "Its map through a connected component would give an injective local map from a rank-two valuation to a rank-at-most-one valuation, contradicting surjectivity on prime spectra".
   - **Witness.** The v-lift gives only V→W (injective and local) and B_C→W. Here B_C is the local ring at the component. No map V→B_C arises.
   - **Repair.** Replace the sentence with: "Spec W is connected, so the lift factors through one component Spec B_C. The chain of three primes of W over 0⊊p⊊m maps to three distinct primes of k[x,y] (0⊊(y)⊊(x,y) for the composite valuation with v(y)=(1,0), v(x)=(0,1)), so Spec B_C would contain three points, whereas the spectrum of a rank-at-most-one valuation domain has at most two."
   - **Test.** With v(y)=(1,0) and v(x)=(0,1), the primes of V contract as follows: p contracts to (y), since a polynomial lies in p exactly when y divides it; m contracts to (x,y). So the image has 3 points, while the component spectrum has at most 2. The contradiction holds without any map V→B_C.

3. **F03** (P3) §7.8: the *Needs:* line omits the carriers of the new statement

   - **Location.** README line 987: "*Needs:* §7.7; §5.3; §3.10; SchemeAndStackFoundations §§1.1–1.10; SchemeAndStackFoundations §1.4 reconstruction contract (gap:algebraic-space-perf-tannaka)."
   - **Witness.** The §7.8 statement and its Lean form use four things that this line does not list:
     - `IsSchemeArcCover` (§2.7);
     - perfect schemes, owned by SchemeAndStackFoundations §0.24 (`Scheme.IsPerfect`, defined only in its README) and §0.25;
     - Mathlib `CategoryTheory.ObjectProperty.FullSubcategory`, `CategoryTheory.IsPullback` and `CategoryTheory.EffectiveEpi`.

     The Layer 7 Dependencies (line 995) also omit Layer 2.
   - **Repair.**
     - Append to that *Needs:* line: "§2.7 (`IsSchemeArcCover`); SchemeAndStackFoundations §§0.24–0.25; Mathlib `CategoryTheory.ObjectProperty.FullSubcategory`, `CategoryTheory.IsPullback`, `CategoryTheory.EffectiveEpi`".
     - Add "Layer 2" to the Layer 7 Dependencies.
     - At line 958, write "It is equivalent to SchemeAndStackFoundations §0.24's `Scheme.IsPerfect` for X over F_p", so that the owner of the object is named.
   - **Test.** The empty scheme satisfies both predicates. F_p[ε]/ε² fails both: Frobenius kills ε, and absolute Frobenius is not an isomorphism.

4. **F04** (P3) §12.5: the F07 repair duplicated a sentence

   - **Location.** README line 1535: "This target supplies the proper henselian torsion-cohomology comparison used in the proof of CMM21 Theorem 6.3." Line 1531 already says: "For I=(p), this is the reduction used in the proof of CMM21 Theorem 6.3."
   - **Witness.** CMM21 line 2189 states the comparison only for R henselian along (p). Line 1531 records that scope; line 1535 repeats it without the scope.
   - **Repair.** Delete line 1535.

Four findings, one blocking (P2). All nine round-two findings are repaired. One repair (F03, which added the limit-stability clause to the Summary) introduced a new blocking defect: the Summary now names a headline that is statable at the pins but appears neither in `Suggested.lean` nor in its docstring (R01). The other three findings are P3 notes:

- a proof step in a sampled target is unjustified (R02);
- the *Needs:* line of the new §7.8 statement is incomplete (R03);
- the F07 repair left a duplicated sentence (R04).

`Suggested.lean` elaborates with exactly four `sorry` warnings.

## Verified sound

### Round-two findings

| Id | Repaired passage (quoted) | Status |
| --- | --- | --- |
| F01 | `Suggested.lean` line 77: "theorem arcCover_iff_universallyEffectiveEpi (p : ℕ) [Fact p.Prime] {X Y : (QcqsPerfectFp.{u} p).FullSubcategory} (f : Y ⟶ X)"; README §7.8 lines 958–981 give the API and 4+3 Checks | repaired; the false docstring bullet is gone |
| F02 | README line 80: "supply that sheafified representables are coherent (quasi-compact and quasi-separated) objects, so the sheaf topos is algebraic and coherent"; §5.2 line 774 cites `Topos.isQuasiseparated_iff_of_cover` | repaired; `plan.json` gap identical, section §2.5 |
| F03 | `IsRingArcCover` and `arc_affine_purity` absent from both files; §2.5 line 410: "The supplied affine lifting condition on a homomorphism A→B is: …" | repaired; the added Summary clause creates R01 |
| F04 | `Suggested.lean` lines 102 and 113: "(hA : TauCeti.Huber.IsStrictlyTopologicallyFiniteType (algebraMap K A))"; README line 62 cites the declaration at line 133 | repaired |
| F05 | README line 1309: "Together with torsion of order invertible in K (EtaleCohomologyFoundations §F.3; when char K = 0 this includes residue-characteristic torsion)" | repaired; new Check at line 1315 |
| F06 | `Suggested.lean` line 24: "Mapping descent into algebraic spaces lacks algebraic spaces and scheme perfection." | repaired; neither carrier exists at the pins |
| F07 | README line 24: "relative excision isomorphisms in degrees ≤ 0 and surjectivity in degree 1; supported K-theory under noetherian completion" | repaired, though not in the form proposed; matches GeneralAlgebraicKTheory §10.12 at head e0552fe (isomorphisms for j≤0, surjection in degree 1); the round-two degree-≤1 proposal overstated it; residue R04 |
| F08 | §6.1 line 845: "(BM21, Lemma 5.3, p. 38.) Text locators: BM21 line 1556."; §1.6 line 337: "BS17 lines 208 and 375"; `sources.toml` line 107: "Proof of Theorem 6.3, p. 51; CMM21 line 2180" | repaired |
| F09 | line 1489: "Checks for the supplied arc-site of p-adic formal schemes"; line 1468: "For I=A the proper-ideal test class is empty"; `Suggested.lean` line 90: `IsAddTorsion (F.obj.obj …)` | repaired |

None of these findings was marked "not actionable". Each repaired pattern was also searched for in the rest of the package:
- **Doubled articles.** No other instance.
- **Expanded bodies of Mathlib predicates.** `IsPrimePowerTorsionEtaleSheaf` has no clean native counterpart: `IsPGroup` (`Mathlib/GroupTheory/PGroup.lean:41`) is multiplicative only.
- **Deleted names.** No remaining reference.
- **Supplier ownership claims.** The scope rows were re-read against their suppliers.
- **"Not statable" claims.** The docstring was re-tested headline by headline. R01 is the one gap found.

### Elaboration, binders, padding

- **Elaboration.** `lake env lean` on `Suggested.lean`, run from the content checkout (Mathlib `6b7abb3c…`, Tau Ceti `a91d3aaf…`), exits 0 in 13 s. The only warnings are four `declaration uses sorry` (lines 55, 77, 99, 110). The object file of `TauCeti.RingTheory.Huber.TopologicallyFiniteType` was present.
- **Binder audit.** A single scratch file ran `#check @` on all nine declarations. There is no `variable` block, so no binder can be dropped. Each type matches README §§2.7, 7.8, 10.0 and 10.8:
  - the effective-epimorphism theorem keeps `[Fact p.Prime]` and quantifies T, P, g, f′, g′ inside the full subcategory;
  - both affinoid theorems keep `TopologicalSpace A`, `NonarchimedeanRing K`, `CompleteSpace K`, `IsAlgClosed K`, `Ring.KrullDimLE d A` and the torsion hypothesis.
- **Padding probes.** `first | (simp; done) | rfl | infer_instance | aesop | (constructor <;> intros <;> simp_all; done)` was tried on all four theorems and on the R01 statement. All five failed. None of the five definitions mirrors a Check; each is needed by a headline.
- **Non-vacuity.** `IsSchemeArcCover (𝟙 X)` was proved in scratch.
- **R01 statement.** It elaborated in place: five `sorry` warnings, exit 0.

### Seeded sample (15 targets), checked at the text

| Target | Locator checked | Result |
| --- | --- | --- |
| §0.3 | BM21 Lemma 3.28 (line 941, p. 22), Lemma 3.29 (line 949, p. 23) | statement and pages correct |
| §0.5 | BM21 Prop 2.8 (line 406, p. 10); Def 1.11 (line 200) gives the cartesian square | correct |
| §1.3 | BS17 Def 2.7 (line 238) and Prop 2.8 (line 242), p. 6 | correct; README drops surjectivity of Y→X, justified in §1.4 |
| §1.4 | BS17 Prop 2.8 and Thm 2.9 (lines 242, 289), pp. 6–8 | correct |
| §1.5 | BS17 Remark 4.2 (line 708, p. 15), Prop 4.5 (line 727, pp. 15–16); prime split = BS17 Lemma 6.3 (line 1011) | correct |
| §2.3 | BM21 Lemma 2.7 and Cor 2.9 (lines 390, 414, p. 10); Example 1.3 (line 105, p. 3) | correct |
| §2.4 | BM21 Lemma 2.4 (line 367, pp. 9–10) | correct, rank one |
| §3.5 | BM21 Def 3.20, Examples 3.21–3.23, Lemma 3.24 (lines 868–889, p. 21) | correct |
| §3.7 | BM21 Remark 3.31 (line 977, p. 23) | statement correct; route R02; two source issues |
| §3.10 | BM21 Props 3.30 and 3.32 (lines 958, 986, pp. 23–24) | correct |
| §5.4 | BM21 Remark 4.18 (line 1370, p. 33) | correct; the inverse-image claim is the formal property of the induced geometric morphism |
| §7.8 | BM21 Thm 1.10 (line 191, p. 5), Thm 5.17 (line 1875, p. 45), Remark 5.18 (line 1914, p. 46); BH16 Thm 1.5 (line 86, p. 2) | correct; "in that category" matches the full-subcategory quantifiers |
| §8.5 | BM21 Prop 6.3 (line 1959, p. 47), Example 6.8 (line 2054, pp. 49–50) | correct |
| §9.2 | BM21 Example 6.15 (line 2130, p. 51) | correct |
| §9.3 | BM21 Def 6.19 and Example 6.20 (lines 2203–2217, p. 53) | correct |

The author flagged no locator as unverified. The manifest has 14 works under 14 keys. No source passage is copied into the README.

### Adversarial pass

The table covers the sampled targets, every headline (with R01's statement), every passage the repairs changed or added, and the targets the findings touch. For untouched sections, round two's rows carry computed values and are relied on.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `arc_spectral_characterization` | id Spec k; generic j: Spec Frac V→Spec V (rank one); split V_p⊔V/p→V (rank two) | id: 2 subsets reflected, both true; j: closed point unlifted (LHS false), pullback along id misses m (RHS false); split: of 8 subsets, exactly ∅,{0},{0,p},{0,p,m} have open preimage = the 4 opens, both true | holds | none |
| R01 statement | one-object I; cone apex ∅ without `hY` | constant: conclusion = hypothesis hf; ∅→lim X has 0 lifts for a residue-field test | needs `hY`, kept | R01 |
| `arcCover_iff_universallyEffectiveEpi` | id; ∅→Spec F_p; fold Spec F_p⊔Spec F_p→Spec F_p; Spec Frac V→Spec V, V perfect rank one | id true↔true; ∅: 0 lifts, and the two inclusions into the two-point scheme agree on ∅, so not epi: false↔false; fold has a section: true↔true; Frac V: no lift of the closed point, equalizer of Frac V⇉Frac V⊗_V Frac V=Frac V is Frac V≠V: false↔false | holds | none |
| `IsPerfectFpScheme` | ∅; F_p[ε]/ε²; F_p[t]; F_p[t^(1/p^∞)]; p=0,1,4 | Γ=0 passes; ε^p=0, ε≠0 fails; t∉F_p[t^p] fails; Frobenius t^(1/p²)↦t^(1/p) bijective passes; p=0: x↦1 bijective only on 0; p=1: 1=0; p=4 on F₂: x⁴=x passes | determines perfect F_p-schemes for prime p | R03 owner wording |
| `QcqsPerfectFp` | ∅; ⊔_ℕ Spec F_p; fibre product of two perfect fields over F_p | qc,qs: true; not qc (no finite subcover); (a⊗b)↦(a^(1/p)⊗b^(1/p)) inverts Frobenius on the tensor product, so the pullback stays inside | correct; closed under pullback | none |
| `affinoid_artin_grothendieck` | A=0; A=K, d=0; A=K⟨T⟩, Λ=Z/p over C_p | all groups 0; H^q(K)=0 for q≥1 ⊂ range q>1; bound q>2 (BM21 7.3(1)) | consistent | none |
| `…_prime_to_residue` | C_p, ℓ=p; C_p, ℓ≠p; char K=p, ℓ=p | ‖p‖=1/p≠1 excluded; ‖ℓ‖=1 admitted; ‖(p:K)‖=‖0‖=0 excluded | consistent | none |
| `IsTorsionEtaleSheaf` (IsAddTorsion body) | constant Z; constant Z/6; ⊕_r Z/ℓ^r | 1 has infinite order (fails); 6x=0 (passes); a section is killed by ℓ^(max r) (passes, no common exponent) | same class as before | none |
| §10.0 strict finite type | n=0; unit-ideal quotient; K⟨T⟩/(T²) | `_id` (line 273) needs complete T0 nonarchimedean K: holds; `quotientMk` (line 207) needs `IsTopologicalRing`: holds; value 0; T≠0, T²=0 retained | Checks correct | none |
| §10.1 route (F05) | C_p, Z/p; char p, Z/p | p is a unit in C_p and char 0, so §F.3 ("prime-to-characteristic") applies, q>n; Artin–Schreier gives q≥2; primary parts ℓ≠char K and ℓ=char K are exhaustive | exhaustive | none |
| §5.2 cover criterion (F02) | {a,b}↠{*}; pushout {a}⊂{a,b}, {a}→{c} | relation 4 elements, both coherent; D={b,c}, relation sizes 2,1,1 | consistent with R0.19.10 (J algebraic) | none |
| Scope K-theory row (F07) | identity Milnor datum | relative fibres 0; §10.12 gives isomorphisms j≤0 and a surjection j=1 | matches supplier | none |
| §11.4 I=A (F09) | I=(2,3)⊂Z | IV=V for every test, so no nonzero proper tests; D(2)∪D(3)=Spec Z, neither generator a unit | correct | none |
| §12.5 | I=A; P¹ over O_(C_p), ℓ≠p | (A,A) henselian forces A=0, both sides 0; H⁰=F_ℓ, H²=F_ℓ(−1) on whole and closed fibre | correct | R04 |
| §0.3 | Z→C | V₀=algebraic closure of Q in C, card ℵ₀=max(|Z|,ℵ₀); V₀→C injective local | correct | none |
| §0.5 | rank two, p middle; p=0; p=m | V_p×_{κ(p)}V/p=V since a−x∈pV_p=p; Frac V×_{Frac V}V=V; V×_k k=V | correct | none |
| §1.3 | Z=∅; Z=X, Y=∅; Bl₀A² minus [1:0] | Y≅X; E=∅, cover = id; the line y=0 lifts uniquely (valuative criterion) to the deleted point: not v, not h | correct | none |
| §1.4 | non-surjective square via Y⊔Z | F(Y⊔Z)×_{F(E⊔Z)}F(Z)=F(Y)×_{F(E)}F(Z) | correct | none |
| §1.5 | perfect rank-two split | 0→V→V_p⊕V/p→κ(p)→0 exact, identity test has no faithful lift | canonical, not v | none |
| §2.3 | I=0; I=A; rank-two middle prime | summand Spec A splits; f(1)=1∈J forces f iso; arc not v | correct | none |
| §2.4 | A=V[1/t]×V/t; A=V | 2 points, no specialization: not arc; 0⇝m: arc | correct | none |
| §3.5 | identity; empty family, F=O over Spec k | singleton detects; F(k)=k vs F(∅)=0, so the empty cover fails, which the empty family cannot detect | correct | none |
| §3.7 | composite valuation of k[x,y] | 3 contracted primes vs ≤2 points | statement correct | R02 |
| §3.10 | A=k algebraically closed; A=0 | one test k→k; empty product 0 | correct | none |
| §5.4 | X=Spec F₂, |F₂|<κ<κ′ | f*h_X^#=h_X^#; End has 1 element at both cutoffs | correct | none |
| §8.5 | rank two, f=x∈m∖p, I=(x) | v(y/xⁿ)=(1,−n)>0, so y↦0 in the completion; the identity test lifts through neither branch | arc, not v | none |
| §9.2 | subdisc |T|≤|π| in the unit disc | T=1 has |1|>|π|, so this rank-one point is missed | not arc_t | none |
| §9.3 | Z_p[x]/(px)→Z_p; V→V[1/t] | px=0, p≠0 in a domain gives x=0: |Hom|=1=1; Hom(V[1/t],V)=∅ vs id | correct | none |

### Dependency check

`gate --depcheck … --name ArcTopologyAndDescent --order merge-order/ORDER.txt --movable` printed `depcheck: 51 roadmaps, 594 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. The roadmap is at ORDER line 123.

`roadmaps resolve` found no cross-roadmap citation and no Lean name that is missing everywhere. The worker's four leads all resolve:
- `Arc.Cover.ofVCover`: PrismaticCohomology §2.0 at head ff0050b.
- `Etale.artinSchreier_vanishing`: SchemeAndStackFoundations on main, `Suggested.lean` line 1405.
- `Topos.isQuasiseparated_iff_of_cover`: AdicSpacesPartII README line 8039 on main.
- `sources.toml`: a file name, not a Lean name.

### Declared gaps

The five slugs agree between the README and `design/plan.json`: same supplier, same section, and each `needs` sentence is a prefix of the README contract. The narrowed coherent-topos-pushouts gap is precise and minimal:
- AdicEtaleGeometry §A1.15 assumes a coherent topos and only cites finite-limit sites as an example (its README line 5763).
- No roadmap proves that representables are coherent.

Its supplier will use AdicSpacesPartII vocabulary. That is allowed: both roadmaps are on main, and AdicSpacesPartII mentions SchemeAndStackFoundations only as a cross-reference (its README line 643). The other four gaps are unchanged from round two.

### Library declarations opened at the pins

- **Mathlib:**
  - `IsMulTorsion`/`IsAddTorsion`: `GroupTheory/Torsion.lean:56`.
  - `IsPullback`: `…/Pullback/IsPullback/Defs.lean:61`.
  - `EffectiveEpi`: `CategoryTheory/EffectiveEpi/Basic.lean:71`. Its test objects range over the ambient category, here the full subcategory.
  - `ObjectProperty.FullSubcategory`: `CategoryTheory/ObjectProperty/FullSubcategory.lean:39`.
  - `IsAffineHom`: `AlgebraicGeometry/Morphisms/Affine.lean:47`.
  - `AlgebraicGeometry/AffineTransitionLimit.lean`: the affine-transition limit setup.
  - `IsPGroup`: `GroupTheory/PGroup.lean:41`.
- **Absent from Mathlib and Tau Ceti at the pins:** algebraic spaces, a perfect-scheme predicate, scheme perfection, completed tensor products of affinoid algebras, any bridge from `IsUltrametricDist` to `NonarchimedeanRing`, and a universally-effective-epimorphism or canonical-topology notion for perfect schemes.
- **Tau Ceti** (`RingTheory/Huber/TopologicallyFiniteType.lean`): `IsStrictlyTopologicallyFiniteType` at line 133, `_algebraMap` at 150, `.quotientMk` at 207, `_id` at 273.

### Cross-roadmap citations resolved

- **On main:**
  - SchemeAndStackFoundations §§0.24, 0.25, 1.4, 2.5, 2.11 and 2.15. §0.24 defines `Scheme.IsPerfect` in its README only; its `Suggested.lean` has `SchemeCharP` but no perfect predicate.
  - AdicSpacesPartII §R0.19.10.
  - AdicEtaleGeometry §A1.15.
  - EtaleCohomologyFoundations §§F.0.1, F.2.1 and F.3. The F.3 statement covers prime-to-characteristic torsion.
  - RigidAnalyticGeometry §§1.1–1.3.
- **At open heads:**
  - GeneralAlgebraicKTheory (e0552fe) §§8.5, 8.6, 10.9, 10.12.
  - SchemeKTheoryOperations (88dbd5a) §§3.4, 4.10.
  - PrismaticCohomology (ff0050b) §2.0.
  - DiamondsAndVStacks (7c7453f) §§D0.11 and D0.12. D0.12 owns the topological limit lemma; the arc-cover corollary of R01 belongs here.

### Ownership

`roadmaps grep` was run over main and the open heads, and the local board packages were grepped. The searches covered:
- perfect-scheme predicates;
- "universally effective epimorphism";
- canonical topologies on perfect schemes;
- arc-cover limit stability;
- coherent-site representables.

The only other arc material is in four board designs that consume this roadmap (EtaleDualityAndPerverseSheavesPartII, PerfectoidQuotientsPartII, PurityForFlatCohomology) or treat a different object, the Banach arc-topology of MotivesAndAlgebraicCyclesPartII. No `Suggested.lean` declaration reuses another roadmap's fully qualified name. This roadmap is the owner of the §7.8 criterion and of R01's corollary.

## Not verifiable

- **HUB96.** Settled as uncertified (paywalled). Cited by locator only.
- **BS17 proof of Theorem 11.2, pp. 46–47** (§7.7). Not re-read this round: §7.7 is outside the sample and unchanged.
- **Open roadmap pull requests.** The brief gave none with a checkout path. Ownership against them was checked only through `roadmaps grep` at their indexed heads.
- **Board packages on other pull-request heads** (the 20 in the board index). Not opened; locally their folders hold only reports.

## Source issues

- **Misprint** in BM21 at Remark 3.31, p. 23: the source attributes the product v-cover to "Proposition 3.29". It should cite Proposition 3.30, since 3.29 is a lemma about cardinal bounds; affects nothing.
- **Gap** in BM21 at Remark 3.31, p. 23: the source infers that every valuation on B has rank at most one because its components are rank-≤1 valuation rings. A field component carries valuations of any rank. The argument should instead map the lifted three-point chain into a two-point component; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b2b744a", "job": "REV-PKG-ArcTopologyAndDescent~3", "model": "opus", "worker": "fable-rev113"} -->
