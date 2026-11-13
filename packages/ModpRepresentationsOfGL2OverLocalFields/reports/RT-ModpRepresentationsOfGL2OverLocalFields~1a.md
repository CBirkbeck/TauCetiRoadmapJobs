<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13474#issuecomment-6857257641 -->
Red team round 1 pass a (codex) of d6f2f83

Verdict: needs_changes

1. **F01** (P1) The augmentation-filtration comparison admits non-pro-p groups

   **Location:** `packages/ModpRepresentationsOfGL2OverLocalFields/README.md:1486`, §4.2: “Let `U` be compact analytic without `p`-torsion”.

   **Claim:** The augmentation-graded support computes canonical dimension under the listed hypotheses.

   **Witness:** Take `p=5`, `U=C₂`, `k=𝔽₅`, and the sign module `M=k`. Then `R=k×k`, `𝔪=0×k=𝔪²`, `gr R=k`, `gr M=0`, but `j_R(M)=0`. Thus the two dimensions are `0` and `−∞`.

   The `𝔪`-adic filtration is the image filtration of a finite free presentation (a good filtration); it is not separated. The claimed supplier, NoncommutativeAndEquivariantIwasawa §0.5, requires a complete separated filtration with `F¹R⊆Jac(R)`, whereas here `Jac(R)=0` and `𝔪≠0`. BHHMS23 line 2392 explicitly assumes a pro-`p` group.

   **Exact repair:** Replace the opening with: “Let `U` be a compact analytic pro-`p` group without `p`-torsion, and give `R=k[[U]]` and `M` their augmentation-adic filtrations.” Add the Check: “For `p=5`, `U=C₂` and the sign module, `gr M=0` although `M≠0`; thus the augmentation-filtration comparison requires the pro-`p` hypothesis.” The counterexample is excluded; all uses on `P=I₁/Z₁` remain covered.

2. **F02** (P1) The finite Ext computation is not supplied by the cited block sections

   **Location:** `packages/ModpRepresentationsOfGL2OverLocalFields/README.md:803`, §1.4: “use the finite Ext computation inside a block”.

   **Claim:** PadicLocalLanglandsForGL2Qp §§2.7 and 5.1 provide the input proving finite-dimensional Ext and finite support.

   **Witness:** `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:1688` supplies block decomposition, not finite-dimensional Ext. Its §2.7 classifies irreducibles. The finite block list is §5.2; §5.3 assumes finite Ext in (H4), rather than proving it.

   A block equivalence by itself imposes no bound on Ext dimensions. The reduction in CDN23 line 783 still requires an additional finite-dimensional fixed-central-character Ext theorem, including the exceptional primes.

   **Exact repair:** Add the following to the PadicLocalLanglandsForGL2Qp supplier contracts and add the same slug, supplier and section to the plan's top-level gaps: “What PadicLocalLanglandsForGL2Qp must provide (gap:finite-fixed-central-character-ext1): For every prime p, every finite field k of characteristic p and absolutely irreducible smooth k-representations π and π′ of GL₂(ℚ_p) with the same k-valued central character ζ, Ext¹ in the smooth fixed-central-character ζ category is finite-dimensional over k.” Set the supplier section to §5.1. Replace “extend scalars to `k̄`” in the route with “pass to a finite splitting extension k′ using §0.6 and apply this contract over k′”. Replace the route's dependency with “§0.6; PadicLocalLanglandsForGL2Qp §§2.7, 5.1–5.2; gap:finite-fixed-central-character-ext1”. Finite support then uses the actual finite block list, including its two-element block at p=2 and four-element block at p=3. Ext finiteness no longer follows merely from the word “block”.

3. **F03** (P1) The complete-adic transfer cannot be applied to the PBW filtration

   **Location:** `packages/ModpRepresentationsOfGL2OverLocalFields/README.md:1542`, §4.4: “PBW and §0.5 give Auslander regularity”.

   **Claim:** NoncommutativeAndEquivariantIwasawa §0.5 transfers Auslander regularity from the polynomial PBW symbol ring to the Heisenberg enveloping algebra.

   **Witness:** `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:273` requires a complete separated descending adic filtration with F¹R inside the Jacobson radical. The PBW filtration is increasing; Uₖ(𝔥) contains polynomials, not arbitrary completed PBW series.

   For f=1, PBW degree ≤1 contains 1,e,f,h, and the unbounded sequence 1+e+⋯+eⁿ has no polynomial limit. Reversing the degree index supplies neither an adic filtration nor completeness. BHHMS23 line 2800 instead invokes a theorem about enveloping algebras.

   **Exact repair:** Replace the quoted route with: “The pinned `TauCeti.UniversalEnvelopingAlgebra.pbwAssociatedGradedEquiv` (`TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Injective.lean:213`) gives the polynomial associated graded ring for the free finite-dimensional Lie algebra. Apply the enveloping-algebra Auslander-regularity theorem in gap:enveloping-auslander-regular.” Declare, in the README and plan gaps, supplier NoncommutativeAndEquivariantIwasawa, section §0.5, with needs: “For a field k and a finite-dimensional Lie algebra 𝔤 over k, its universal enveloping algebra Uₖ(𝔤) is Auslander regular.” This covers 𝔤=⊕ᵢ𝔥ᵢ without pretending that Uₖ(𝔥) is complete. Retain §0.5 for its actual complete-filtration applications.

