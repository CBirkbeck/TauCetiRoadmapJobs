# Review of LocallyAnalyticRepresentationsOfLocalGroups (package, round 2)

**Verdict:** needs changes

Sixteen findings: five P1, six P2 and five P3. The four previous findings are repaired. The package's Lean file elaborates, but several prose statements and Checks are false, and ownership and supplier references have drifted. The inputs were not edited.

## R01 (P1) — Topological irreducibility does not imply abstract simplicity of the dual

**Location:** `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:324`, repeated at line 330: “V is topologically irreducible if and only if V′ is a simple D(G, E)-module”.

**Claim:** This is simplicity among all algebraic distribution modules, rather than simplicity in the coadmissible category.

**Witness:** For smooth Steinberg V of GL₂(ℚ_p), V′ is the full linear dual; its smooth contragredient is a nonzero proper D(G,E)-submodule. ST03 lines 1434–1441 identify this full dual.

More explicitly, V=C^sm(ℙ¹(ℚ_p),E)/E with its finest topology is admissible and topologically irreducible, as the section's own last Check says. The functional δ₀−δ_∞ belongs to V′ and is not smooth: its stabiliser fixes its two-point support and is not open. The smooth contragredient is nonzero. It is stable under distributions: on each compact open subgroup a smooth functional has a finite-dimensional orbit, and distributions act through that finite quotient. It is also G-stable. Thus it is a proper algebraic submodule, although its closure is the whole dual.

**Repair:** In both occurrences replace abstract simplicity by simplicity in 𝒞_G, equivalently absence of nonzero proper closed D(G,E)-submodules, retaining V≠0. Add the Steinberg/full-dual negative control. Tested on this example: closed simplicity is true, algebraic simplicity is false; the anti-equivalence in §1.3 then gives precisely the repaired assertion.

## R02 (P2) — The finest-topology assertion needs admissibility

**Location:** `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:391`: “V_(W-lalg) is closed in V with its finest topology.”

**Claim:** The API is quantified over the locally analytic V introduced at line 385, without admissibility.

**Witness:** Take V=c₀(ℕ,E) with trivial GL₂(ℚ_p)-action and W=E. Then V_(W-lalg)=V, but its Banach topology is not its finest locally convex topology. EM17 lines 6163–6166 require admissibility.

For v_n=p^n e_n, the Banach norm tends to zero. Extend the linear assignment e_n↦p^(−n) from the span of the e_n to a Hamel linear functional on V. It sends v_n to 1, so is not continuous in the Banach topology; every linear functional is continuous for the finest locally convex topology.

**Repair:** Keep the general locally algebraic-vector functor, but state the closed-subspace/induced-finest-topology conclusion for admissible V, citing EM17 Proposition 6.3.6, p. 123. Add this trivial Banach representation as a negative control. It is excluded by the repaired hypothesis: its compact-open invariant space is infinite-dimensional.

## R03 (P1) — Rank-zero and torus specialisations contradict three claims

**Location:** `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:877`: “has dimension n + d_L”; also the proper-subrepresentation Checks at lines 951 and 1082.

**Claim:** §5.3(4) includes n=0; §§6.1 and 7.3 assert properness even when G is a torus.

**Witness:** For n=0 and L=ℚ_p, T=1 and Hom_(g′)(T,E)=0, whereas n+d_L=1. For G=T=𝔾_m, induction is the identity: the claimed proper inclusions are equalities of one-dimensional spaces.

The n=0 Check at line 885 already supplies the contradiction to §5.3(4). At n=0, det* is the zero map, so the intersection-dimension argument cannot subtract a one-dimensional valuation line. For a torus, every weight is dominant and both the Orlik–Strauch finite-dimensional formula and closed induction give the inducing character itself.

**Repair:** Give dimension 0 for n=0 and n+d_L for n≥1. Retain the general rank-zero case. Qualify properness in the two Checks by positive semisimple rank, and add the torus equality. Recomputed values: 0=0 at n=0; 2=1+1 at n=1 over ℚ_p; torus inclusion has dimensions 1→1 and is an isomorphism.

## R04 (P1) — Normalised reducibility criteria were applied to unnormalised characters

**Location:** `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:975`: “irreducible exactly when its ratio is not in {|·|^(±1)}”; line 989 uses raw ratio |·| to claim reducibility; line 1014 claims eight constituents without genericity.

**Claim:** These Checks concern the unnormalised lower-Borel induction explicitly defined at lines 39 and 967.

**Witness:** Write ν=|·|_L. For lower GL₂, Ind(χ)=i(χδ_B^(1/2)), so the normalised ratio is (χ₁/χ₂)ν. Raw ratio 1 is reducible; raw ratio ν is irreducible.

The raw exceptional set is {1,ν^(−2)}, not {ν,ν^(−1)}. Ind_(B⁻)(1⊠1) contains constants and has Steinberg quotient. Conversely raw ratio ν gives normalised ratio ν², outside the exceptional set. The calculation can be made after coefficient extension adjoining a square root; the resulting criterion has no square roots. BZ77 lines 164–170 specify normalised induction, and lines 550–559 give Theorem 4.2 and its character specialisation.

The §6.6 count also needs generic smooth data. With λ dominant, raw χ₁=1⊠1 for the GL₂(ℚ_p) factor gives length 3: two locally algebraic factors and one nonalgebraic factor. Choose generic data for the quadratic-field factor, of length 4. The product has length 12, not 8. The phrase “simple M_i” does not constrain the displayed Verma modules or these characters.

**Repair:** Use the raw exceptional set {1,ν^(−2)} in §6.3. In §6.4 use χ=1⊠1 for the reducible example, and retain raw ratio ν as an irreducible negative control. In §6.6 explicitly use χ_i=φ_iη_i with generic φ_i and dominant λ_i; remove the unused “simple M_i”. Then the advertised product is 2·4=8, whereas the nongeneric control is 3·4=12.

## R05 (P1) — Uniqueness of Orlik–Strauch presentations fails for zero smooth inputs

**Location:** `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:979`: “for simple M_i with maximal parabolics Q_i and finite-length π_(Q_i)”.

**Claim:** Isomorphic outputs recover both inputs, including the highest-weight module, for all finite-length smooth arguments.

**Witness:** Let G=𝔾_m, M₀ and M₁ have weights 0 and 1, and π₀=π₁=0. Both outputs are 0 by line 947, but M₀ and M₁ are not isomorphic.

**Repair:** Require both smooth arguments to be nonzero in the uniqueness assertion, and add this zero-input Check. The corrected statement distinguishes F(M₀,1)=1 and F(M₁,1)=z^(−1); their torus weights are 0 and −1. BR16 Corollary 2.7, lines 501–510, has the same omitted nonzero condition; its proof reads a highest weight from a tensor product which vanishes in this example. Record that source error rather than reproducing it.

## R06 (P2) — The principal-series character need not be defined over E

**Location:** `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:1059`: “of the locally analytic induction of a locally analytic character of the torus”.

**Claim:** The finite-dimensional-U conclusion is strengthened to induction of an E-valued character without a splitting hypothesis.

**Witness:** G=ℚ₃^×, E=ℚ₃, units act trivially, and 3 acts on V=E² by [[0,3],[1,0]]. V is irreducible and very strongly admissible; J_G(V)=V, but no E-valued character induces V.

The minimal polynomial X²−3 is irreducible. Since B=G, induction of a character has dimension 1, and every subquotient has dimension at most 1, whereas dim V=2. V itself is an admissible finite-dimensional Banach representation. EMJ2 lines 3275–3295 explicitly pass to a finite coefficient extension and then forget that extension to produce finite-dimensional U over the original field.

**Repair:** State exactly the finite-dimensional-U conclusion of EMJ2 Corollary 0.14 over E. Explain that the character in its proof can be valued in a finite extension E′ and its underlying E-representation is used; do not assert it is an E-valued character. Retain character-valued variants only with the needed splitting hypothesis. On the witness, E′=E(√3), the character 3↦√3 has underlying E-dimension 2 and supplies U=V.

## R07 (P2) — The final irreducibility scope excludes small primes

**Location:** `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:929`: “assume p > 3 when 𝐆 has a simple factor not of type A”; propagated at line 979 and through §§6.5–6.6.

**Claim:** The general split-reductive irreducibility theorem stops at the source's method-dependent prime restriction.

**Witness:** Sp₄(ℚ₂) and split G₂(ℚ₃) satisfy the roadmap's group and coefficient conventions but receive no irreducibility theorem. BR16 lines 234–236 and OS15 lines 117–122 genuinely carry the restrictions.

**Repair:** Keep the cited restricted theorem as an intermediate result, and add the missing general-prime theorem with an owned, explicit small-prime proof input and route. Propagate the unrestricted end target through Jordan–Hölder and product theory. Do not erase the source hypotheses or pretend those texts prove the general version. Coverage must include both displayed groups. This is the binding general-library/no-good-primes-only requirement, not a claim that the source's restricted theorem is false.

## R08 (P1) — Distribution supplier citations resolve to a superseded design

**Location:** `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:70`, and every `ND.*` reference: “ND.0 … ND.1 … ND.2 … ND.3 … ND.6”.

**Claim:** Those sections and target IDs supply the compact distribution, coordinate, Fréchet–Stein and Banach-duality inputs.

**Witness:** `packages/LocallyAnalyticDistributionsPartII/README.md:20` assigns distribution/Fréchet–Stein/Banach duality to PadicLocalLanglandsForGL2Qp §0.1; line 21 assigns coordinates to NoncommutativeAndEquivariantIwasawa. Its package has Layers 0–5, no ND IDs or numbering map.

The earlier review checked `design/README.md`; a package README now exists and supersedes that evidence. Its actual §1.1 is the enveloping embedding (line 141), §1.2 the crossed-product/open-subgroup decomposition (164), and §2.5 the Arens–Michael envelope (248). Its lines 20, 55 and 57 also distinguish missing generic Fréchet–Stein and explicit-radius contracts from supplied distribution-specific facts.

**Repair:** Resolve every ND reference to the actual package section or earliest owner: coordinates to NoncommutativeAndEquivariantIwasawa §§0.1–0.2, 0.6–0.7; compact distribution theory and Banach duality to PadicLocalLanglandsForGL2Qp §0.1; embedding/decomposition/envelope to §§1.1, 1.2, 2.5 of the distribution package. For any generic Fréchet–Stein or radius input still absent, declare the precise supplier gap instead of citing it as supplied. Also route the general-manifold F/ℚ_p analytic quotient at line 62 to PadicLocalLanglandsForGL2Qp §0.1: LocallyAnalyticDistributions §0.3's corresponding target is only on O_F. The replacements are earlier owners and do not require an upward edge.

## R09 (P2) — General category-O foundations have two open owners

**Location:** `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:747`, 763 and 779; the reductive Verma modules, simple classification and finite-length category-O foundations are constructed here.

**Claim:** These foundations have one owner, with other roadmaps consuming them.

**Witness:** Open pull request #1828, `TauCetiRoadmap/SpringerResolutionAndCharacteristicCycles/README.md:1214`, independently constructs reductive Verma/simple modules and finite-length highest-weight classification for its principal block; line 1216 uses that subsection's own construction.

For sl₂ the overlap already contains M(0), M(−2), their simple quotients and the two-factor series of M(0). The Springer strict central reduction and geometric localisation are additional mathematics, but those do not justify rebuilding the shared algebraic foundations. The previous review's assertion that this head contains no category O is no longer true.

**Repair:** Keep general split-reductive category O in §§4.1–4.3 here, before Springer in the merge order. State this ownership and the precise strict-principal-block restriction in Scope. The corresponding Springer repair must import these sections for the shared construction/classification and retain its strict central reduction, labels and localisation as its own targets. Do not add Springer as this package's supplier. Test the boundary with sl₂: one owner for M(0), M(−2), their quotients and finite-length theory; Springer owns the localisation and orbit labels.

## R10 (P3) — The consumer's LR identifiers need a numbering map

**Location:** `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:1560` names the trianguline consumer, but the README contains no old-to-new LR map.

**Claim:** The package preserves usable citations from existing open consumers.

**Witness:** Open #1829, `TauCetiRoadmap/TriangulineVarietyAndItsLocalModel/README.md:117`, imports LR.4/principal-series and five LR.5 Orlik–Strauch IDs. Its lines 119–121 repeat those IDs in supplier contracts; none exists in this package README.

**Repair:** Add an explicit table headed “Former numbering” with LR.4→Layer 5 and LR.5→Layer 6, and individual mappings: principal-series→§5.2; orlik-strauch-functor→§6.1; orlik-strauch-exactness→§6.2; orlik-strauch-irreducibility→§6.4; orlik-strauch-jordan-holder→§6.5; orlik-strauch-products→§6.6. These are the same objects in `design/README.md` Layers LR.4–LR.5 and the package's mathematical sections. The map repairs every cited ID above without changing the consumer's supply direction.

## R11 (P2) — The roadmap describes its organisation as a source's sections

**Location:** `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:17`: “Ding's §3.1 for GL_n(L): §3.1.1–3.1.2 (Layer 8), §3.1.3 (Layer 9), §3.1.4 (Layer 10)”; repeated at lines 1142, 1350, 1453.

**Claim:** Layers are identified with consecutive sections of a source, rather than defined by the mathematics they deliver.

**Witness:** Lines 1142 and 1350 literally begin “This layer is Ding's”. The binding organisation principle explicitly prohibits saying the roadmap follows a source's organisation.

**Repair:** Replace those organisational sentences with the mathematical outputs: principal-series extension spaces, parabolic compatibility/amalgamation, and embedding-wise analytic decomposition. Keep Ding's exact locators at the individual claims. Explain why the maps and constituents from Layer 8 are inputs to Layer 9 and why Layer 10 specialises them. Those dependencies justify the existing mathematical order; no arbitrary rearrangement is requested.

## R12 (P3) — Two Emerton citations name the analytic-vector theorem instead

**Location:** `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:324` and 485 cite “Proposition 6.2.4, p. 118”.

**Claim:** That proposition proves strong admissibility implies admissibility, and that the admissible Banach category is abelian with strict maps.

**Witness:** EM17 lines 5927–5938 concern locally analytic vectors of an admissible continuous representation. Strong admissibility implies admissibility is Proposition 6.2.2, lines 5898–5906; Banach strictness and abelianness are lines 5999–6007 and 6072–6077.

**Repair:** Use Proposition 6.2.2, p. 117 in §1.2(i). In §2.1(iii) use Proposition 6.2.9, pp. 119–120, and Corollary 6.2.16, p. 121, with the discrete valuation hypothesis already provided by E/ℚ_p finite. Update the existing EM17 manifest locator entry, retaining that key. These replacement statements have the requested conclusions; the repaired ST02B page range remains correct.

## R13 (P3) — Pinned-library descriptions are inaccurate

**Location:** `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:49`; `packages/LocallyAnalyticRepresentationsOfLocalGroups/Suggested.lean:16`.