4. **F04** (P1) Enough injectives is cited as existence of injective envelopes

   **Location:** `packages/ModpRepresentationsOfGL2OverLocalFields/README.md:1583`, §4.6; also §5.6 and the supplier contract at line 264.

   **Claim:** SmoothRepresentationsOfLocalGroups SR.0d.1 supplies the injective envelopes whose duals define pseudocompact projective envelopes.

   **Witness:** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:1677` states the Grothendieck property and enough injectives. It does not state essential injective envelopes. `TauCeti/CategoryTheory/Injective/Envelope.lean:101` proves uniqueness of existing envelopes, not existence.

   The finite-dimensional algebra envelope in RepresentationTheory/QuiverRepresentations §3.1 does not cover k[[U]] for infinite U. For U=ℤ_p, the desired dual cover of the trivial character is k[[T]]→k, of infinite k-dimension. An arbitrary injection into an injective object is insufficient: for U=1, k→k² has injective target but is not essential, and its dual is not a projective cover.

   **Exact repair:** Replace the envelope attribution by this construction: “Choose an algebraic k[U]-module envelope τ→E using `TauCeti.exists_isInjectiveEnvelope` (`TauCeti/Algebra/Module/Injective/Envelope/Existence.lean:109`). Set J=E^∞ using SmoothRepresentationsOfLocalGroups SR.0.2, *smooth-rep-category*. The inclusion of smooth representations is exact and its right adjoint is smoothPart, so J is injective. Every nonzero submodule of J meets τ because τ is essential in E. Thus τ→J is an injective envelope; duality gives the pseudocompact projective cover.” State this bridge in §4.6 and cite it from §5.6; replace the contract's envelope attribution to SR.0d.1 by these actual inputs. No new generic envelope existence theorem or supplier gap is needed. Essentiality excludes k→k² and gives the required k[[T]] cover in the ℤ_p test.

5. **F05** (P3) Two first-order hull definitions lack three discriminating Checks

   **Location:** `packages/ModpRepresentationsOfGL2OverLocalFields/README.md:1822`, §5.6 Checks; also §6.7 at line 1992.

   **Claim:** The Checks distinguish the first-order hulls and the multiplicity-preserving tame enlargement.

   **Witness:** In §5.6, bullets 1 and 3 only restate hypotheses. In §6.7 there are just two bullets, and the first restates the invariant-multiplicity formula. Neither definition has three discriminating Checks.

   **Exact repair:** Retain the dimension test and replace the other two bullets by: “For f=1, p=17 and σ=Sym⁵, the hull submodule with cosocle σ and [V:σ]=1 is σ, of dimension 6. For τ=Sym⁹⊗det⁶, it is the nonsplit extension of τ by σ, of dimension 16, and all 16 dimensions are K₁-fixed.” Add: “For f=1, Ext¹_{K/Z₁}(Sym¹⁴,Sym¹⁴)=0, whereas Ext¹_{K/Z₁}(Sym¹⁵,Sym¹⁵)≠0 at p=17 (HW22, Lemma 2.10 and its proof, p.12).” These distinguish the old-weight hull, a nontrivial extension and the actual excluded boundary, respectively (HW22 lines 558–565, 829–831).


   For §6.7, replace its two Checks by: “At f=1, p=23 and μ−η=(10,0), there are two tame weights. With both multiplicities one, V has length 8, V^{K₁} length 4 and V/V^{K₁} length 4.” “For the same parameter and multiplicities 2 and 3, these lengths become 20, 10 and 10; taking one copy of each hull gives 8 instead of 20.” “At f=2, p=23 and r₀=r₁=10, with every m_σ=1, the four disjoint hulls each have length 12; V has length 48 and V^{K₁} length 16.” In both examples 8<11<15 verifies the required depth.

## Verified sound

Read all 2,462 README lines and all 232 Lean lines. The inventory is 60 numbered target sections, six closing worked examples, and 12 Lean declarations (five definitions/abbreviations and seven admitted headline theorems). Examined all 192 Check bullets; the computed tests are recorded below by target, including the failed controls in R01 and the inadequate Checks in R05. Compared 133 named source locators across 17 readable sources, listed below. Resolved 35 distinct supplier sections across 12 roadmaps, including main and the supplied open heads; the discrepancies are R02–R04. These are coverage counts and include the failed and deficient cases reported above.

The seven statable headlines are coherence (§0.5), finite type implying finite presentation (§1.3), bounded semisimple quotients implying finite length (§1.5), the smooth-dual criterion (§1.6), admissible finite presentation implying finite length and the subobject theorem (§2.4), and Banach-lattice approximation (§2.6). Each has a Lean statement. The module docstring identifies the other endpoints: the Iwahori and local Gelfand–Kirillov bounds (§§4.7, 7.6), the lattice realization (§8.6), commutative endomorphisms and relative projectivity (§§9.1–9.3), the ordinary-parts counit (§2.5), and the exclusion of supersingular constituents (§2.4). Their missing smooth representation, ordinary-parts, labelled-weight and pseudocompact carriers are identified. No missing statable headline or one-tactic padding was found among these seven statements.

All 12 supplied elaborated signatures were compared with their declarations and README counterparts. No lost section binder was identified. In particular, the Banach statement retains joint continuity, completeness, the actual lower Borel, the lattice reduction equation and `IsModuleTopology`; the bounded-cosocle statement quantifies its bound before the quotient. The single import is `Mathlib`; there is no `set_option`, sorry'd data, `lemma`, free placeholder predicate, or conclusion repeated as a hypothesis.

The four declared gaps have identical slugs, named suppliers and matching needs in the README and `design/plan.json`. Their statements are specific to compact-induction Ext, invariant codimension, the ordinary classification and ordinary Hecke presentations. The existing all-prime Ext gap is about a compact-induction target, not the irreducible target missing in R02. The two ordinary clauses share the same classification setting rather than asking for unrelated work. They are accepted as contracts, not reported as missing current supplier results.

Ownership searches covered the pinned libraries, main roadmaps, board packages and supplied open heads by object (augmented algebra, smooth finite presentation, ordinary parts, Diamond modules, projective truncations and envelopes, and relative projectivity). The local finite-presentation/weight/lattice work is distinct from the geometric Lubin–Tate/Scholze functor and global completed-cohomology/patching consumers. The scopes of HilbertModularVarietiesAndShimuraCurvesPartII, ScholzeFunctorAndModpCohomologyOfTheLubinTateTower and CompletedCohomologyAndLocalGlobalCompatibilityPartII were compared. No second copy or conflicting owner of these local endpoints was identified. Existing `MP.*` consumer references have the explicit old-to-new mapping at README lines 2355–2397. No duplicate fully qualified Lean declaration was identified.

The read-only diff lists nine changed files, all within `packages/ModpRepresentationsOfGL2OverLocalFields/`; no out-of-package edit is present. The dependency check returned:

```text
depcheck: 223 roadmaps, 1983 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. No build, package implementation edit, git write or external post was made.

### Pinned interfaces checked

| Interface | Pinned evidence and boundary |
|---|---|
| Local-field carrier | `Mathlib/NumberTheory/LocalField/Basic.lean:46`: the local-field class includes compatible valuation topology, local compactness and nontriviality. Zero fields, q=1 and arbitrary topologies do not enter the headline hypotheses. |
| Continuous induction | `Mathlib/RepresentationTheory/Continuous/Basic.lean:55`, `:541`, `:558`: the representation does not bundle joint continuity; coinduced functions satisfy f(φ(b)g)=b·f(g), with right translation. The headline adds the missing continuity. The trivial-subgroup `coind1Map` at line 593 does not supply general functoriality. |
| Canonical module topology | `Mathlib/Topology/Algebra/Module/ModuleTopology.lean:133`: `IsModuleTopology` fixes the module topology. It prevents choosing an indiscrete topology for the existential finite module. |
| Completed-algebra actions | `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Module.lean:99`, `:112`, `:134`, `:143`, `:322`: level action, generator compatibility, independence, transition compatibility and compact-module action. The last does not cover infinite discrete smooth modules; §0.2 supplies their action. |
| Finite-algebra projective covers | `TauCeti/Algebra/Module/ProjectiveCover/Existence.lean:195`: the ring is finite over an Artinian base; the module need not be finite. It does not directly provide a pseudocompact cover. |
| Projective lifting | `TauCeti/Algebra/Module/Projective/Lift.lean:89` and `TauCeti/Algebra/Module/Projective/Reduction.lean:73`: endomorphism-ring completeness and the Jacobson/coatomic hypotheses are retained in the finite-lattice application. |
| Injective envelopes | `TauCeti/Algebra/Module/Injective/Envelope/Existence.lean:109` supplies algebraic envelopes; `TauCeti/CategoryTheory/Injective/Envelope.lean:101` supplies uniqueness. The smooth-envelope bridge is the repair in R04. |
| Cohomology of coinduction | `TauCeti/RepresentationTheory/Homological/ContCohomology/Coinduced/Acyclic.lean:328`: compact-group, discrete-coefficient acyclicity in positive degrees, as used on N₀. |
| PBW | `TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Injective.lean:213`: `pbwAssociatedGradedEquiv` assumes a free module and works over a commutative base ring; this includes the Heisenberg Lie algebra over k. It does not assert Auslander regularity. |
| Polynomial dimension | `Mathlib/RingTheory/KrullDimension/Polynomial.lean:120`: `MvPolynomial.ringKrullDim_of_isNoetherianRing_of_finite` supplies the polynomial dimension, not the crossing quotient or Heisenberg regularity. |

### Declaration contexts and one-tactic probes


All names have namespace TauCetiRoadmap.ModpRepresentationsOfGL2OverLocalFields. The supplied elaborated signatures were compared with the complete source and README. No Lean command was run. D denotes the explicit definition context: A:Type uA with CommRing; G:Type uG with Group and TopologicalSpace; V:Type uV with AddCommGroup and Module A. LF denotes F,L:Type u with their field, valuation, compatible topology, IsNonarchimedeanLocalField and CharZero instances, p with Fact p.Prime, and residue CharP p on both fields. Q denotes p prime, finite field k:Type of characteristic p, V:Type an additive k-module, and G′=GL₂(ℚ_p)/p^ℤ. These abbreviations describe binders, not additional assumptions.

| Declaration / section / line | Actual variable and instance context | Instances and computed values | Result / one-tactic probe |
|---|---|---|---|
| IsSmoothRep / Definitions / 54 | D; ρ:Representation A G V. No topological-group hypothesis is silently assumed. | Trivial action: stabilizer G is open. Discrete G: every subgroup is open. Regular action of nondiscrete ℤ_p on k[ℤ_p]: stabilizer of basis vector at 0 is {0}, not open. | Real predicate needed for the Q headlines; admits the intended smooth/non-smooth distinction. |
| IsTorsionAdmissible / Definitions / 59 | D plus p:ℕ; compactness is an implication for each OpenSubgroup U; j:ℕ includes 0. | j=0: ker(1)=0. V=k finite and char p: j≥1 gives finite length dim V. Infinite trivial ⊕k gives infinite length. O with no torsion gives zero kernels. | Does not assert smoothness or torsion; theorem finite presentation supplies both. |
| IsFinitelyPresented / Definitions / 69 | D; U₁,U₂ compact open; Wᵢ:Rep.{uA} A Uᵢ, finite A-length and smooth; f,g with range f=ker g and g surjective. | G=1,V=0: W₁=W₂=0. G=1,V=O/ϖ²: W₁=0,W₂=V. G=1,V=O: impossible, since a finite-length module cannot surject onto O. | Real construction predicate, not a free Prop. Different universes on general definition are harmless; all headline applications use the stated common universe. |
| smoothDualSpan / Definitions / 84 | D; actual submodule of Module.Dual A V; open inverse-stabilizer condition. | V=0 gives dimension0. V=k trivial gives dimension1. St over k has smooth dual0 but full dual nonzero. Since a stabilizer is inverse-closed, g versus g⁻¹ has the same open set. | Simple native definition; neither vanishing nor finite-length criterion follows from a library dual lemma. |
| GL2ModScalar / global / 92 | F:Type u, Field F, TopologicalSpace F; ϖ:F. No nonzero or uniformizer premise in abbreviation. | ϖ=0: the defining set is empty, normal closure1, quotient GL₂(F). ϖ=1: quotient again GL₂(F). Uniformizer ϖ≠0: central cyclic subgroup, valuation determinant changes by2. | Actual theorems impose irreducibility of the integral uniformizer or use p in ℚ_p. Junk argument 0 never enters a uniformizer theorem. |
| isFinitelyPresented_ker / Layer0 / 104 | LF; ϖ:O_F irreducible; V,W:Type u additive O_L-modules; ρ,σ on GL2ModScalar F ϖ; both finitely presented; f intertwining. | f=id: kernel0, presentation0. f=0: kernelV, whose supplied presentation works. Same tests at p=2 and ramified e(L)=2 retain both residue characteristics. | Deep coherence statement; no pinned one-lemma proof found. Uniformizer and coefficient hypotheses retained. |
| isFinitelyPresented_of_finite / Layer1 / 121 | Q; hρ:IsSmoothRep; hfin:Module.Finite k[G′] ρ.asModule. | V=0: zero generators/presentation. V=k: one generator and a finite presentation. I(σ): finite group-algebra generating set although coefficient dimension∞. | Headline at stated ℚ_p scope, not coefficient-dimensional padding. |
| isFiniteLength_of_bounded_semisimple_quotients / Layer1 / 133 | Q, smooth, group-algebra finite; ∃N:ℕ before ∀X:Submodule k[G′] V; semisimple quotient ⇒ Module.length≤N. | V=0,N=0; V=k,N=1; V=k²,N=1 fails at X=0 (2≤1 false), N=2 works. Nonsplit length2/simple-cosocle module has bound1 and conclusion length2. | Bound does not depend on X. The conclusion is weaker than a nonexistent equality with N; no tautology. |
| isFiniteLength_iff_finite_smoothDualSpan / Layer1 / 151 | Q, smooth, group-algebra finite; finite length over k[G′] ↔ finite generation over k of the actual smooth dual span. | 0: true↔true, dualdim0. k: true↔true, dualdim1. St: true↔true, dualdim0. I(σ): false↔false. | Both directions tested; full dual substitution fails on St. |
| isFiniteLength_of_admissible_of_finitelyPresented / Layer2 / 166 | LF; V:Type u additive O_L-module; ρ on GL₂(F); hadm and hfp. | V=0:length0. V=k:length1. Infinite ⊕k fails hadm. Torsion-free O passes the p-power-kernel test but fails hfp, so is not a counterexample. | Correct separate roles of hypotheses; no p>3 restriction. |
| isFinitelyPresented_subrepresentation_of_admissible / Layer2 / 180 | LF; same ρ,hadm,hfp; arbitrary W:Subrepresentation ρ. | W=0 gives zero presentation; W=V gives original presentation. In O/ϖ², W=ϖO/ϖ² has length1 and finite presentation. | Quantifies over all subrepresentations; not merely finite-dimensional subspaces. |
| exists_coind_approximation_of_lattice / Layer2 / 202 | F as LF; L NontriviallyNormedField with compatible valuation/local-field/CharZero; p and both residue CharP; hF:¬(p integral irreducible ∧ residue card=p); irreducible coefficient ϖ; B with exact lower-Borel matrix predicate; complete normed L-space E; Θ open bounded O_L-submodule; ρ:ContRepresentation with joint continuity; S subrepresentation with S=ϖΘ; quotient admissible and finitely presented. Existential M includes additive/module/topological structures, topological-additive group, continuous scalar action, IsModuleTopology, finite generation; σ jointly continuous and trivial on lower unipotents; f continuous equivariant with finite O_L-kernel/cokernel. | F=ℚ_p gives e=f=1, hF false. Unramified quadratic gives p irreducible but residue card p²≠p; ramified quadratic gives p reducible. E=0 choose M=0, both errors0. E=L trivial, Θ=O choose M=0, cokernel rank1. | Native coinduction is right translation on continuous equivariant functions. No arbitrary topology can make the finite module existential vacuous because IsModuleTopology is present. No pinned one-tactic proof. |