**Claim:** The projective-resolution Ext is named `CategoryTheory.Abelian.Ext`, and the pins have no nonarchimedean-valued locally analytic function carrier.

**Witness:** `Mathlib/CategoryTheory/Abelian/Ext.lean:41` declares root `Ext`. `TauCeti/NumberTheory/Padics/Distribution/LocallyAnalytic.lean:45` declares `TauCeti.LocallyAnalytic`; line 30 explicitly says its direct limit has no topology.

**Repair:** Name root `Ext` for the first file, reserving `CategoryTheory.Abelian.Ext` for `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118`. Qualify the docstring's absence claim: the native algebraic direct limit on ℤ_p and `TauCeti.AnalyticStage` exist, but the general-manifold, topologised locally analytic representation/distribution carriers required by these headlines do not. Record the existing special case in Scope/supplier contracts. No substitute headline or extra import is needed. Tested distinction: native evaluation lands in C(ℤ_p,E), but supplies neither a topology on its direct limit nor D(G,E) for general G.

## R14 (P3) — The Lean import header does not follow the required acceptance-test form

**Location:** `packages/LocallyAnalyticRepresentationsOfLocalGroups/Suggested.lean:1`: `module`; line 3: `public import Mathlib`; line 47: `@[expose] public section`.

**Claim:** The repair adopted an upstream module-header variant although this task prescribes the single line `import Mathlib`.

**Witness:** A scratch copy using just `import Mathlib`, with the module/public-section wrapper removed, elaborated with exit 0 and no output at the same pins.

**Repair:** Restore that prescribed header and remove the unnecessary public-section wrapper. The tested copy preserves the docstring and empty namespace and needs no option override. This does not reopen any settled finding; the header was an additional change made during repair.

## R15 (P3) — The displayed build order still has forward prerequisites

**Location:** `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:120`, 394, 462 and 1061.

**Claim:** The numbered layers/sections are a build order; Layer 4 is described as parallel with Layers 0–3.

**Witness:** §1.6 and §1.10 need §4.1; §7.2 needs §§7.3 and 7.5. The latter theorem's stated proof route explicitly goes through §7.5.

**Repair:** Present the pure Lie-algebra prerequisites before the representation results that consume them, and place the Jacquet consequence after closed induction and adjunction. Alternatively split the pure-Lie prerequisite into an earlier layer and give a precise topological build order, rather than calling all of Layer 4 parallel with its consumers. Preserve the old-to-new numbering as in R10. A valid order includes 4.1 before 1.6 before 1.10, and 7.1→7.3→7.4→7.5→7.2. These are internal ordering defects; the roadmap-level dependency command reports no cycle.

## R16 (P2) — The barrelled supplier gap replans native Banach–Steinhaus

**Location:** `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:64` and `design/plan.json` gap `barrelled-banach-steinhaus`.

**Claim:** Barrelled Banach/Fréchet spaces and pointwise-bounded-implies-equicontinuous need a new theorem, because Mathlib's barrelled definition uses real-valued seminorms.

**Witness:** `Mathlib/Analysis/LocallyConvex/Barrelled.lean:122` supplies Baire-space barrelledness over any nontrivially normed field; lines 164 and 192 supply `WithSeminorms.banach_steinhaus` and `PolynormableSpace.banach_steinhaus`, also over nonarchimedean fields.

The scalar field is not required to be ℝ. Real-valued seminorms are also the native formulation for nonarchimedean normed spaces. The genuinely missing lattice/topology comparison does not make the existing theorem absent.

**Repair:** Keep the same gap slug and owner, but narrow `needs` in both locations to the O_E-lattice/ultrametric-seminorm comparison and the remaining compact-type/inductive-limit instances. Explicitly import the native barrelledness and uniform-boundedness theorems instead of asking for them again. Require the comparison to identify pointwise boundedness and equicontinuity with the native predicates. For E=ℚ₂ and the family x↦a x with a∈ℤ₂, both formulations give sup_a |ax|=|x| and operator bound 1; the native theorem already handles this Banach instance. The other six declared gaps are not challenged merely because their supplier has not implemented them.

## Verified sound

### Previous findings and the repair changes

All four previous findings are **repaired**, individually checked against their repaired text and witnesses. None was marked not actionable, and none is re-raised here. New findings concern different claims or changed supplier/library state.

| Previous finding | Repaired passage and location | Verification |
|---|---|---|
| F01, irrelevant DLB locator in §1.4 | README line 357: “Proposition 6.4, p. 34, and Lemma 3.6, p. 11” | ST03 lines 1343–1358 give the abelian/strict category; lines 430–448 supply the coadmissible-submodule facts. The DLB17 reference and its 1.4 manifest attribution are gone. Finite abstract length bounds closed-submodule chains, as the stated route requires. |
| F02, ST02B pages | README line 485: “Lemma 3.4, pp. 14–15” | ST02B line 514 is on printed p. 14; the proof continues after the page-15 marker at line 528. The finite-generation criterion is the intended result. R12 is a different citation in this sentence. |
| F03, §1.2→§2.1 dependency | README line 324: “an admissible unitary Banach representation B of a compact open subgroup H”; line 508: “after restriction to a compact open H by 2.1 (ii)” | For χ(x)=x on ℚ_p^×, multiplication by p preserves no bounded open G-lattice; on ℤ_p^× it preserves O_E. The dual after analytic base change has one generator. §1.2 no longer needs §2.1. The further forward-prerequisite pattern is R15. |
| F04, GL₂ supplier overlap | README line 29: “PadicLocalLanglandsForGL2Qp §§2.4 and 4.8”; line 873: “PS(η_1ε⁻¹ ⊠ η_2)” | At the supplier's open head, §§2.4 and 4.8 exist. The Weyl conjugation swaps t₁,t₂; both central characters are η₁(a)η₂(a)ε(a)⁻¹. For Π=E² trivial, the trivial algebraic type has multiplicity 2, other irreducible types multiplicity 0. |

The altered §1.4, §2.1, §1.2(iv), §2.2 route, Scope and both added compatibility Checks were re-read in full. The additional Lean header change was tested separately (R14). The earlier adversarial table was used only for its explicit computations; its uncomputed assertions of universal soundness were not treated as evidence. In particular, its old §6.4 reducibility row was recomputed and is corrected by R04.

### Seeded source sample

All 15 selected targets were checked against the available text, including theorem numbers, printed/preprint page convention, hypotheses and the stated maps. The table distinguishes source support from the additional mathematical defects above. No author-flagged unresolved locator was found. The three manifest entries already marked uncertified remain settled, not requests for another fetch.