### Computed target and convention tests


The section numbers below refer to packages/ModpRepresentationsOfGL2OverLocalFields/README.md. Each row records computed examples, not a proof of the general theorem. Standing hypotheses are retained: F,L have characteristic zero and finite residue field; p is prime; Layers 3–9 have unramified F and f≥1; Layers 4.3–7 have p>3; Layer 8 has unramified coefficients. Thus q=1, zero coefficient fields, inseparable local-field extensions and f=0 are outside those targets. Empty index sets are tested for the independently stated crossing algebra. Zero representations remain allowed.

| Target | Instances and computed values | Result / change |
|---|---|---|
| Conventions | Scalar ϖI₂ has determinant ϖ², not ϖ. For p=5, Art_geom(u) has cyclotomic value ū, whereas Art_arith(u) has ū⁻¹: u=2 gives 2 versus 3. On a dual, g acts by precomposition with g⁻¹, reversing product order. | Directions agree with the supplied geometric convention. |
| 0.1 torsion admissibility | V=0 gives length 0 at every U,j. Trivial L/O gives length ej for pʲ-torsion (e=e(L/ℚ_p)); at j=0 it is 0. Infinite ⊕k has infinite length at j=1. Torsion-free O has all these kernels 0, so the predicate alone does not imply torsion. | The separate smooth-torsion scope and finite-presentation hypotheses are necessary and present. |
| 0.2 augmented algebra/action | H=U gives O⟨U⟩=O[[U]]. H=S₃, U=1: (12)(23)=(123), reversed order=(132). For inversion on ℤ_p, sTs⁻¹=(1+T)⁻¹−1=−T+T²−⋯; at p=2 the T² term still distinguishes the action. | The algebra is not the componentwise tensor product. Finite orbit spans can be compared inside their finite sums when checking additivity. |
| 0.3 finite presentation | For H=1, O/ϖⁿ has a presentation with W₂=O/ϖⁿ and W₁=0; length n. V=0 takes both W's zero. Over a finite field a compact induction has one inducing finite module although its underlying vector space can have infinite dimension. | Smooth presentation differs from abstract group-algebra finite presentation. |
| 0.4 exact-sequence calculus | 0→k→O/ϖ²→k→0 has inducing lengths 1,2,1 and finite presentation at all three terms. 0→V→V→0 gives zero kernel/cokernel. For a finite H, restriction of k[H] to 1 leaves dimension card(H) unchanged and changes free rank 1 to card(H). | Clauses survive zero ends and nonsplit extensions. |
| 0.5 coherence | Identity on a finitely presented V has kernel 0; zero map V→0 has kernel V. In G/ϖ^ℤ the determinant valuation is defined modulo 2, and the valuation-zero subgroup has index 2, also at p=2. | No division by 2 in the finite-index reduction. R03 concerns a different filtration argument. |
| 0.6 scalar extension | Hom_k(k,k)⊗k k′ and Hom_k′(k′,k′) both have k′-dimension 1; the zero source gives 0. An irreducible F₅-module carried by F₂₅ with scalar matrix [[0,2],[1,0]] has End dimension 2; after splitting it becomes two distinct characters. | Absolute irreducibility and finite generation are not silently interchanged. |
| 0.7 five-term sequence | 0→k→k²→k→0, with the middle map projection and the first map inclusion, has centre length 2 and four outer lengths 0,1,1,0. The image/kernel decomposition gives 1+1=2. | Uses coherence and extension stability in the stated direction. |
| 0.8 Δ | Identity c-Ind→c-Ind: the two support halves have intersection 0, hence Δ=0. Augmentation c-Ind(1)→k: both images are k, hence Δ=k. Thus induced Δ-map can be 0→k, not surjective. | Nonvanishing requires the admissible nonzero scope; Δ is not a right-exact functor. |
| 1.1 Hecke quotients | I(1)/(T−1) has length 2, with St below and 1 above. The zero submodule of I has infinite-codimension invariant image and is excluded. For a nonzero polynomial of degree n, freeness makes its kernel 0, rather than all I. | Nonzero submodule and polynomial hypotheses matter; declared codimension gap retained. |
| 1.2 finite-type filtration | I(σ) has its own compact-induction term, with no finite-length remainder. A character has compact-induction part 0 and finite-length remainder 1. The F₂₅/F₅ scalar example splits into χ and χ⁵, not a single F₅-valued character. | Finite coefficient descent is needed and present. |
| 1.3 finite type ⇒ finite presentation | V=0 is generated by 0 vectors; k by 1. A supersingular Q_p Hecke quotient is generated by a finite weight and has its single T relation. For F≠Q_p the irreducible supersingular comparison is finite type but not finitely presented. | Base-field restriction essential. |
| 1.4 central characters/Ext | At p=3, centre units act by ±1∈k. At p=5, twisting by δ(u)=ū changes scalar 2 by δ(4)=4. For trivial π at p=2, central restriction of every additive determinant character is ℓ(z²)=2ℓ(z)=0 although Hom_cont(ℚ₂×,k)≠0. | Central-character assertion survives; finite Ext input is R02, and the last test detects a source error. |
| 1.5 bounded cosocle | V=0 allows N=0; V=k allows N=1; V=k² requires N≥2 (take X=0). For a nonsplit length-two extension with simple cosocle, maximal semisimple quotient has length 1 although V has length 2. | Quantifier is ∃N before every quotient; no assertion length(V)≤N. |
| 1.6 smooth dual | 0 has smooth dual dimension 0; trivial k has dimension 1; infinite-dimensional irreducible St has smooth dual 0 while representation length is 1. I(σ) has infinite length and infinite-dimensional smooth dual. | Both implications, and the distinction from the full dual, tested. |
| 2.1 ordinary parts | On a character the contracting transfer has q identical terms, hence q=0 in k and Ord=0. Ord(Ind_B χ₁⊗χ₂)=χ₂⊗χ₁; for χ₁≠χ₂ the unswapped torus Hom is 0 whereas the induced identity is nonzero. St has ordinary part k. | Opposite Borel and unnormalised action agree. |
| 2.2 derived ordinary parts | For F=Q_p, q/ϖ=1 on H¹ of a character. For an unramified quadratic extension q/ϖ=p=0 in k. For ϖ²=p, transfer q/ϖ=ϖ is nonzero on O_F/p but its square is 0. At p=5 replacing ϖ by 2ϖ changes the inverse-unit factor from 1 to 3. | Localization kills the latter nilpotent action; the Q_p case must be excluded from the vanishing claim. |
| 2.3 Δ and length | V=0 gives Δ=0,length=0. The trivial character has Δ dimension 1 and length 1. Identity compact induction gives Δ=0 and infinite length, but is nonadmissible. | Admissibility excludes the explicit false converse without it. |
| 2.4 category C | Trivial k has length 1, finite presentation and invariant dimension 1. For principal series, dim of K_n invariants=(q+1)q^(n−1), finite at every n; its underlying dimension is infinite. Infinite ⊕k has infinite invariant dimension and is excluded. | Both ordinary constituents and subobject conclusions are compatible; Le's nonadmissible example does not enter C. |
| 2.5 finite-error counit | π=0: source,target,errors all 0. π=k: Ord=0, counit 0→k has cokernel length 1. For π=Ind_B̄ τ, the ordinary comparison gives the identity, with both errors 0. | Finite error is not an isomorphism assertion. |
| 2.6 Banach lattice approximation | E=Θ=0 admits M=0, errors 0. Trivial Θ=O admits M=0, cokernel O of rank 1. For a continuous induced lattice the identity has errors 0. The convergent sum Σϖ_Lⁿ1_(ϖ_FⁿO_F) is continuous but not locally constant. | Continuous induction is required; hF excludes exactly e=f=1. |
| 3.1 weights/depth | p=17,r=3 is 3-deep since 3<4<14; r=2 fails. Sym⁰ has dimension 1, Sym¹⁶ dimension 17. For N=8 the interval is 8≤r≤p−10, empty at p=17, nonempty at p=19. | No natural-subtraction junk is used in Lean; strict bounds computed in integers. |
| 3.2 t-coordinates | p=17,λ=(5,0): ω=−1 gives (0,−11), hence Sym¹¹det⁵; ω=1 gives (−1,−10), hence Sym⁹det⁶. For f=2,λ=((5,0),(6,0)),ω=(1,0), output=((6,0),(−1,−10)). | The next-index parity, determinant exponent and both signs are distinguished. |
| 3.3 Ext graph/change of origin | At p=17 the two neighbours of Sym⁵ are Sym⁹det⁶ and Sym¹¹det⁵, each Ext dimension 1. At p=2,f=1, Γ=S₃: Ext¹(k,k)=Hom(S₃,F₂)=F₂, dimension 1; the adjacency indicator is 0. At p=3, Ext¹(det,1) has dimension 1 and self-Ext of 1 is 0. | The exceptional dyadic clause repairs the source formula. |
| 3.4 tame weights | p=17, split inertia ω⁶⊕1 gives {Sym⁵,Sym⁹det⁶}; nonsplit niveau-two case gives {Sym⁵,Sym¹¹det⁵}. Niveau 2 at p=5 has image order 24, while niveau 1 has order 4. | Artin of the unramified quadratic field, not just F, is needed. |
| 3.5 Diamond modules | f=1,p=17, irreducible case: D₀ dimension 6+10+12+4=32 and D₁ dimension 2. Its two torus characters at diag(3,1) have values 5 and 1; full semisimplification adds values 6 and 13 and gives dimension 4. | D₁ is actual I₁-invariants, not invariants of semisimplification. |
| 4.1 canonical/GK dimension | Zero gives −∞; trivial k gives d−d=0. C∞(ℤ_p^d,k) has dual k[[T₁,…,T_d]], grade 0, dimension d, and invariants p^(rd). For d=0, index=1 and all powers equal 1. | Positive analytic dimension required only for growth formula; present. |
| 4.2 comparisons | U=ℤ_p^d,M=k gives d−j(M)=d−d=0=dim Supp(k). U=C₂,p=5, sign M gives gr M=0, left dimension 0 and right −∞. Quotienting a trivially acting central direction on the trivial module keeps both dimensions 0. | R01. |
| 4.3 valuation | Upper entry 1 and lower entry p each have value 1/2; their commutator has diagonal leading terms 1+p,1−p, value 1. Identity has ∞. Raising a nonidentity element to p adds 1. | Determinant-one realization of P is explicitly supplied in the layer preamble. |
| 4.4 graded algebra | Degree 1 dimension 2f; degree 2 dimension 2f²+2f. At f=1 the degree-two basis e²,f²,ef,h has 4 elements and [e,f]=h≠0; killing h gives the polynomial ring in 2 variables. | Ring presentation consistent; PBW transfer prerequisite R03. |
| 4.5 crossing algebra | J=∅: C=k, dimension 0. One pair: XY=0 but X,Y≠0, dimension 1 and two minimal primes. Two pairs: X₀Y₁≠0 whereas X₀Y₀=0, dimension 2, four minimal primes. | Characteristic 2 changes none of these monomial calculations. |
| 4.6 projective truncations | n=1 gives χ of dimension 1; f=1,n=2,3 gives dimensions 3,7. Omitting h gives 6 instead of 7 at n=3. For U=ℤ_p, the full trivial-character cover is k[[T]], infinite-dimensional. | Truncation formulas consistent; envelope existence is R04. |
| 4.7 dimension criterion | V=k: both Hom spaces from χ and Wχ,3 have dimension 1, and GK=0≤f. Full smooth regular representation of P has GK=3f, so cannot satisfy the criterion; crossing quotient has support dimension f. | Upper bound is not equality. |
| 5.1 Iwahori extensions | p=5,f=1: α²=α⁻², so the e²,f² terms give multiplicity 2 to χα²; at p>5 they differ. For an Ext neighbour, Wχ′,2→Wχ,3 has source dimension 3 and target 7 when f=1. | p>5 multiplicity restriction present; other statements use p>3. |
| 5.2 finite-Borel injectives | dim Iχ=q and χ occurs twice (socle and cosocle); for p=7,f=2,j=1+2p the lower digit rectangle has (1+1)(2+1)=6 entries, not j+1=16. | Digitwise order distinguished from numerical order. |
| 5.3 finite-group hulls | f=1,p=17,σ=Sym⁵: I(σ,Sym⁹det⁶) has length 2 and dimension 16. A two-coordinate endpoint with both signs nonzero has 4 constituents, not 3. Pσ has self-multiplicity 2 at f=1. | Boolean interval and multiplicity-free hull differ from the whole projective. |
| 5.4 integral lifts/reciprocity | Finite projective of rank d lifts to O-free rank d, reduction dimension d. Steinberg has ordinary dimension p and zero ordinary-trivial multiplicity. In characteristic p, inverting p gives 0, so it cannot supply the characteristic-zero lift. | No equal-characteristic coefficient substitution; specified O⊂L is necessary. |
| 5.5 adjoint tensor | For p=17,r=5, dimensions are 4+6+8=18=3·6. At r=0 the alleged negative summand would have highest weight −2; the theorem's lower bound excludes it. Projective tensor has dimension 3dim P. | Range and corrected tensor/projective statement match the corrigendum. |
| 5.6 first-order hulls | H¹(K₁/Z₁,k) has dimension 3f; first-order bound is (1+3f)dim InjΓσ. At p=17,f=1, old neighbour hull has dimension 16 and K₁-fixed dimension 16; self-Ext at r=14 is 0 but at r=15 is nonzero. | R04 supplies existence; R05 replaces non-tests. |
| 6.1 boxes | All negative signs and B_i=1 give length 2^f. With f=2 and signs (+,−), cyclic parity requires B₀ odd and B₁ even. A lower interval ending at (1,2) has (2)(3)=6 constituents. | Previous-index parity is essential and present. |
| 6.2 K₁ filtration | f=1,B=3: m-annihilated layer has labels 0,1; m²-annihilated layer has labels 0,1,2,3. Floor sums are 0,0,1,1. B=1 has only the first layer. | Exponent n versus n−1 and endpoint condition agree. |
| 6.3 induced extensions | f=1 generic Ind_I^Kχ has length 2; Ind_I^K Eχα,χ has length 4. In the negative root direction every simple quotient kills the non-K₁-trivial submodule, so its cosocle remains the original simple cosocle. | Root-direction asymmetry matches source. |
| 6.4 Diamond boxes | ε=0: length 1. One nonzero ε: length 2. Two nonzero ε: length 4, with two incomparable middle submodules; a chain would have only one middle stage. | Three discriminating checks are present. |
| 6.5 adjoint boxes | With s nonzero signs, constituent count becomes 3·2^s; s=0 gives 3, s=1 gives 6. When ε_j=0 the three shifted boxes split; when ε_j≠0 the three length-2 graded pieces have nonsplit links. | No claim that constituent count determines the extension. |
| 6.6 maximal enlargement | f=1: D has length 2 and W has length 4; W/D has length 2 and W^K₁=D. Allowed labels 0,1,2,3 give lower intervals of lengths 1,2,3,4. | Largest-module condition is stronger than an arbitrary extension. |
| 6.7 tame enlargement | f=1 each of two tame weights gives a length-4 Vσ, with disjoint constituent sets; multiplicity mσ=2 gives two copies, not one. K₁-fixed part of each has length 2. | Multiplicity parameters retained; constituent disjointness is only under the depth bound. R05 adds discriminating Checks. |
| 7.1 connected sets | At p=17, {1,α²} fails: qualifying pair, zero middle characters. {1,α,α²} has one middle character. A singleton repeated twice has zero qualifying pairs, hence passes. | Defined condition is not graph connectedness. |
| 7.2 Loewy-three vanishing | χ alone has socle=radical? radical 0, so soc⊊rad fails. A Loewy-three χ/χ′/χ module has χ multiplicity 2; a target with σχ multiplicity 1 forces the socle map to have image 0. At p=7,r=3 satisfies 2<3<4; at p=5 no r does. | Strict Loewy and depth hypotheses prevent the boundary counterexample. |
| 7.3 D₁ connectedness | For an irreducible f=1 parameter D₁ has 2 characters; for split parameter it has 4. The extension paths in the latter have their middle characters; replacing it by the two endpoints {1,α²} makes the missing-middle count 1. | Actual D₁ rather than all semisimplified weights is used. |
| 7.4 W₂ multiplicity | f=1: Wχ,2 has dimension 3 and its proper χ-quotient has dimension 1. The asserted Hom isomorphism allows only maps killing its 2-dimensional radical. Conjugation w[[a,b],[pc,d]]w⁻¹=[[d,c],[pb,a]] swaps the two directions. | Correct conjugation and factorization direction. |
| 7.5 W₃ multiplicity | f=1: Wχ,3 has dimension 7; factorization through χ kills a 6-dimensional radical. Degree-two constituents have multiplicities 1,1,2 for α²,α⁻²,1 at p>5. | Connectedness is what excludes nonzero maps on the two-step pieces. |
| 7.6 local GK bound | f=1 supersingular Q_p case has GK=1, so bound 1 is attained. Finite-dimensional V has GK=0; f=2 bound is 2 while ambient GL₂(F) has dimension 8. Zero gives −∞≤f. | Upper-bound formulation has the correct zero and ambient-dimension conventions. |
| 8.1 Bockstein | Trivial O-lattice has β=0 and coinvariant sequence 0→k→O/p²→k→0. On the adjoint, β(e,f)=h and β(h,e)=2e; swapping brackets changes the sign. | Exponential construction fixes β; p>2 retained. |
| 8.2 sublattice comparison | W=0 gives V₁=pV and V₁/p²V≅V/pV of dimension d. Replacing the denominator by p²V₁ gives pV/p³V, length 2d, a different object. W=V/pV recovers V₁=V. | The denominator and map directions are correct. |
| 8.3 bracket operator | p=11,r=3: eigenvalues −2r,4,2(r+2) reduce to 5,4,10, all nonzero. At r=0 first is 0; at r=p−2 third is 0. Zero rescaling gives zero operator, excluded by nonzero choices. | Invertibility and normalization tested on all three summands. |
| 8.4 gluing lattice | f=1 gives one fibre product, rank 4dim Pσ; f=2 rank 7dim Pσ. A pair with residues u≠v in Pσ lies outside the fibre product. Empty partial gluing is R₁, then recursion adds each R′₂,j once. | Actual maps determine the lattice; direct sum is a wrong model. |
| 8.5 coinvariants | With f=1 and d=dim Pσ, R/pR has dimension 4d and coinvariants dimension d. Its adjoint submodule has dimension 3d; identifying invariants with coinvariants would therefore give the wrong dimension. | Coinvariants, not invariants. |
| 8.6 first truncation | f=1,p=11,σ=Sym⁵: Tσ dimension 4dim Pσ. Restricting to K₁ alone and using its trivial-character cover gives dimension 4 instead, losing Pσ. | The K/Z₁ projective index in the statement is correct. |
| 9.1 endomorphisms | f=1: dimension 2^f(f+1)=4; f=2: dimension 12. For f=1 the multiplicity calculation is 2+(2+0+0)=4. p=7 has no r with 2<r<p−4; p=11 allows r=3,…,6. | Count and nonempty depth range agree. |
| 9.2 cyclic Hom | τ=σ: Hom(Tσ,Tσ) is cyclic over itself, generated by id, cokernel 0. At p=13 interval 5<r<6 is empty; p=17 permits r=6,7,8,9. | Boundary not claimed as an acceptance theorem; right precomposition action is correct. |
| 9.3 relative projectivity | Q=0 gives both Hom spaces 0. Q=σ gives Hom(σ,σ)=k=Hom(Tσ,σ). Q=Tσ gives identity on Hom. A proper nonsplit length-two quotient is not projective in the whole ambient category. | The assertion is relative to subquotients, not ambient projectivity. |
| Worked example 1 | I(1) has infinite length; I(1)/(T−1) has length 2, trivial cosocle of length 1 and smooth dual dimension 1. | Distinguishes group-module length from coefficient dimension. |
| Worked example 2 | The augmentation kernel is finitely presented. A kernel presenting a supersingular over F≠ℚ_p cannot have finite type: otherwise §0.4 would give a finite presentation, contradicting the imported non-presentation theorem. | Both implications use the specified field hypothesis. |
| Worked example 3 | For F=ℚ_{p²}, Ord(St⊗χ∘det)=χ⊗χ; the counit has kernel length 1 and cokernel length 0. | This is the Steinberg quotient, not its opposite extension. |
| Worked example 4 | At p=17, tλ(1)=(−1,−10), tλ(−1)=(0,−11), yielding weights Sym⁹det⁶ and Sym¹¹det⁵; split W instead contains Sym⁵ and Sym⁹det⁶. | The two sets are not conflated. |
| Worked example 5 | f=1: [e,f]=h≠0, truncated dimensions 3 and 7; k[X,Y]/(XY) has dimension 1 and two minimal primes. | Matches the Iwahori computations. |
| Worked example 6 | f=1: rank R=4dim Pσ, dim End(R/pR)=4, and reduction is the first projective truncation. | Uses the layer’s depth hypotheses; the literal weight-free summary inherits them. |