| Target | Source text read and locator | Outcome |
|---|---|---|
| 0.6 Compact-type duality | ST02 lines 547–568, Corollary 3.3, p. 14 | Compact-type/nuclear-Fréchet duality and the module/representation correspondence match. The topology and continuity conditions are retained. |
| 0.7 Matrix coefficients | DLB17 lines 1153–1166, Lemme 5.9, pp. 28–29 | Continuity for compact-type locally analytic W matches; the proof uses the dual Fréchet space and the weak-null-sequence result. |
| 1.2 Strong admissibility and irreducibility | EM17 lines 5886–5906, Definition 6.2.1 and Proposition 6.2.2, p. 117; lines 5927–5938, Proposition 6.2.4, p. 118; ST03 lines 1407–1441, Theorem 6.6, pp. 35–36 | The definition, compact-open Banach argument and smooth comparison match. The proposition number is R12 and abstract simplicity is R01. |
| 1.7 Ext | SCH11 lines 986–999, Definition 3.1 and (3.2), p. 65; DING25 lines 1447–1465, §3.1.1, p. 36 | Order of the two duals and the all-distribution-modules category match; central character becomes its inverse. |
| 2.1 Nonunitary admissible Banach category | ST02B lines 514–540, Lemma 3.4, pp. 14–15; EM17 lines 5999–6011 and 6072–6077, §§6.2.9–6.2.16, pp. 119–121 | Compact-open finite generation and unitary restriction are supported. Abelian/strict conclusions are correct with R12's locators. |
| 4.3 Generalised Vermas | OS15 lines 356–366, Example 2.10, p. 9; HUM08 §§9.3–9.4 | The displayed quotient by the simple-root Verma images matches OS15. The book-only general classification/maximal-parabolic citations remain uncertified, as recorded below. |
| 4.6 Kostant homology | SCH11 lines 1787–1804, (4.40)–(4.42), Theorem 4.10, p. 82; ALS.4.5 and its declared gap | The homology/contragredient conversion is necessary and agrees in rank one. The full split-group Kostant theorem is explicitly a supplier contract, not silently inferred from the narrower ALS setting. |
| 5.3 Torus extensions | DING25 lines 410–416, §2.1, p. 10; lines 779–780, (2.17), p. 19; lines 1616–1624, proof of Lemma 3.5, p. 40 | Positive-rank dimensions and character Ext computation match. The package introduced the n=0 overclaim in R03. |
| 6.1 Orlik–Strauch construction | BR16 lines 308–336, Lemma 2.1, (5)–(7), pp. 8–9; lines 406–415, Theorem 2.3(i)–(ii), p. 10; OS15 lines 860–866, Proposition 4.8, p. 22 | Dual generating weight, annihilator, independence and admissibility agree. Properness in the torus Check is R03, not part of this construction theorem. |
| 6.5 Jordan–Hölder and socles | OS15 lines 1692–1719, §6.2, pp. 41–42; BR16 lines 435–470, Proposition 2.4/Corollary 2.5, pp. 10–12; OR19 lines 42–54, Theorem 1, p. 2 | Filtration reversal, multiplicities, invariant-weight socle and the specifically locally-L-analytic/trivial-smooth-input full-faithfulness clause match. Small-prime scope remains R07. |
| 6.7 Ext¹ vanishing | DING19 lines 1082–1106, Lemma 2.26 and proof of Proposition 2.27, pp. 29–30 | Dominant μ, Levi dominance, length greater than one, locally algebraic source, and the Hom-vanishing needed for push-forward are present. |
| 8.5 Constituent labels | DING25 lines 1498–1524, Proposition 3.1/Lemma 3.2, pp. 37–38 | The package correctly repairs the inverse-image subset label and the inducing-weight sign; see computations below. |
| 8.11 Ext¹ into PS₁ | DING25 lines 1637–1652 and 1692–1701, (3.10), Proposition 3.6, p. 41, Remark 3.9, p. 42 | The map and dimension n(1+d_L) match; its character domain is T(L), including all embeddings. |
| 8.12 Ext¹ into π₁ | DING25 lines 1659–1691, Proposition 3.8 and (3.12)–(3.15), pp. 41–42 | Full nonempty proper subsets of {1,…,n} give the stated dimension; the source's shorter index set is correctly repaired. |
| 10.7 σ-analytic endpoints | DING25 lines 2027–2028 and 2054–2059, Proposition 3.19, Proposition 3.20/(3.37), pp. 50–51 | σ-analytic endpoint amalgamation and its common subspace match. The explicit n≥2 convention excludes nonexistent endpoints. |

The manifest has 29 works and 29 distinct keys: 26 certified entries and SCHN11, NFA02, HUM08 marked uncertified. Every reference work is represented. Existing source keys were reused; no new source was needed and the manifest was not edited. Source numbers above refer to the cached, line-numbered editions, not inferred journal/preprint concordances.

### Computed adversarial table

These are consistency and counterexample calculations, not claims to have proved the deep theorems. All 86 numbered target sections, their definitions/APIs/Checks and the nine standing conventions were read. The table records the sampled targets, headlines, repair changes and every mathematical finding; it also records the decisive additional tests. Hypotheses restricting to characteristic zero, finite extensions of ℚ_p, Hausdorff spaces, admissibility, and n≥2 for endpoint parabolics were retained. Thus zero coefficient rings, equal-characteristic local fields and q=1 are outside the stated field hypotheses, not untested implicit exceptions. The rank-zero case actually admitted in §5.3 is tested explicitly.

| Statement | Instances tried | Values computed on the two sides | Result / change |
|---|---|---|---|
| Conventions 1, §0.1: embedding decomposition | L=ℚ_p(√p), E containing √p, including p=2 | √p⊗1 maps to (√p,−√p); E-dimensions 2 and 2; √p≠−√p in characteristic zero | Consistent even when ramified and p=2 |
| Convention 3: contragredient | E-line with a acting by a | a acts on the dual by a⁻¹; evaluation pairs a⁻¹λ with av to λ(v) | Correct inverse |
| Convention 5: average and modulus | GL₂(ℚ₂), diag(2,1), N(ℤ₂), trivial module | Index 2; δ_B=1/2; average (1/2)(1+1)=1; unaveraged action 2 | Correct; wrong normalisation distinguished |
| Conventions 6–7: permutations and η | n=3, w=(123) | w(φ)=(φ₃,φ₁,φ₂); character on coordinate 1 moves to coordinate 2; η(t)=ν(t₂)ν(t₃)² | Correct inverse-permutation convention |
| §0.2 representation law | G=S₃, its permutation representation E³ | ρ((12))ρ((23))e₃=e₁=ρ((123))e₃; reversed product sends e₃ to e₂ | Nonabelian law distinguishes order |
| §0.3 differentiation | χ(a)=(1+p)^a on a sufficiently small additive open subgroup | dχ(1)=log(1+p); contragredient derivative is −log(1+p); trivial χ gives 0 | Correct sign; choose a smaller open subgroup at p=2 |
| §0.4 noncompact distributions | Discrete G=ℤ, H=1 | D(G,E)=E[t,t⁻¹]; compactly supported distributions have finitely many nonzero coefficients, not an arbitrary product E^ℤ | Direct sum convention consistent |
| §0.5 action | Trivial representation, δ_g and δ_1 | Both act as 1; δ_g−δ_1 acts as 0 | Nonfaithful action is allowed |
| §0.6 duality (sample) | G=1, V=0 and E² | Bidual dimensions 0=0 and 2=2; evaluation e_i on e_j gives δ_ij on both sides | Consistent; rules out replacing the dual by zero |
| §0.7 coefficients (sample) | Finite G, regular functions, λ=ev_1; λ=0 | F_λ(f)(g)=f(g); F_0(f)(g)=0 | Identity and zero are continuous; domain hypothesis retained |
| §0.8 weak nullity | e_n in c₀, and p^n e_n | Norms 1 and |p|^n; constant bounded functional gives 1 on e_n, while bounded functionals give values tending to 0 on p^n e_n | Agrees with the claimed equivalence |
| §§0.9, 1.5 external tensor | V₂=E or 0; E²⊗E³ | V₁⊗E=V₁, V₁⊗0=0; dimensions 2·3=6 on space and dual | Unit/zero/duality consistent |
| §1.1 coadmissibility | Discrete G=ℤ | H=1 so coadmissible means finite E-dimension; E is allowed, E[t,t⁻¹] has infinite dimension and is excluded | Correct compact-open test |
| §1.2(iii), R01 | Smooth Steinberg of GL₂ | Closed-submodule lattice has 2 elements; full dual contains 0⊊V_sm^∨⊊V′; δ₀−δ_∞ is in V′ but not V_sm^∨ | False algebraic simplicity; replace by closed simplicity |
| §1.2(iv), repaired F03 | χ=x on ℚ_p^× | H=ℤ_p^× preserves O_E; p·O_E=pO_E≠O_E; analytic dual has one generator over D(H,E) | Repaired compact-open argument works |
| §1.3 anti-equivalence (headline) | Discrete C₂ and S₃; E² for S₃ | Ordinary duality preserves dimension 2 and reverses arrows; transpose of an injection has rank equal to source dimension | Finite-dimensional specialisation consistent; nonabelian actions use g⁻¹ |
| §1.4 strict category, F01 | Zero map E²→E³ | Kernel dimension 2; image dimension 0, closed; cokernel dimension 3 | Correct repaired statement; finite-length chains reverse under duality |
| §1.6, R02 | c₀ with trivial action, W=E | V_(W-lalg)=c₀; ‖p^n e_n‖→0 but Hamel functional values are all 1 | Finest-topology assertion false without admissibility |
| §1.6, repaired F04 | Π=E² trivial | Hom_g(1,Π)=E², dimension 2; other irreducible algebraic-type multiplicities 0; evaluation image E² | Agrees with supplier's Π^alg |
| §1.7 Ext (sample) | T=ℚ₂^×, trivial character | Valuation and logarithm give dimension 2; smooth characters dimension 1; dual character remains 1 | Torus Ext¹ computation consistent at p=2 |
| §1.8 Ext¹/extensions (headline) | G=S₃, E=ℚ₂, finite-dimensional modules | 6 is invertible in E; averaging splits extensions; Ext¹=0 and all extension classes split | Consistent despite residue characteristic dividing group order |
| §1.9 dual-number extension | ψ(g)=1 for a chosen generator | g acts by [[1,1],[0,1]]; ε acts by [[0,1],[0,0]]; ε²=0 and ε≠0 | Distinguishes genuine first-order deformation from trivial ε-action |
| §1.10 low-degree comparison | GL₂, trivial algebraic type, fixed central character | Hom(PGL₂(ℚ_p),E)=0; without fixing centre Hom(ℚ_p^×,E)∘det has dimension 2 | Centre restriction matters; unchanged computed comparison retained |
| §2.1 (sample) | χ=x on ℚ_p^×; trivial c₀ | Compact-open invariant norm equals usual norm on χ; c₀ dual has infinite E-dimension and augmentation acts by 0 | First admissible, second not; R12 is locator-only |
| §§2.3–2.5 strong LA-acyclicity (headline) | Finite G, uniform open subgroup 1 | LA is identity; H⁰=B, H^i=0 for i>0; transition maps on higher groups are 0 | Both strong-zero systems and vanishing hold |
| §3.1 classical/solid comparison | Finite-dimensional E² | Dual dimension 2, Hom(E²,E²) dimension 4=2·2; V⊗E=V | Agrees with tensor/dual comparison; infinite-dimensional Banach and Smith roles are not exchanged |
| §3.2 analytic coaction | Trivial representation of an analytic group | Coaction v↦1⊗v; both iterated coactions send v to 1⊗1⊗v; counit sends it to v | A zero coaction fails the counit unless V=0 |
| §§3.4–3.5 solid group ring and smoothness | Finite S₃; x^k on ℤ_p^×, k≠0 | Finite group ring has 6 basis elements; for arbitrarily small units u, u^k≠1 | Finite group object is smooth; algebraic nontrivial character is not smooth |
| §3.7 Grothendieck headline | G=1, finite-dimensional inclusions E^m→E^(m+1) | Colimit is ⊕_ℕ E; kernel of each inclusion 0 and induced kernel 0 | Elementary exact-colimit instance agrees; this is not a proof for all solid objects |
| §3.8 derived comparison (headline) | G=1; analytic character χ | Both derived vector functors give H⁰=V, H^i=0; right translation on χ yields χ(h), a second diagonal twist would yield χ(h)² | Residual-action choice is correct |
| §3.9 cohomology comparison | G=ℤ_p, coinduced C(G,E) | H⁰=E, higher cohomology 0 by coinduced acyclicity | Consistent with the retained compact hypothesis |
| §3.10 integrability | Zero module and finest-topology sl₂ Verma | 0 has stable stage 0; lowering operator gives linearly independent v,fv,f²v,…, hence no finite-dimensional stable stage containing v | Distinguishes completed integrable objects from the uncompleted Verma |
| §§4.1–4.3 (sample), R09 | Torus; gl₃ weight (2,0,1); sl₂ weights 0,−2 | Torus M(μ)=L(μ), dimension 1; simple-coroot pairings 2,−1 give I={α₁}; M(0) has 2 simple factors, M(−2) has 1 | Algebraic examples consistent; same sl₂ objects also constructed by Springer |
| §4.4 BGG dual | gl₂ standard representation | BGG-dual highest weight (1,0); ordinary contragredient highest weight (0,−1) | Two duals correctly distinguished |
| §4.5 low-length layers | n=2, λ=(1,1); n=3 | s·λ=(0,2), lower weight (0,−2); n=2 second layer has 1 summand, n=3 has 2 | Correct dot-action and low-length counts |
| §4.6 homology (sample) | GL₂, λ=(k,0) | Lower H₀ weight (k,0), H₁ weight (−1,k+1); upper H₀ (0,k), H₁ (k+1,−1) | Dualised Kostant formula agrees; unadjusted cohomology formula would not |
| §§5.1–5.2 induction and F04 | G=T; GL₂ Weyl swap | Ind_T^Tχ=χ; w⁻¹diag(t₁,t₂)w=diag(t₂,t₁); both central characters η₁η₂ε⁻¹ | Identity and repaired supplier comparison correct |
| §5.3 (sample), R03 | n=0,1,2; d_L=1 or 2 | n=0: 0 versus claimed d_L; n=1,d=1: Hom=2, smooth=1, g′=2; n=2,d=2: 6,2,4 | Repair rank-zero formula only |
| §5.3 different characters | χ′=χν, t=ϖ_L | χ′(t)−χ(t)=χ(t)(q⁻¹−1)≠0; same derivative but distinct scalars; Ext^i=0 | Group-character separation needed, not derivative separation alone |
| §§5.4–5.5 spectral sequence (headline) | GL₂, Σ=1, lower Borel, ρ=z^((0,2)) | H₀ weight (0,0), H₁ weight (−1,1); neither equals (0,2); relevant Ext terms and total Ext vanish | Weight conventions consistent |
| §6.1 (sample), R03 | Lower Verma of weight μ; torus | Generator dual weight −μ, so inducing character z^(−μ)χ; torus finite-dimensional formula and induction both have dimension 1 | Sign correct; torus properness false |
| §6.2 exactness | 0→K→M⁻(−λ)→L⁻(−λ)→0 | Contravariance gives 0→F(L)→F(M)→F(K)→0; lengths add 1+1=2 for generic rank-one example | Correct direction |
| §§6.3–6.4 (headline), R04 | GL₂ raw ratios 1,ν,ν^(−2) | Normalised ratios ν,ν²,ν⁻¹; smooth lengths 2,1,2 respectively | Existing Checks use the wrong exceptional set |
| §6.4 uniqueness, R05 | Torus M₀,M₁ and zero smooth arguments | Outputs 0=0; highest weights 0≠1; with smooth input 1 output weights 0 and −1 | Nonzero hypothesis required |
| §§6.4–6.6 scope, R07 | Type C₂,p=2; type G₂,p=3 | Rank 2 and valid local groups in both cases; source restrictions exclude both (2≤3,3≤3) | General-library coverage fails |
| §6.5 JH/socle (sample/headline) | Generic GL₂ and GL₃ principal series | Lengths 2 and 6; rank-one algebraic socle has multiplicity 1; GL₃ six Weyl factors each multiplicity 1 | Consistent in cited range |
| §6.6 product, R04 | Generic GL₂ over degrees 1,2; first factor raw trivial χ | Generic lengths 2·4=8; nongeneric first length 3, product 3·4=12 | Add explicit genericity to the numerical Check |
| §6.7 (sample) | GL₃, μ=0, s=s₁s₂ | s·0=(−2,1,1); degree-0/1 weights (0,0,0),(−1,1,0),(0,−1,1) differ; Hom and Ext¹ terms vanish | Length-two vanishing mechanism consistent |
| §7.1 adjunction | GL₂ trivial V, U=δ_B⁻¹ | Uδ_B=1; right-hand Hom dimension 1; compact-support integration gives left-hand dimension 1 | Modulus twist retained |
| §7.2, R06 | ℚ₃^× on E², 3↦[[0,3],[1,0]] | Characteristic polynomial X²−3 irreducible; dim J_G(V)=2; dim Ind_G^Gχ=1 | Character-over-E claim false; finite-dimensional U repairs it |
| §7.3 closed induction, R03 | G=T and smooth χ | I(χ)=χ=Indχ; dimensions 1=1 | Properness needs positive semisimple rank |
| §§7.5–7.6 adjunctions (headlines) | GL₂, trivial action, contracting diag(p,1) | Unaveraged Hecke action p; average 1; multiplying unaveraged by δ_B=p⁻¹ gives 1 | Emerton/Breuil convention conversion consistent |
| §§8.1–8.3 GL_n data | n=2, h=(1,0); n=3 blocks (2,1) | θ=(0,−1), λ=(1,1); θ^P=(0,0,−2); ηz^λ=ν(t₂)t₁t₂ | Weight and modulus conventions consistent |
| §§8.4–8.5 (sample) subset labels | w=(123), w′=(23)w, i=1 | w⁻¹({1})=w′⁻¹({1})={3}; forward images {2} and {3} differ | Inverse-image correction is necessary |
| §8.5 (sample) weight sign | n=2, λ=(1,1) | s·λ=(0,2); z^(s·λ) central exponent 2 equals PS central exponent 2; negative sign gives −2 | Package's source correction is correct |
| §§8.7–8.8 ζ on self-extensions (headline) | n=1,d=1; n=2,d=1 | Dimensions 2=1+1; n+d=3=2 smooth directions+1 determinant logarithm | Consistent |
| §8.9 constituent Ext lines | n=2, λ=(1,1) | H₁ lower weight (0,2) matches constituent inducing weight; H₀ (1,1) does not; Ext¹ dimension 1 | Correct degree-one contribution |
| §8.10 total ζ map | n=2,d=1 | Two character spaces give source dimension 2·4=8; target dimension 5; kernel dimension 3 | Surjective map cannot be injective, as stated |
| §8.11 (sample/headline) | n=2,d=1 and d=2 | Ext¹_T(ρ,ρ) dimensions 4 and 6; Hom_T(H₁,ρ)=0; target dimensions 4 and 6 | Matches n(1+d_L) |
| §8.12 (sample/headline) | (n,d)=(1,2),(2,1),(3,1) | n+d+(2^n−2)d gives 3,5,10; n+(2^n−1)d gives 3,5,10 | Correct full-subset index set |
| §§8.13–8.14 amalgam/filtration | n=2,d=1 | Socle A occurs once; two distinct length-one labels give π₁ length 3; Ext dimensions 2⊆3⊆4⊂5 | Agrees with the worked example |
| §§9.1–9.4 parabolic constituents | n=3, partition (2,1) | Labels {1},{2},{1,2}, hence 3 extra lines per embedding; d=1 extension dimension 3+1+3=7 | Correct endpoint count |
| §9.5 tensor-extension construction | Three factors, dim A_i=1, dim B_i=2 | First graded piece dimension Σ_i 2·1·1=6; using two B factors would give 12 | Kernel/first-filtration convention correct |
| §9.6 parabolic ζ (headline) | n=3, partition (2,1), d=1 | Block extension dimensions (2+3)+(1+1)=5+2=7; target n+(1+3)d=7 | Numerical compatibility retained; construction is the specified sum/pullback map |
| §9.7 endpoint amalgamation (headline) | n=3,d=1 | Endpoint dimensions 7,7; common dimension 4; 7+7−4=10=3+(8−1) | Correct |
| §§10.1–10.6 σ-decomposition (headline) | n=3,d=2, fixed σ | σ-space dimension 10, smooth/common dimension 3; two embedding quotients give 3+2(10−3)=17=3+7·2 | Distinguishes σ-analytic from full analytic dimensions |
| §10.7 (sample/headline) | n=2 and n=3, fixed σ | Endpoint sums 4+4−3=5=2+3; 7+7−4=10=3+7 | Correct σ-analytic endpoint identity |
| Gap/native Banach–Steinhaus, R16 | E=ℚ₂, maps x↦ax, a∈ℤ₂ | sup_a |ax|=|x|; operator bound 1 in both lattice and seminorm formulations | Native theorem already applies; only comparison/remaining instances need supply |