### Source locator coverage


Locations inspected in the cached, line-numbered legal copies; errors are separated in the report. Each semicolon-delimited item below is one named locator, regardless of repeated README citations. Bibliographic keys are not renamed. The source text is not reproduced.

| Source | Named locators inspected | Text anchors |
|---|---|---|
| BHHMS23 | Proposition 2.4.2; Lemma 2.4.4; Lemma 2.4.6; Remark 2.4.7; Lemma 4.1.2 and final proof paragraph; Lemma 5.1.2; Lemma 5.1.3; Lemma 5.3.1; Lemma 5.3.2; Proposition 5.3.3; Theorem 5.3.4; Corollary 5.3.5; Lemma 6.1.1; Lemma 6.1.2; Lemma 6.1.3; Corollary 6.1.4; Lemma 6.2.1; Proposition 6.2.2; Lemma 6.2.3; Proposition 6.2.4; Lemma 6.3.1; Lemma 6.3.3; equation (48); Remark 6.3.6; Lemma 6.3.7; Lemma 6.3.8; Lemma 6.3.9; Proposition 6.3.10; Theorem 6.3.11; Corollary 6.3.13; Corollary 6.3.15; Proposition 6.4.1; Definition 6.4.2; Lemma 6.4.3; Lemma 6.4.4; Corollary 6.4.5; Proposition 6.4.6; Theorem 6.4.7; Lemma 7.1.1; Lemma 7.1.2; Lemma 7.1.4; Lemma 7.2.1; Proposition 7.2.2; Proposition 7.3.1; Lemma 7.3.2; Theorem 7.3.3; Corollary 7.3.4; Proposition 7.4.1; Lemma 7.4.2; Proposition 7.4.3 | BHHMS23 lines 716, 747, 768, 786, 1216, 2380–2435, 2624, 2683, 2688, 2792, 2817, 2900–4311. |
| CDN23 | Proposition 1.2; Proposition 1.3; Lemme 1.6; Lemme 1.7; Proposition 1.17; Proposition 1.19; Proposition 1.20; Théorème 1.21; Lemme 1.22; Lemme 1.23; Théorème 1.24; Lemme 1.25; Théorème 1.26; Lemme 1.29; Proposition 1.30; Lemme 1.31; Lemme 1.32; Proposition 1.33; Corollaire 1.34; Lemme 2.9 | CDN23 lines 400–620, 685–920, 1148–1154. |
| BP12 | Corollary 5.6; Proposition 13.1; Corollary 13.2; Theorem 13.8; Proposition 14.7; Lemma 3.4; Lemma 3.5; Lemma 3.8; Corollary 3.12 | BP12 lines 805, 809, 887, 986, 1468, 3025, 3064, 3157, 3302. |
| EMERTON1 | Lemma 2.3.4; Definition 3.1.3; Lemma 3.1.7 and equation (3.1.8); Definition 3.1.9; Proposition 4.1.5; Proposition 4.1.7; Proposition 4.3.4; Theorem 4.4.6 | EMERTON1 lines 361, 686, 753, 780, 1279, 1345, 1607, 1759. |
| EMERTON2 | Definition 3.3.1; Proposition 3.5.6; Remark 3.7.3; Theorem 4.2.12 | EMERTON2 lines 512, 865, 1179, 1497. |
| DEG | Lemma 4.2.1 | DEG line 2193; its small-prime extension remains the declared supplier gap. |
| HW22 | Lemma 2.10; Theorem 2.23; Corollary 2.25; Corollary 2.26; Theorem 2.30; Corollary 2.31 | HW22 lines 558, 817, 837, 842, 974, 980. |
| HU12 | Corollaire 3.9; Proposition 3.30; Corollaire 3.31; Théorème 4.3; Proposition 4.4; Lemme 4.5 | HU12 lines 1167, 1734, 1759, 1825, 1900, 1926. |
| KOHLHAASE17 | Proposition 3.9; Remark 3.10 | KOHLHAASE17 lines 660, 685. |
| HU10 | Lemma 2.13(i) | HU10 line 902: f≥2 retained; the roadmap's f=1 argument is separate. |
| LMS22 | Proposition 3.3 | LMS22 line 318, together with its correction. |
| LMS22-CORR | Item (2) | LMS22-CORR line 13. |
| SHOTTON20 | Definition 2.3; Lemma 2.4; Lemma 2.6; Lemma 2.7; Lemma 2.8; Proposition 3.2; Proposition 3.8; Proposition 4.1; Proposition 4.2; Proposition 4.3; Corollary 4.4; Theorem 4.5; Theorem 5.1; Corollary 5.2 | SHOTTON20 lines 112, 123, 134, 139, 198, 301, 369, 408, 423, 449, 467, 469, 502, 506. |
| HAUSEUX | Corollary 4.2.4 | HAUSEUX line 1342: distinguishes F=ℚ_p from F≠ℚ_p. |
| VIGNERAS11 | Proposition 8; Proposition 9; Proposition 10; Lemme 11 | VIGNERAS11 lines 783, 827, 835, 808. |
| SERRE-TREES | Chapter II §1.4 Théorème 3; Chapter II §1.4 Corollaire 1 | SERRE-TREES lines 3281, 3287. |
| LE19 | Theorem 1.1; Theorem 3.2; Theorem 3.4 | LE19 lines 30, 231, 269; nonadmissibility line 370. |