For §9.6 the source is the product of the block Ext spaces, not merely the block character spaces: 5+2=7. Independently, the three constituent labels and the 4-dimensional self-extension space give 3+4=7.

### Pinned declarations, ownership and supplier resolution

The board-package index was read before making existence judgments. The main-branch shape comparison used `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md`, `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md` and `TauCetiRoadmap/ReductiveGroupsPartII/README.md`. Their text was treated as data, not instructions. Open-head object searches used `roadmaps grep`, followed by `roadmaps show` and reading the relevant statements. The precomputed overlap report found no conflicting head changing this roadmap, no dropped supplier ID and no revision-only ID. Those negative index results do not supersede the direct package/consumer findings R08–R10.

| Pinned object opened | Exact file and line | What the declaration does and does not supply |
|---|---|---|
| Root `Ext` | `Mathlib/CategoryTheory/Abelian/Ext.lean:41` | Projective-resolution Ext functor with linear abelian/enough-projectives hypotheses. R13 corrects its namespace. |
| `CategoryTheory.Abelian.Ext` | `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118` | Derived-category Ext with `HasExt`; this is a distinct API, not the first file's declaration. |
| `DualNumber`, `DualNumber.eps` | `Mathlib/Algebra/DualNumber.lean:46`, 50 | Native trivial square-zero extension and ε=(0,1); no invented first-order coefficient carrier is needed. |
| `UniversalEnvelopingAlgebra`, `.lift` | `Mathlib/Algebra/Lie/UniversalEnveloping.lean:65`, 92 | Native enveloping algebra and universal property; no category O or analytic induction is built into it. |
| `continuousCohomology` | `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:131` | Homology of continuous homogeneous cochains. It supplies neither Pan's analytic stage functor nor its acyclicity theorem. |
| `TopRep` | `Mathlib/RepresentationTheory/Continuous/TopRep.lean:31` | Bundles a topological module and continuous representation; the fields do not impose compact type, admissibility, Hausdorffness or barrelledness. Those cannot be inferred from the carrier alone. |
| `LieGroup`, `IsUltrametricDist` | `Mathlib/Geometry/Manifold/Algebra/LieGroup.lean:72`; `Mathlib/Topology/MetricSpace/Ultra/Basic.lean:47` | Analytic group and ultrametric-distance predicates exist. They do not supply an analytic representation category. |
| `LocallyConvexSpace` | `Mathlib/Topology/Algebra/Module/LocallyConvex.lean:51` | Requires an ordered scalar semiring; it is not directly the O_E-lattice definition. |
| `BarrelledSpace` and Banach–Steinhaus | `Mathlib/Analysis/LocallyConvex/Barrelled.lean:90`, 122, 164, 192 | General nontrivially normed scalar fields are allowed for the theorems. Baire/Fréchet/Banach instances and uniform boundedness must be reused; R16 isolates the missing comparison. |
| `TauCeti.completedGroupAlgebra` | `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145` | Inverse-limit completed group algebra, not the locally analytic distribution algebra or its Fréchet–Stein structure. |
| `TauCeti.VermaModule`, `TauCeti.irreducibleQuotient` | `TauCeti/Algebra/Lie/HighestWeight/Verma.lean:195`, 525; hypotheses at 140 | Native Killing Lie algebra construction, with characteristic zero, finite dimension, Cartan and triangularisability data. Reductive central characters and category-O objects require additional interfaces. |
| `TauCeti.AnalyticStage`, `TauCeti.LocallyAnalytic` | `TauCeti/NumberTheory/Padics/Distribution/AnalyticStage.lean:107`; `TauCeti/NumberTheory/Padics/Distribution/LocallyAnalytic.lean:45` | Banach coefficient stages on ℤ_p and their algebraic direct limit. Evaluation exists; the limit has no topology (line 30). R13 corrects the blanket absence claim. |

Object searches covered distributions/convolution, coadmissibility/Fréchet–Stein systems, analytic stages, parabolic induction, Jacquet modules, highest weights/category O, Banach duality, analytic vectors and solid coefficients. No native general D(G,E), coadmissible-representation category, Orlik–Strauch functor or locally analytic Jacquet carrier was found. Generic `Rep`, `TopRep`, Lie modules, continuous functions and Ext do not encode their missing structures. In particular no extra sorried theorem is justified by replacing these objects with arbitrary data.

Cross-roadmap references were resolved as follows. Line numbers are those of the roadmap README at the stated main/head, not the line-numbered source cache.

| Supplier or nearby roadmap | Resolved sections and witness | Assessment |
|---|---|---|
| PadicLocalLanglandsForGL2Qp, open #1312 | `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:205` (§0.1), 207–228 (functions, distributions, analytic comparison, compact duality/Banach theory); 749 (§2.4); 1589 (§4.8) | Supplies the general compact foundations and the GL₂ special cases. The repaired Weyl-swap and ε-twist agree. |
| LocallyAnalyticDistributions, open #854 | `TauCetiRoadmap/LocallyAnalyticDistributions/README.md:891` (§0.0); targets at 895, 910, 925, 957, 973; §0.2 at 1093, 1107, 1135; F-analytic comparison at 1376 | Named locally convex/tensor/strict/open-mapping targets exist. The comparison at 1376 is restricted to O_F, so the general statement needs R08's different owner. |
| LocallyAnalyticDistributionsPartII, board package | `packages/LocallyAnalyticDistributionsPartII/README.md:20`, 21, 55, 57, 141, 164, 248 | Its package supersedes the ND design identifiers; R08. Its §4.4 is a compact-subgroup, right-equivariant principal-series model used for infinitesimal central specialisation, not the full reductive-group induction/Jordan–Hölder theory here. |
| CompletedCohomologyPartII, open #1035 | `TauCetiRoadmap/CompletedCohomologyPartII/README.md:183` (F.1), 241 (F.4), 243–245 (analytic vectors/RLA/actions) | General analytic-vector carrier and continuous derived functor are imported. Pan's strong stagewise acyclicity remains this package's addition. |
| OverconvergentAutomorphicForms, open #1422 | `TauCetiRoadmap/OverconvergentAutomorphicForms/README.md:315` (§0.6, through 396) | Character spaces, essential admissibility, finite slope, averaged Hecke action and Jacquet comparisons exist. Its analytic induction in §0.4 is a coefficient/radius model; the generic representation-theoretic induction and Ext theorems are different. |
| SmoothRepresentationsOfLocalGroups, open #1688 | `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:623`, 643, 704, 871, 932 (SR.0); 1677, 1858 (SR.0d); 1918, 1937, 1981, 1991 (SR.2.1); 2047, 2095, 2116, 2193, 2207 (SR.2.2); 2624, 2691, 2799, 3002 (SR.3) | Each cited named object exists. Induction uses f(hg)=σ(h)f(g), right translation. Jacquet exactness keeps invertible pro-orders. Principal-series/finite-length/Bernstein statements over ℂ do not silently supply the finite-E refinements: the four declared smooth gaps are warranted. |
| ReductiveGroupsPartII, main | `TauCetiRoadmap/ReductiveGroupsPartII/README.md:619`, 640, 746 (RG2.0.2); 5834 (RG2.4.2); 6289 (RG2.4.4) | Analytic rational points, Iwahori and Iwasawa inputs are present. |
| ReductiveGroups, main | `TauCetiRoadmap/ReductiveGroups/README.md:1030`, 1230, 2253 (Layers 1,2,7) | Algebraic representations, Lie and reductive structure are present. |
| LieHighestWeight, main | `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:405`, 537, 567, 931, 1432 (Layers 3,4,5,7,9) | Verma/classification/semisimplicity/centre/reductive interfaces exist. Native Killing objects are used, not renamed. The general category-O construction is additional, subject to R09. |
| ArithmeticLocallySymmetricSpaces, open #871 | `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md:3593` (ALS.4.5) | The theorem is in its arithmetic Weil-restriction setting. The general split-reductive Kostant contract is precise and is not treated as already implemented. |
| VStackSheavesAndLisseCategories, open #1230 | `TauCetiRoadmap/VStackSheavesAndLisseCategories/README.md:652` (VS2.1); 733–739 (VS2.2) | Derived solid tensor and solid nonarchimedean coefficients are owned there. Its text assigns classical functional-analytic comparison to the consumer, so Layer 3's comparison is not duplicate ownership. |
| AdicSpacesPartIII, main | `TauCetiRoadmap/AdicSpacesPartIII/README.md:10053` (R3.4), 10126 and 10139 (Theorems B and A); old target map at 591–594 | Quasi-Stein results and the old-ID mapping exist. No supplier drift finding here. |
| PadicMeasuresIwasawaAlgebras, main | `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:909` (§1.7), 914 | Integral measures/completed-algebra comparison is present. It is not the general solidified group ring construction. |
| CompletedCohomologyAndLocalGlobalCompatibility, open #1270 | `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/README.md:6` (Scope) | Arithmetic/global comparisons and the specialised GL₂ inputs differ from the general local library here. |
| TriangulineVarietyAndItsLocalModel, open #1829 | `TauCetiRoadmap/TriangulineVarietyAndItsLocalModel/README.md:18`, 115–121 | Imports this package's genuine constituents; no duplicate construction, but its LR citations require R10. Its geometric/deformation objects remain downstream. |
| SpringerResolutionAndCharacteristicCycles, open #1828 | `TauCetiRoadmap/SpringerResolutionAndCharacteristicCycles/README.md:21`, 1210–1238 | Strict principal category O plus locality/geometric comparisons; overlapping general foundations are R09. |