### Wording, arrangement and reuse

The locator comparisons distinguish forced mathematical notation and standard names from prose. Five additional prose comparisons covered the action construction (§0.2 against SHOTTON20, Proposition 3.2), transfer/localization (§2.2 against EMERTON2, Definition 3.3.1 and HAUSEUX, Corollary 4.2.4), the largest socle module (§3.5 against BP12, Proposition 13.1), lattice gluing (§8.5 against BHHMS23, Theorem 7.3.3), and the Banach theorem docstring against CDN23, Corollaire 1.34. No copied nonmathematical sentence, clause-by-clause paraphrase, table, figure or exercise list was identified. No adaptation from an external formalization was identified.

Before the bibliography, BHHMS23 accounts for 43 of 150 explicit source-key citation occurrences; CDN23 has 40, and the other keys 67. These are citation occurrences, not the number of distinct theorem locators. BHHMS23's contents are available at lines 16–59. The numerical correspondence is Layer 3 ↔ §§2, 4.1 plus BP12 §§13–14; Layer 4 ↔ §§5.1, 5.3 with §5.2 imported from its owner; Layer 5 ↔ §§6.1–6.2 plus HW22 and corrected LMS22; Layers 6–7 ↔ §§6.3–6.4; Layers 8–9 ↔ §7. The source's Galois-deformation and global chapters are not replanned. Layers 0–2 have different sources and endpoints. The dependency chain §§6.5→6.6→6.7→7.6 forces the maximal-module construction before the dimension theorem; §§8.3→8.4→8.5→8.6→9.1→9.3 forces the lattice realization before its endomorphism and quotient consequences. There is no unforced one-to-one run of the source's chapters with the same scopes.