The supplied open-head tools were used; no unavailable open pull request was searched independently via GitHub. Ownership was checked against readable indexed heads and local board packages, not against inaccessible files of every other open pull request. No assertion that a roadmap exists nowhere is needed for this verdict.

The seven gap slugs in `design/plan.json` agree exactly with the seven README contracts. All have named earlier suppliers. The compact-type tensor comparison, split-reductive Kostant generalisation, generic finite-coefficient induction, finite-coefficient Jacquet decomposition, finite length and ordered-character map ask for identifiable missing refinements. The barrelled gap is overbroad for the specific reason in R16. No finding arises merely from a declared gap's absence in its supplier today.

The required roadmap-level dependency command completed successfully. Its complete output was:

```text
depcheck: 236 roadmaps, 2144 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Every Needs line and supplier contract was read; the result checks roadmap direction, not whether ND sections still exist or whether the internal theorem order is executable. Those are R08 and R15. No prohibited supplier was used by this package.

### Headline coverage, Lean checks and shape

The Summary and end-theorem passages yield the following headline groups. All are explicitly accounted for in the module docstring; none has an adequate carrier at the pins which could be supplied by just a few simple native definitions.

| Headline targets | Missing carrier/interface named in Suggested.lean | Disposition |
|---|---|---|
| §1.3 anti-equivalence and §1.8 Ext¹ as admissible extensions | General locally analytic representations, D(G,E), coadmissible modules | Named in docstring, no stand-in |
| §2.5 Pan strong LA-acyclicity | General p-valued-group analytic stages and admissible Banach category | Named; native ℤ_p analytic stages do not suffice for the general theorem |
| §§3.7–3.8 Grothendieck smooth-solid category and derived comparison | Solid E-vector spaces over E_■ and corresponding group rings/analytic-vector functors | Named, no replacement by discrete coefficients |
| §5.5 Schraen spectral sequence | Locally analytic induction and topological nilradical homology | Named, no abstract arbitrary-complex substitute |
| §§6.4–6.5 Orlik–Strauch irreducibility and Jordan–Hölder theory | Parabolic category O and the actual functor | Named; prose defects R04–R07 remain |
| §§7.5–7.6 Emerton/Breuil adjunctions | Jacquet, closed induction, very strong admissibility | Named, no bare-Hom tautology |
| §§8.8, 8.11–8.12 ζ isomorphisms and n+(2^n−1)d_L dimension | Actual π_alg, PS₁, π₁ and their extension groups | Named, no scalar dimension surrogate |
| §§9.6–9.7 parabolic bijectivity and endpoint amalgamation | Parabolic π_(F_P), extension maps and actual subspaces | Named |
| §§10.5–10.7 embedding-wise decomposition and σ-endpoints | σ-analytic representations and their Ext subspaces/maps | Named |

`lake env lean` on the absolute package Suggested.lean path, run from the pinned content checkout, exited 0 with no output and no warning. No TauCeti module is imported, so no targeted object-file build was needed. The prescribed-header scratch copy also exited 0 with no output. No Lean command remains running.

There are **zero declarations, zero sorried theorems, zero definitions, zero instances and zero admitted examples** in the file. Accordingly the exhaustive one-tactic probe set and the own-declaration `#check @name` signature set are both empty; there was nothing to execute or compare. There is no padding, sorry'd data, free-Prop surrogate, hidden section-variable loss or set_option. There is no statable omitted headline identified by this audit. The import spelling is nevertheless R14, and the inaccurate native-function absence wording is R13. Every backticked name attributed to this roadmap was checked: none is claimed in the README, consistent with the empty namespace.

The README has the prescribed main headings, 11 mathematical layers, Examples and Dependencies sections, and explicit hypotheses/routes/locators. The 32 subsections detected by an explicit “define” sentence each have 3–6 Check bullets; the other defining passages (including §§1.7, 3.5, 8.1 and 9.1) also retain their Checks. The issue is the mathematical content of some Checks, not a numerical quota. No computational algorithm, source passage copied as prose, machine path, pull-request number, LaTeX delimiter or process instruction was found in the package's roadmap text. Metadata remains the topic `math.RT`. The organisation and build-order exceptions are recorded in R11 and R15 rather than hidden by a blanket shape approval.

## Not verifiable

- SCHN11, *p-Adic Lie Groups*: §13 p. 90 and Proposition 6.4 pp. 42–43, used by §0.1. The manifest settles this book as uncertified; its text was not available. No new request was made.
- NFA02, *Nonarchimedean Functional Analysis*: §6, used for the barrelled-space supplier contract. The manifest settles it as uncertified. R16 relies on opened pinned declarations, not a guess about this book.
- HUM08, *Representations of Semisimple Lie Algebras in the BGG Category O*: §§3.2, 9.3–9.4, Theorems 3.3, 4.6, 5.1 and Proposition 9.3. These book-only parts of §§4.3–4.5 cannot be certified against the text. The available OS15 and SCH11 passages and the explicit rank-one computations were checked independently.
- Ownership against open pull requests without readable files in the provided/indexed material was not checked. The report's concrete overlap findings name the opened heads and exact locations; it makes no exhaustive claim about inaccessible heads.

No unread source was guessed, no settled source was requested again, and no package input was edited to make a check pass.

## Source issues

- **Error** in BR16 at Corollary 2.7, printed p. 12: the source says equal Orlik–Strauch outputs recover both inputs for arbitrary finite-length smooth arguments; it should be restricted to nonzero smooth arguments, since both zero arguments erase the highest weight; affects a stated result.
- **Error** in EMJ1 at Theorem 0.6, printed p. 778: the source says an irreducible representation with nonzero Jacquet module is a subquotient of character induction over the fixed coefficients; it should be allowed finite-dimensional inducing data obtained by restricting scalars from a finite extension; affects a stated result.
- **Error** in SCH11 at Proposition 4.7(2), printed p. 80: the source says fixed-central-character Ext vanishes away from its first nonzero smooth degree through two further degrees; it should be compared with smooth Ext in degrees at most two, as its spectral sequence gives; affects a stated result.
- **Misprint** in DING25 at (3.1) and Lemma 3.2, arXiv v2 p. 37: the source says the inducing algebraic weight is −s·λ; it should be +s·λ, since the generating category-O weight is dualised; affects nothing.
- **Misprint** in DING25 at the paragraph after Proposition 3.1, arXiv v2 p. 37: the source says the subset label is w({1,…,i}); it should be w⁻¹({1,…,i}), invariant under the specified left parabolic Weyl coset; affects nothing.
- **Misprint** in DING25 at Lemma 3.2(1), arXiv v2 p. 37: the source says the Hom is over T(ℚ_p); it should be over T(K), with K the local field of the representation; affects nothing.
- **Misprint** in DING25 at (3.12) and (3.15), arXiv v2 pp. 41–42: the source says subsets of {1,…,n−1} index the extension lines; it should be nonempty proper subsets of {1,…,n}, giving (2^n−2)d_K lines; affects a stated result.
- **Misprint** in BCGP25 at §2.2.27, printed p. 23: the source says the evaluation map uses radius r′; it should be radius r of the analytic vectors just defined; affects nothing.
- **Misprint** in DLB17 at the proof of Lemme 5.9, printed p. 29: the source says W is Fréchet when testing continuity of the transpose; it should be W′, the nuclear Fréchet dual of compact-type W; affects nothing.
- **Gap** in DLB17 at Lemme 5.10, printed p. 29: the source says weakly null sequences are null over a spherically complete field without supplying a proof; it should be justified by nonarchimedean Hahn–Banach and a gliding-hump argument on seminormed quotients; affects the proof.