Source independence: 138 comparison units (133 named locators and five additional prose passages) across 17 sources; no copied expression or reused source artifact identified; largest share BHHMS23, 50 of 133 distinct verified locators and 43 of 150 overall citation occurrences; contents compared with BHHMS23: independent subject to the displayed mathematical dependencies.

## Not verifiable

- No fresh Lean elaboration was run: the read-only brief prohibits Lean builds. The supplied elaborated signatures were used for all 12 declarations; this report does not claim a new compilation result.
- SERRE-LRFG remains uncertified, as settled in the input. Its cited modular-character locator was not checked against the text.
- BARTHEL-LIVNE94 remains waived, as settled in the input. Its Proposition 18 and Theorems 30, 33–34 / Corollary 36 were not directly certified. HU12's proof of Théorème 3.27 and BP12's proof of Corollary 6.9 support the recorded ordinary uses, without replacing certification of the original text.
- The declared all-prime extension of DEG Lemma 4.2.1 is a supplier contract. The readable lemma covers p≥5; this review does not claim its proof establishes p=2 or 3.
- The finite-instance computations below the findings test truth and conventions; they are not formal proofs of the general targets or of the unimplemented supplier contracts.

## Source issues

- **Error** in BHHMS23 at Lemma 2.4.6, printed p.17 (BHHMS23 line 768): the source says regular-weight Ext dimension is always the adjacency indicator; it should be qualified at p=2, f=1: the trivial S₃-module has self-Ext dimension 1, while the self-adjacency indicator is 0; affects a stated result.
- **Error** in BHHMS23 at Lemma 6.1.1(i), printed p.56, and after equation (44), p.55 (BHHMS23 lines 2855, 2900): the source says every nontrivial character occurs at most once through the third Iwahori layer when p>3; it should be restricted further or record p=5, f=1, where α²=α⁻² has multiplicity 2; affects a stated result.
- **Misprint** in BHHMS23 at the proof of Corollary 7.3.4, printed p.84 (BHHMS23 lines 4206–4208): the source says the intermediate projective cover is indexed by K₁/Z₁; it should be indexed by K/Z₁ throughout that quotient and surjection; affects the proof.
- **Error** in CDN23 at the proof of Lemme 1.23, printed p.18 (CDN23 lines 779–780): the source says unrestricted self-Ext maps onto all additive central characters; it should be only a left-exact comparison: for p=2 and π=1, restriction sends ℓ(det(zI₂))=2ℓ(z) to zero although Hom_cont(ℚ₂×,k) has dimension 3; affects the proof.
- **Gap** in CDN23 at the proof of Proposition 1.30(b), printed p.21 (CDN23 line 891): the source says the Steinberg ordinary-parts formula for F≠ℚ_p follows from Emerton II, Theorem 4.2.12; it should be justified for general F: that theorem is about GL₂(ℚ_p), as EMERTON2 lines 1497–1507 show; affects the proof.
- **Misprint** in CDN23 at the proof of Lemme 1.31, printed p.21 (CDN23 line 897): the source says scalar extension from k_L to k uses π⊗_k k_L; it should be π⊗_{k_L}k; affects nothing.
- **Error** in LMS22 at Proposition 3.3(2), printed p.8 (LMS22 line 326): the source says all translated tensor summands are projective envelopes, including character weights; it should be the R_{λ+ν} summands of LMS22-CORR item (2), which are the asserted projective covers only away from character weights; affects a stated result.
- **Error** in VIGNERAS11 at Proposition 9, printed p.22 (VIGNERAS11 line 827): the source says Δ always contains the I₁-fixed vectors of the generating KZ-module; it should be qualified: identity compact induction has Δ=0 and a generating trivial weight with invariant dimension 1; affects a stated result.
- **Error** in VIGNERAS11 at Proposition 10, printed p.22 (VIGNERAS11 line 835): the source says every generated torsion representation has nonzero Δ; it should be qualified to exclude the zero representation and nonadmissible identity compact inductions, which have Δ=0; affects a stated result.
- **Misprint** in VIGNERAS11 at the proof of Théorème 6, printed p.20 (VIGNERAS11 line 739): the source says the finite-length proof inducts on the length of V; it should be induction on the finite generating KZ-module V₀, as the subsequent reduction and line 752 do; affects the proof.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "d6f2f83165fc1d74cf86be6fd4b4b69efea073c8", "job": "RT-ModpRepresentationsOfGL2OverLocalFields~1a", "model": "gpt-6-astra", "worker": "chris-6"} -->
