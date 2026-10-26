<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1051#issuecomment-6424215558 -->
Red team round 1 pass a (codex) of 9af1fe1

Verdict: needs_changes

1. **F01** (P3) Replace the generic set-descent Check with a discriminating instance

   **Location:** `packages/ArcTopologyAndDescent/README.md:272`: “For sets, compute the matching equalizer and recover ordinary descent data.”

   **Claim:** The definition of universal F-descent has three discriminating Checks.

   **Witness:** The second item is the set-valued reformulation of the definition, repeated at line 275. It supplies no scheme, cover, functor or values; only the identity and derived-totalization Checks remain concrete.

   **Exact repair text:** Replace that bullet with: “For the fold Spec(k×k)→Spec k and the set-valued functor of affine-line sections, the comparison is k→Eq(k²⇉k⁴). The two arrows send (a,b) to (a,a,b,b) and (a,b,a,b); their equalizer is the diagonal k.”

   **Retest:** For k=F₂, four candidate pairs reduce to (0,0) and (1,1). Thus the equalizer has two elements, matching k; using all four pairs as descent data fails this Check.

2. **F02** (P3) State the nonnumerical build order inside Layer 1

   **Location:** `packages/ArcTopologyAndDescent/README.md:312`: the Needs clause for §1.4 includes “§1.6”.

   **Claim:** The displayed target order gives the build sequence, but the h-descent proof consumes affine approximation two sections later.

   **Witness:** §1.4 is at lines 304–312; its explicit §1.6 prerequisite is at lines 324–338. Section 1.6 depends only on the earlier supplier refinement, scheme limits and its own cancellation argument.

   **Exact repair text:** Add to “How to read the build”: “Within Layer 1, construct §1.6 after §1.3 and before §1.4; the remaining sections follow their displayed order.” Alternatively move the full §1.6 block before §1.4 without changing its stable identifier.

   **Retest:** The order 1.1, 1.3, 1.6, 1.4, 1.5, 1.7 places the approximation before its consumer and introduces no reverse edge.

3. **F03** (P3) Give the affine-approximation Check an actual noncartesian diagram

   **Location:** `packages/ArcTopologyAndDescent/README.md:336`: “A general diagram of arrows without cartesian transition maps does not satisfy the finite-presentation persistence theorem”.

   **Claim:** The third Check discriminates the cartesian-transition condition.

   **Witness:** No diagram or value is supplied; the bullet repeats the hypothesis warning. The other two Checks are the identity and the split polynomial tower, so only two concrete instances are present.

   **Exact repair text:** Replace the bullet with: “Take A_i=k[x], B_i=k[x,x⁻¹], with both transition maps sending x to 1. Every Spec B_i→Spec A_i misses x=0, while both filtered colimits are k and their limit map is the identity. The transition squares are not cartesian: B_i⊗_(A_i)A_(i+1)=A_(i+1)≠B_(i+1).”

   **Retest:** At every stage the closed point x=0 has zero lifts, whereas the limit identity has one lift for every chosen field map. Thus persistence fails without cartesian transitions, exactly as intended.

## Verified sound

Read all 1,607 README lines and all 132 acceptance-file lines: **84 numbered target blocks, 10 Lean declarations (5 definitions and 5 theorem signatures), and 152 labelled Check bullets**. The two non-discriminating Checks are R01 and R03. The computations below cover the numbered targets, defining conventions, supporting predicates and repeated examples; they are instance tests, not proofs of the general theorems.

Resolved **118 distinct explicit source-line anchors across 12 works**, and the separately cited STACKS §59.82, against the supplied legal extractions. Thus 13 works were readable; HUB96 remains uncertified. Compared source hypotheses at the sensitive uses: all modules in the purity criterion; arbitrary rank versus rank one; finite ideals; cohomological versus Tor amplitude; arbitrary torsion versus residue-invertible torsion; and nil versus nilpotent special-fibre kernels. The source's two mistakes in the finite-chain category are corrected in §6.5: rank n gives n+1 points, and natural transformations need not be injective.

Checked the **17 named roadmap supplier families**, the **5 declared gap contracts**, and ownership searches across **55 individually supplied sibling folders**, main, Completed, board packages and the mandated roadmap index. The 55 sibling folders are ownership searches, not claims to have reviewed every theorem in those folders. No duplicate fully qualified name of any acceptance declaration was found. The four supplied citation-resolution leads resolve: PrismaticCohomology §2.0 has `Arc.Cover.ofVCover`; SchemeAndStackFoundations §2.11 has `Etale.artinSchreier_vanishing`; AdicSpacesPartII §R0.19.10 has `Topos.isQuasiseparated_iff_of_cover`; `sources.toml` is a filename.

The ownership boundaries checked include:

| Existing owner | Interface checked; reason the arc target remains here |
|---|---|
| PrismaticCohomology §2.0 | Scheme v/arc predicates, torsion and bounded constructible descent, formal p-site and perfectoid structure sheaf are imported. General excision, arbitrary parameters and finite ideals are the extensions here. |
| DiamondsAndVStacks §§D0.11–D0.12, D0.22 | Topological spectral submersions and their limits, and ordinary Boolean sheaves. The scheme characterization and specified infinity-category extension are distinct targets. |
| SchemeAndStackFoundations §§0.9, 0.11–0.14, 0.24–0.25, 1.1–1.10, 2.5, 2.11, 2.15, 4.7–4.8 | Approximation, integral closures, henselian pairs, perfection, algebraic spaces, affine torsion calculations and formal maps. The three named extensions remain explicit gaps. |
| EnhancedDerivedSheaves §§E0.1–E0.8, E1.3–E1.6, E2.6–E2.8, E4.1–E4.3 and E5:descent | Coherent categorical operations, perfect-characteristic-p Tor independence, finite inductive level, descent and completion. The ordinary-scheme h criterion retains its own proof. |
| SchemeKTheoryOperations §4.10 | Perfect-scheme v-hyperdescent and fixed Tor bounds; §7.7 supplies the arc upgrade. |
| ClassicalAdicEtaleCohomology §§2.5–2.6, 6.1, 6.3 | Analytic comparisons, normalized perfectoid comparison, valuation extensions and sheaf-level valuation base change. Section 6.3 includes the general derived unit, beyond its first narrower formulation. |
| AdicEtaleGeometry §§A1.0.5, A1.15; AdicSpacesPartII §R0.19.10 | Regular-parameter finite étale approximation, enough points, and qcqs topos objects. Bounded-torsion/finite-ideal approximation and coherent-site representables are explicitly declared extensions. |
| EtaleCohomologyFoundations §§F.0.1, 0.5–0.7, F.2.1–F.2.6, F.3, G.1–G.3 | Constructible continuity, proper base change, field Künneth in its invertible range, algebraic affine vanishing and compactification. Characteristic-primary constant coefficients use the separate Artin–Schreier supplier. |
| RigidAnalyticGeometry §§1.1–1.3; AdicSpaces Layers 0–1; AdicSpacesPartII §§R0.3, R0.9, R1.3, R1.9 | Finite Tate presentations, closed ideals, normalization, dimension, tensors and analytification. The tensor argument needs only dim≤2d. |
| PerfectoidSpaces §§P1.15, P1.20, P1.24–P1.25, P1.27, P2.2, P3.2, P3.9–P3.12, P3.20; PerfectoidQuotients §§0.4–0.6 | Integral/Tate models, torsion removal, tilting and completed operations. These are not rebuilt by the hyperdescent theorem. |
| DerivedModuleAlgebra §§0.2, 0.4, 0.7–0.8, 0.11–0.12, 0.14, 1.1–1.9; DerivedDeRhamCohomology §§2.1–2.26 | Tensor, cotangent, exterior-power, de Rham and completion carriers; h-sheafification and its arc theorem are the new construction. |
| GeneralAlgebraicKTheory §§8.5–8.6, 10.9, 10.12; SchemeKTheoryOperations §3.4 | Low-degree Milnor excision and supported completion comparisons; no higher K-excision is assumed. |
| ResolutionOfSingularitiesCharacteristicZero §§5.1–5.2 | Principalization and embedded resolution provide the characteristic-zero valuation approximation route. |

All five gap slugs and needs sentences agree between `packages/ArcTopologyAndDescent/design/plan.json` and the README. Each has an earlier named supplier and explicit hypotheses. None is treated as an already implemented theorem. No extra gap is inferred solely from the planned supplier's current absence of that extension.

The required mechanical dependency check returned exit 0:

```text
depcheck: 56 roadmaps, 654 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. R02 is an internal target-order issue, not an external merge-order cycle. The read-only `git diff --stat origin/main...HEAD` lists nine changed files, all within `packages/ArcTopologyAndDescent/`. No prohibited option, admitted data, `lemma` declaration, computational algorithm or pull-request/process narrative was found in the two reviewed deliverables.

The pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Native interfaces were inspected there, including `SpectralSpace` (`Mathlib/Topology/Spectral/Basic.lean:38`), `IsSpectralMap` (`Mathlib/Topology/Spectral/Hom.lean:42`), `IsCofiltered` (`Mathlib/CategoryTheory/Filtered/Basic.lean:590`), `EffectiveEpi` (`Mathlib/CategoryTheory/EffectiveEpi/Basic.lean:71`), the affine étale basis (`Mathlib/AlgebraicGeometry/Sites/AffineEtale.lean:46`), sheaf cohomology (`Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:56`), and strict topological finite type (`TauCeti/RingTheory/Huber/TopologicallyFiniteType.lean:133`). The last predicate does not itself assume a separated complete target; closedness of ideals in finite Tate algebras supplies this in the complete-field application. Ordinary complete integral closure uses an arbitrary regular denominator (`Mathlib/RingTheory/IntegralClosure/IsIntegral/AlmostIntegral.lean:26`); the fixed-t uniform denominator object of §9.7 is distinct.

The headline inventory is: the arc/spectral characterization and limit theorem; finitary arc/excision equivalence and rank-one detection; unrestricted Milnor excision and formal glueing; étale-object descent; h-form and h-de Rham descent; Perf on perfections; algebraic-space mapping descent and canonical covers of perfect schemes; completed-generic-fibre hyperdescent and Künneth; both affinoid vanishing bounds; finite-ideal complete descent; and integral perfectoid/tilt/A_inf hyperdescent. The five statable native signatures are present. The module docstring identifies the remaining families and their missing coherent categories, sites, functors or geometric carriers. The unavailable categorical descent constructions cannot be replaced by an ordinary derived-category object without changing their meaning. No one-tactic/API/boundary padding was found among the five theorem signatures; their five definitions support those signatures.

Compared every supplied elaborated type with its README statement. There are **zero section-variable blocks and zero dropped required binders**. No Lean process was run during this read-only pass; these are comparisons against the supplied elaboration results, not a claim of a fresh build.

| Lean declaration and README section | Explicit context retained | Computed instance values and result |
|---|---|---|
| `IsSchemeArcCover`, line 46; §2.7 | X,Y:Scheme in u; V,W:Type u; commutative domain, valuation and dimension≤1 instances; injective local e and the commuting square | Identity: W=V,e=id,b=a and both composites a. ∅→Spec F₂: zero lifts. Dual-number reduction: every test kills ε and lifts uniquely to the reduction. |
| `arc_spectral_characterization`, line 55; §2.7 | Both schemes qcqs; f qcqs; every qcqs base change T→X; every subset U | Identity field: both sides true. Generic-only inclusion: both false; {closed} has empty compact-open preimage but is not open. Rank-two split: true on both sides; exactly four of eight subsets have open inverse image. |
| `isSchemeArcCover_of_isLimit`, line 67; §2.7 | Small nonempty cofiltered category; four objectwise qcqs instances; both affine-transition instances; both limit witnesses; all component covers | One-object diagram gives f. Polynomial-fold tower gives the fold over k[t₁,t₂,…], with W=V. Wrong source apex ∅ has zero field lifts and is excluded by hY. |
| `IsPerfectFpScheme`, line 81; §7.8 | Every natural p and every scheme; all open section rings, including 0 | Empty: true. F₂[ε]/ε²: false since ε²=0. F_p[t^(1/p∞)]: true. p=0 or 1 forces empty; p=4 admits Spec F₂. |
| `QcqsPerfectFp`, line 85; §7.8 | Object property combining qc, qs and the preceding predicate; full morphism sets | Empty and perfect affine schemes: all conjuncts true. Infinite disjoint union of Spec F_p: perfect=true, qs=true, qc=false. |
| `arcCover_iff_universallyEffectiveEpi`, line 89; §7.8 | p prime; X,Y,T,P in the full qcqs perfect subcategory; all four square maps; actual IsPullback | Identity: true↔true; ∅→Spec F_p: false↔false, separated by two maps to Spec(F_p×F_p). Split perfect rank-two valuation: arc=true and universal effective epi=true although v=false. |
| `IsTorsionEtaleSheaf`, line 100; §10.0 | Actual abelian sheaf on X.smallEtaleTopology; only affine étale tests | Z/6 sections killed by 6; 1∈Z survives every positive multiple. ⊕Z/ℓ^r has sectionwise finite exponents but no common exponent. |
| `IsPrimePowerTorsionEtaleSheaf`, line 105; §10.0 | Same affine basis; ∀section ∃n; arbitrary natural ℓ at definition level | 1∈Z/ℓ² killed by ℓ², not ℓ. Z/r for r≠ℓ fails. ℓ=0 passes every sheaf, ℓ=1 only the zero sheaf; both junk cases excluded by the theorem's primality. |
| `affinoid_artin_grothendieck`, line 111; §10.8 | Complete algebraically closed nontrivially normed ultrametric K, NonarchimedeanRing K; actual strict finite Tate presentation; dim≤d; torsion F; q>d+1 | A=0: all groups 0. A=K,d=0: H⁰=Λ, H^q=0 for q>0. At d=1 the signature starts at q=3, imposing no q=2 conclusion. |
| `affinoid_artin_grothendieck_prime_to_residue`, line 122; §10.8 | Same analytic hypotheses; ℓ prime and norm(ℓ)=1; sectionwise ℓ-primary F; q>d | For C₂ and C₃, norms of residue primes are 1/2 and 1/3, hence excluded. Other primes have norm 1. A=K,d=0 gives H^q=0 for q≥1; A=0 gives 0 in every degree. |

The complete README instance ledger follows. Nonapplicable tests (for example group parity in a definition of a scheme site) are not presented as evidence.

Here k denotes an algebraically closed field unless specified; V₂ has primes 0<p<m, v(y)=(1,0), v(x)=(0,1), lexicographically ordered. V₁ is a nonfield rank-one valuation domain, t a nonzero nonunit. Sides are given in mathematical notation. These are adversarial instance computations, not proofs of the general targets. Identity computations do not alone certify a theorem. Every numbered target was read in full, including its API and proof route.

| README target | Instances and computed sides | Result/change |
|---|---|---|
| Conventions | In V₂, v(y/xⁿ)=(1,−n)>0, so y∈∩xⁿV₂; V₂→V₂,p makes x a unit while V₂→V₂/p sends y to 0. H¹(Z[−1])=Z; Tor_i^(Z/4)(Z/2,Z/2)=Z/2 for all i≥0. | Directions and shifts agree. |
| 0.1 aic | k: every monic positive-degree polynomial has a root; Q: T²−2 has zero rational roots; k×k: coordinate roots exist, (1,0)(0,1)=0; 0: no positive-degree polynomial. | Both positive and negative cases agree. |
| 0.3 bounded extensions | V=k, A=F_p: V₀=algebraic closure of F_p in k has size ℵ₀; A=0 has no unital map to V≠0; a DVR extends to its algebraic-closure valuation ring, whose values include v(t)/n. | Bound max(ℵ₀,|A|), nontriviality and extension agree. |
| 0.4 finite rank | k∩V=k has rank 0; k(x)∩V₂ has rank 1; k(x,y)∩V₂ has rank 2. In an infinite-variable composite valuation, stages have ranks 1,2,…, without a common bound. | Retains stagewise finite rank. |
| 0.5 splitting | p=0: V=Frac(V)×_Frac(V)V; p=m: V=V×_κ(m)κ(m). In V₂, y/xⁿ∈p gives pV_p=p and pullback V_p×_κ(p)V/p=V. | Equalities agree. |
| 0.6 intervals | [p,p] gives (V/p)_(0)=κ(p); [0,m] gives V; [0,p] and [p,m] give V_p,V/p with intersection κ(p). | Correct direction; three Checks discriminate endpoints. |
| 0.7 ind-smooth | V=k gives Ω¹=0; k[t]_(t) gives Vdt; k[ε]/ε² has nonzero nilpotent ε whereas every filtered colimit of smooth k-algebras is reduced. | Positive cases and excluded non-domain agree. |
| 1.1 universal descent | id has Tot K=K; for K=Z[0], equalizer in the derived sense of id,id is Z[0]⊕Z[−1], H¹=Z versus Tot H¹=0; a split fold has Tot=F(X). | Full Čech condition necessary; replace the generic Check as in R01. |
| 1.3 h-site/blowups | Z=∅ forces Y=X; Z=X,Y=∅ gives cover ∅⊔X=X; Bl₀ A² has fibre P¹; deleting chosen exceptional point removes its centred valuation lift. | Degenerate squares and negative cover agree. |
| 1.4 h criterion | Identity square produces F(X)×_F(Z)F(Z)=F(X); dual-number reduction h-cover forces A¹ sections k[ε]/ε²→k, noninjective, so A¹ is rejected. | Mathematical test agrees; R02 orders §1.6 before its consumer. |
| 1.5 perfection | (F_p[ε]/ε²)^perf=F_p; (F_p[t])^perf=F_p[t^(1/p∞)]; perfect V₂ splitting is canonical/arc but not v: no branch lifts identity V₂. | Restrictions and strictness agree. |
| 1.6 v approximation | A[x₁,x₂,…]=colim A[x₁,…,x_n]; evaluation x_i↦0 gives section at every stage; for A=0 all spectra empty. | Arbitrary presentation and cancellation agree; R03 supplies the missing negative diagram. |
| 1.7 subtrusiveness | id_∅: 0 pairs; id_Spec k: 1 pair lifts. Split V₂: 0⇝m has 0 comparable lifts, despite three target points covered; Frac(V₁) misses m. | Distinguishes surjectivity, submersion and subtrusiveness. |
| 2.2 v/arc | Noetherian dual-number reduction: both true; V₂ split: arc true, v false; base change to V_p or V/p gives a branch section, v true. | Noetherian-target restriction survives. |
| 2.3 Milnor covers | I=0 supplies identity A/I=A; I=A forces B=A under I≅J and supplies identity; V₂ split kills y or inverts x, preventing its v-lift but covering rank-one intervals. | Arc and not-v distinction agrees. |
| 2.4 comparable points | id_V₁ has η⇝s; Spec Frac(V₁)⊔Spec κ(m) has both points but no η⇝s, so fails; over a field one nonempty fibre suffices. | Necessity of specialization retained. |
| 2.5 purity | id on M=V/(t²): 1↦1; V→Frac V on V/(t): 1↦0; k[ε]/ε²→k after a valuation test is V→V; k→0 sends 1↦0; 0→0 has 0 tests. | Both sides agree in all five cases. |
| 2.7 spectral iff | id field: subsets ∅,{*} preserve openness; generic inclusion: preimage {m}=∅ is compact open but {m} not open; V₂ split: open-preimage subsets exactly ∅,{0},{0,p},{0,p,m} among eight. | Iff agrees on true/false tests. |
| 2.7 limit theorem | Singleton index: induced map=f. Polynomial tower folds: limit fold Spec k[x₁,x₂,…]⊔Spec k[x₁,x₂,…]→Spec k[x₁,x₂,…], lift W=V. Replacing a constant field source limit by ∅ yields 0 field lifts. | Limit-cone hypotheses essential; no padding. |
| 3.1 cotruncation | Finite sets K: Map(K,X)=X^K is 0-truncated. Map(Λ[−r],X)=Ω∞(X[r]) has homotopy only through r for X≥0. In Spaces, Map(*,K(Z,n))=K(Z,n), with arbitrarily large n. | Correct nonuniform bound. |
| 3.2 finitary | Terminal: colim *=*. Finitely presented T: equations factor at a finite stage. Infinite polynomial T: identity uses all variables, no finite stage. | Positive/negative continuity agree. |
| 3.3 totalizations | Constant cosimplicial finite set S: Tot=S and colim Tot=Tot colim. Constant identity scheme diagram yields the same Čech comparison. Bound n depends on compact K, not the filtered index. | Matches specified target class. |
| 3.4 h→v | Constant terminal functor has fppf,v values *. For a constant abelian coefficient at an algebraically closed field, both H⁰=Λ and positive H=0. Infinite polynomial affine approximation retains the split identity descent map. | No removal of truncation asserted. |
| 3.5 detection | Identity singleton tests the original map; finite affine opens glue equalities; empty family makes all tests true but A¹(Spec k)=k→A¹(∅)=* is not bijective for k=F₂. Product base change has projection multiplication section. | Empty-family control agrees. |
| 3.6 ultraproducts | I=∅: Spec 0=β∅=∅; I={1,2}: two ultrafilters and fibres Spec V₁,Spec V₂. Nonprincipal ultrapower of a fixed rank-one V has positive values [(n)]>r[(1)] for every integer r, hence nonarchimedean rank>1. | Rank is correctly not claimed preserved. |
| 3.7 component obstruction | v(y)=(1,0),v(x)=(0,1): contractions 0,(y),(x,y), three distinct points over F₂ and F₃. Rank 0/1 valuation components have respectively 1/2 points. | Three images cannot lie in such a component. |
| 3.8 Boolean sheaf | Singleton stalk=global F(A); empty global=F(0)=terminal; two factors give F(k₁)×F(k₂). For identity ring functor, a nonprincipal stalk is colim_U ∏_(i∈J)A_i=∏_U A_i. | Correct product and stalk formulas. |
| 3.9 ultrafilter detection | Two-factor tests are projections A₁×A₂→A₁,A₂, tensoring kills cross factors and both sides give product comparisons. For I=ℕ, principal stalks miss a nonprincipal ultrafilter; all-ultrafilter hypothesis includes it. | No principal-only claim. |
| 3.10 aic detection | A=k: identity aic factor; A=0: empty product=0 and cover ∅→∅. Valuation V₂→its aic extension retains rank 2, so product basis does not imply rank-one components. | Nonempty and rank boundaries agree. |
| 4.1 prime extension | k→W aic positive rank, p=0: pW=0, q=m_W and W⊗_k k=W=W_q≠Frac W. V→κ(m), p=0: ker=m⊄p, contraction of 0 is m, excluded. | Added kernel hypothesis repairs source error. |
| 4.2 persistence | Constant A_i=A,B_i=A gives v at each stage and limit. A_i=Z, B_i=Z[1/(i!)] has noncartesian transitions; generic limit is Q, not v over Z. | Cartesian hypothesis not silently removed. |
| 4.3 excision | Terminal comparison *=*×_* *. Node k[x,y]/xy base-changed to k[y]: pullback k[y]×_k k=k[y]; to k[x]: k×_k k[x]=k[x]. v-image of split V₂ lacks identity section but branches have it. | Nonexcisive v-sheaf detected. |
| 4.4 intervals | Field P contains its singleton; rank 2 overlaps [0,p]∪[p,m]=[0,m]. Infinite descending p_n: P avoiding 0 plus [0,0] lacks [0,p₁], strict extension at 0 is false. | Strict rather than weak extension matters. |
| 4.5 split descent | If pW=W: quotient=0, localization=W. If p<ker f: pW=0, W⊗V_p=W⊗κ(p)=0. Field embedding case q=m_W, yielding W rather than Frac W. | All three cases covered. |
| 4.6 criterion | Terminal F: arc/excision/aic-excision all true. v-image H in §4.3: v true, aic-excision false, arc false. At p=0 or m the pullback is identity. | Equivalence discriminates v from arc. |
| 4.7 rank-one detection | Identity transformation: each comparison identity. Zero→constant nonzero Λ fails already at Spec algebraic closure of F₂, with H⁰ 0→Λ. Fixed n-truncated terminal comparison has fibres *, unbounded K(Z,r) lack a common n. | Fixed truncation bound retained. |
| 5.1 bounded site | Empty family covers ∅; dual-number reduction has the same valuation maps. Any finite set of Z_(p) misses closed point (q) for q outside it; adjoining Q only covers generic point. | Finite-family convention discriminates infinite family. |
| 5.2 coherent topos | Pushout {a,b}⊔_{a}{c}={b,c}; relations sizes 2,1,1. Two-element→singleton relation has 4 elements. Dual-number sheafified representables agree although raw affine-line sections differ by ε. | Coherence and monomorphism controls agree. |
| 5.3 coherent tests | Identity between coherent representables lifts every section. Map ∅→h_Spec k fails the k-test (0 preimages). Infinite coproduct Q and Z_(p) has valuation lifts but no finite covering subfamily. | Source quasi-compactness distinguishes false generalization. |
| 5.4 cutoffs | For X=Spec R and X=∅, inverse image sends terminal to terminal and initial to initial; same small field X gives h_X^# in both. A ring of size in [κ,κ′) is an extra larger-site object. | No whole-topos equivalence asserted. |
| 5.5 unrestricted excision | I=0 gives identity A/I=A; I=A gives B=A. V₂ prime square pushout tests yield V_p,V/p with overlap κ(p), and F(V)=F(V_p)×_F(κ(p))F(V/p). | Identity and nontrivial Milnor cases agree. |
| 5.6 not subcanonical | A=k[ε]/ε², quotient k: k⊗_A k=k, all Čech levels k; h_A¹ comparison A→k has kernel (ε)≠0. | Correct failure of descent. |
| 6.1 strict henselian calculation | Constant Λ on aic V: H⁰=Λ=closed stalk, H^q=0 for q>0; extension by zero from the generic open has closed stalk 0 and RΓ=0. A degree-r finite étale cover is r copies of V. | Closed, rather than generic, stalk is essential. |
| 6.2 strict-henselization detection | On Spec k the strict localization is k, so the Čech comparison is unchanged. A split fold has Tot=Λ. For the empty cover of Spec k, the comparison is Λ→0, and the k-stalk detects the failure. | Positive and negative tests agree. |
| 6.5 étale chain | Rank 0: one vertex and FinSet. Rank 1: Spec V has stalks (*,*), generic open (*,∅); the transition is ∅→*. Fold has components {1,2}→{*}, which is not injective but is a valid morphism. | n+1 vertices and unrestricted morphisms required. |
| 6.6 étale arc-descent | For aic V₂ split at p, finite étale categories give FinSet×_FinSet FinSet=FinSet. Separated objects glue the two injective-transition diagrams across the common finite set; arbitrary diagrams do so for constructible sheaves. Empty base gives the terminal category in all three cases. | Distinguishes object injections from morphisms. |
| 7.3 constructible complexes | Rank 0 gives one Dᵇ_fg(Λ); rank 1 skyscraper gives Λ→0, versus constant Λ→Λ. For Λ=Z/4, Tor_i(Z/2,Z/2)=Z/2 in every degree, including i=0,1,2. | Bounded cohomology is not finite Tor dimension. |
| 7.4 h-forms | k: F₀=k,F_i=0 for i>0; k[t]: F₁=k[t]dt in degree 0; k[ε]/ε²: F₀=k, whereas naive Ω⁰=k⊕kε. | Sheafification eliminates the wrong model. |
| 7.5 smooth comparison | X=Spec k[t]: H⁰ on both sides=k[t]dt and H^q=0 for q>0. X=∅: both 0. The singular dual-number model has Ω⁰=k⊕kε versus F₀=k and is excluded. | Smooth/ind-smooth range retained. |
| 7.6 differential arc-descent | For V=k, p=0, the differential square has identity sides. For aic V₂, x∈p has a square root in p, so x∈p² and p/p²=0; tensoring the exact prime square by flat Ω^i preserves its kernel. Naive dual-number Ω⁰ fails reduction descent. | Idempotent-prime and flatness conditions agree. |
| 7.7 Perf arc-hyperdescent | X=∅ gives the zero category. On a perfect field k the fold has Perf(k×k)=Perf(k)² with diagonal descent Perf(k). For perfect V₂, Tor_i(V/p,V/p)=0 for i>0; the square reconstructs the rank-one free module V. | Perfectness and Tor strata are substantive. |
| 7.8 perfectness and canonical covers | Empty scheme: zero section rings and bijections. F₂[ε]/ε²: ε²=0, failure; F₃[t]: t has no cube root, failure. Perfect polynomial ring sends t^(1/p²) to t^(1/p), not t^(1/p³). p=0,1 allows only ∅; p=4 admits Spec F₂. Infinite disjoint union is perfect/qs but not qc. Identity: arc=true, universal effective epi=true; ∅→Spec F_p: false,false. | Primality, qc and correct Frobenius direction retained. |
| 8.1 formal data | Z/p^n=Z_p/p^n for n=1,2; opens are Z[1/p] and Q_p. I=0 requires A≅B; I=A yields quotients 0=0 for every map. In V₂, y∈∩xⁿV gives y↦0 on completion. | No injectivity or one-open shortcut. |
| 8.4 rank-one completion | Z_(p)→Z_p injective/local, value group Z on both. Replacing t by t² gives cofinal filtrations (t^n),(t^(2n)). V₂ at x has nonzero y in the kernel. For t=1 completion is 0, excluded. | Rank-one and parameter restrictions necessary. |
| 8.5 completion cover | I=0: completion A and empty complement; I=A: completion 0 and complement Spec A. In V₂, x becomes a unit on D(x), y becomes 0 in completion; neither branch admits the identity V₂ test. | Arc=true, v=false in the rank-two example. |
| 8.6 formal glueing | I=0 gives F(A)=F(B) with B=A; I=A gives F(B)×_F(B)F(A)=F(A). For Z→Z_p, four corners are Z,Z_p,Z[1/p],Q_p, retaining both distinct generic rings. | Domain/target and degenerate pullbacks agree. |
| 8.7 rigidity | Constant Λ gives id Λ. Finite étale Z_p-algebras and F_p-algebras correspond. Ring-valued identity sends Z_p→F_p with kernel pZ_p≠0, so is not rigid. Unit ideal is henselian only in 0. | Positive and negative models separated. |
| 8.8 punctured rigidity | Complete aic V with I=(t): both punctures Spec Frac V, constant cohomology Λ[0]. I=0: both punctures ∅ and value 0. I=A with henselian pair forces A=0. | Stable fibre argument has the stated coefficient category. |
| 8.9 support comparison | A=Z_p,U=D(p): completion changes neither Q_p nor F; U=Spec A: identity Z_p. For Z=∅ support complexes are 0. I=(x,y) in k[[x,y]] has both (x)- and (y)-generic directions, unlike a single D(x). | Arbitrary opens and finite ideals retained. |
| 9.1 arc_t | id has W=V; completion lifts to complete W. V→Frac V has zero pseudouniformizer-preserving lifts. If t=0 or 1, test class is empty, so every map passes. Boundary product adds R/t=R at t=0 and R[1/t]=R at t=1. | Empty classes and failed inversion distinguished. |
| 9.2 Tate pairs | Identity of (K,O_K) hits its unique generic rank-one point and is arc_t on plus rings. Map to the zero Tate algebra has empty Spa and fails the nonempty rank-one test. Two copies mapping to one hit the same point and give a split cover. | Generic-point surjectivity agrees. |
| 9.3 arc_t equivalence | Z_p[x]/(px)→Z_p: every test sends x to 0, Hom sets coincide. Complete V→V[1/t]: Hom(V,V) contains id, Hom(V[1/t],V)=∅. Identity gives an actual bijection, not just surjectivity. | Uniqueness of lifting is tested. |
| 9.4 E_t | Complete aic V: generic fraction field algebraically closed, H⁰=Λ,H^q=0 for q>0. t=0 gives localized ring 0; t=1 gives completed ring 0. On a field with t≠0, E_t=0 whereas ordinary H⁰=Λ. | Completion/localization order fixed. |
| 9.5 E_t hyperdescent | Identity hypercover of complete V: all values Λ[0], Tot=Λ[0]. Split fold: two-factor Čech descent gives Λ. Added R/t and R[1/t] each contribute 0. For t=0,1 every value is 0. | Boundary terms vanish for the specified functor. |
| 9.7 total integrality | V₁, v(t)>0: c v(t)+n v(z)≥0 for all n forces v(z)≥0. In Z_p, z=p^−1 gives v(p^c z^(c+1))=−1, so no uniform c. With t=1 localization=A and c=0 works. | ∃c∀n, not ∀n∃c. |
| 9.8 E_t invariance | Removing x in Z_p[x]/px, then p-completing and inverting p gives Q_p on both sides. For complete aic V→V×V, E_t changes Λ→Λ²; this cover is not an equivalence, since there are two projections to V. | Covers alone do not give invariance. |
| 9.9 universal homeomorphisms | k[ε]/ε²→k has identical reduced Čech intersections and sheaf values. Purely inseparable k→k^(1/p) has nilpotent diagonal kernel (u⊗1−1⊗u)^p=0. A split two-point cover changes H⁰ Λ→Λ² and is not a universal homeomorphism. | Nil and inseparable cases agree. |
| 9.10 common total closure | A=B: identity square. A=k[t²,t³]⊂B=k[t], parameter t²: common localization k[t,t^−1], common integral/total closure B. Here A'=A+t²B=A, but the kernel A/t²A→A/t²B is generated by the nonzero class of t³, whose square t⁶ vanishes modulo t²A. | Regular parameter and induced, not abstract, closure isomorphism required. |
| 10.0 affinoid carrier | n=0 gives K; quotient by 1 gives 0; quotient by T² gives K⊕KT with T²=0, not reduced. | Native quotient predicate accepts all three. |
| 10.0 torsion | Constant Z/6: 6x=0; constant Z: n·1=n≠0. Direct sum ⊕Z/ℓ^r: a finite-support section is killed by ℓ^max(r), but exponents are unbounded across sections. | Affine-section, not one global exponent, predicate. |
| 10.0 primary torsion | Z/ℓ² has 1 killed by ℓ² but not ℓ. Distinct prime r gives ℓ^n·1≠0 in Z/r. At ℓ=1 only 0; at ℓ=0, n=1 kills every section. | Prime binder rules out junk parameters. |
| 10.1 rational domains | (X,1) at 0 gives max=1,min=0. Characteristic p,n=1: constant Z/p has H^q=0 for q≥2. n=0, K[ε]/ε²: H⁰=Λ,H^q=0 for q≥1. Over C_p, p≠0 in K even though |p|<1, so the characteristic-p proof is inapplicable. | Corrected maximum and coefficient split. |
| 10.2 rational Mayer–Vietoris | f=0,g=1: A⟨f/g⟩=A, other patch and overlap=0; pullback RΓ(A)×_0 0=RΓ(A). f=g=1: all four algebras A and identity square. f=g=0 does not generate 1 in nonzero A. | Numerators/denominators and unit-ideal hypothesis agree. |
| 10.3 shrinking tubes | r=0: U₀=f; r=1: πU₁=f and U₀↦πU₁. f=0: every tube=A and quotient=A; f=1: sufficiently small tubes empty and quotient=0. In a complete rank-one test ∩πⁿV=0, so f=U_r=0. | Transition is multiplication by π. |
| 10.5 generic Künneth | R=R'=V complete aic: Λ⊗Λ=Λ=E_π(V). R=V/π or V[1/π]: E=0 and tensor product side also 0. Residue characteristic ℓ makes the required invertibility false. | All three valuation branches agree. |
| 10.6 affinoid Künneth | A=B=K: F_ℓ⊗F_ℓ=F_ℓ. A=K×K,B=K: F_ℓ² on both sides. A=0: both 0. Dimension bound for two d-variable Tate factors is 2d. | Completed tensor and coefficient field correct. |
| 10.7 constant bounds | d=0: K and K[ε]/ε² have no positive cohomology. d=1 hypothetical nonzero H² gives H⁴ on tensor; its dimension≤2 forces H⁴=0 since 4>3. General contradiction 2d+2>2d+1. | Strict inequalities and inseparable reduction agree. |
| 10.8 arbitrary torsion bounds | A=K: H⁰=Λ, all positive H=0; A=K²: H⁰=Λ²; A=0: all 0. S₃ Sylow indices at ℓ=2,3 are 3≡1 and 2 with inverse 2. C_ℓ: (g−1)^ℓ=0; trivial trace=1. C₂,C₃: |p|=1/p≠1, while |ℓ|=1 for ℓ≠p. | Bounds q>d+1 and q>d match both signatures. |
| 11.1 complete arc | I=0 gives completion V; I=A gives 0, so no nonzero complete tests. Z_p→Q_p fails on V=Z_p; Z_p→Z_p succeeds. For I⊆J, a rank-one J-complete test is I-complete: IV=0 or both ideals give cofinal filtrations. | Inclusion direction and zero/unit ideals agree. |
| 11.2 product basis | One V: D(t)=Spec Frac V, one point vs two. Two factors, D((t,1)): Spec Frac V₁⊔Spec V₂. Empty product=0 and empty cover has unique section. Finite I quotients of products are coordinatewise; limits recover the complete product. | Open components are localizations, not original factors. |
| 11.3 formal comparison | A field p-complete implies p=0, hence completion is itself. k→valuation ring of algebraic closure k((s)) supplies a rank-one characteristic-p extension. Dual-number reduction has identical valuation maps but k⊕kε≠k as section rings. | Rank-zero tests retained; structure presheaf distinction correct. |
| 11.4 arc_I boundaries | I=0 gives identity boundary R/I; I=A=(2,3) in Z gives D(2)∪D(3)=Spec Z although neither generator is a unit. For (x,y), points (0,1),(1,0) have union indicator (1,1), intersection indicator (0,0). Z_p→Q_p has no lift of id Z_p. | All principal opens necessary. |
| 11.5 completed/punctured descent | Complete aic V,I=(t): whole and punctured constant values Λ[0]. I=0: whole R and empty puncture; I=A: completed and henselized ring 0, both functors 0. Identity hypercovers retain these values under Tot. | Four functors have the right endpoints. |
| 12.2 perfectoid comparison | A=completion Z_p[p^(1/p∞)]: normalized model A, same generic field. A=F_p×O_Cp: p-torsion F_p×0, image O_Cp, generic C_p. Perfect characteristic-p A gives generic ring 0, hence every cohomology group 0 on both sides. | Empty fibre handled before the declared comparison gap. |
| 12.4 formal targets | T=Spf F_p,X=Spf k perfect: one map on both sides of descent. T=∅,X nonempty: no maps; X=∅: one map to every T. For T=Spf Z_p, X=Spf O_Cp, the canonical map sends pⁿ to pⁿ→0 and is continuous. | Continuity and arbitrary target size preserved. |
| 12.5 proper henselian comparison | I=0: identity. I=A henselian forces A=0, both cohomologies 0. X=P¹ over O_Cp, ℓ≠p: both H⁰=F_ℓ,H²=F_ℓ(−1), and H¹=0. | Properness alone suffices; no flatness is used. |
| 12.6 tilting | Perfect characteristic-p A, ϖ=0: A♭=A, both zero-complete arc predicates coincide. Identity map of mixed-characteristic perfectoid A: both lift via W=V. Compatible sharp makes (ϖ♭)^# and ϖ generate the same ideal. | Completion and sharp parameters agree. |
| 12.7 perfectoid hyperdescent | Identity hypercover of perfect k: Tot k=k, Tot k♭=k, Tot W(k)=W(k), all in degree 0. Split fold k→k² has the same three Tot values. For zero ring all three values 0. | A_inf is W(tilt), not direct perfection. |
| Supplied extension Checks (lines 244–248) | id reflects units and is injective; V→Frac V sends t∈m to a unit; V→κ(m) sends nonzero t to 0. | Both independent conditions discriminate. |
| Supplied cover Checks (lines 366–371, 470–476) | ∅→∅ has no tests; ∅→Spec k has zero lifts. Polynomial projections have zero-variable evaluation sections; rank-two split has no full-chain lift; dual-number reduction kills ε and is arc. Proper blowup lifts the chosen centred valuation, deletion loses it. | Matches §§1.3, 1.7, 2.3, 2.5 and 5.6. |
| Supplied spectral Checks (lines 478–482) | Identity reflects all opens. Proper open misses a point. In BM21's infinite chain, f⁻¹({0}) is the inverse image of closed βN∖N, hence closed; {0} is not closed in Spec V. Equivalently the nongeneric locus has open inverse image but is not open; that inverse image is not compact. | Spectral submersion true, ordinary quotient false. |
| Worked conventions (lines 1584–1588) | v(y/xⁿ)=(1,−n)>0 for n=0,1,2; y maps to 0 in x-completion. For (x,y), the two axis points are in the union and not the intersection. π⁰·πU₁=πU₁=f, matching U₀=f. | Same signs, directions and boundary values throughout. |


## Not verifiable

- HUB96, Corollaries 3.2.2 and 4.2.7 and Theorems 3.2.9–3.2.10: the source is settled as uncertified. Checked the current supplier contracts and the readable BM21/BS22 applications, but did not certify the book's wording or printed pages. No new source request was made.
- No fresh Lean elaboration or proof build was performed, as required by the read-only instructions. The ten supplied elaborated signatures were compared individually; mathematical truth is assessed from the definitions, sources and instance computations, not inferred from `sorry` elaboration.
- Implementation of the five explicitly declared supplier gaps is future work. Their hypotheses, owners and matching declarations were checked; this review is conditional on those contracts, and their current absence is not a finding.
- Ownership against unspecified open heads was not individually inspected beyond the mandated indexed searches. All 55 sibling folders whose paths were supplied were searched directly. Existing-roadmap revision pull requests were not substituted for main as suppliers.

## Source issues

- **Misprint** in BM21 at Definition 3.26, printed p. 22 (BM21 line 922): the source says every monic polynomial has a root, including constant 1; it should be every positive-degree monic polynomial; affects a stated result.
- **Misprint** in BM21 at Remark 3.31, printed p. 23 (BM21 line 977): the source says Proposition 3.29 supplies the valuation-product cover; it should be Proposition 3.30, with Lemma 3.27 identifying ultraproduct components; affects nothing.
- **Error** in BM21 at Lemma 4.3, printed p. 25 (BM21 line 1040): the source says pW contracts to p for every map V→W with pW proper; it should be require ker(V→W)⊆p; affects a stated result.
- **Gap** in BM21 at proof of Lemma 4.4, printed pp. 26–27 (BM21 line 1080): the source says Lemma 4.3 applies whenever pW is proper; it should be separately handle p strictly below the kernel, where both localization tensors vanish; affects the proof.
- **Misprint** in BM21 at proof of Theorem 5.6, printed p. 40 (BM21 line 1669): the source says a rank-n valuation spectrum has n vertices; it should be n+1 vertices, indexed 0 through n; affects the proof.
- **Error** in BM21 at proof of Theorem 5.6, printed p. 40 (BM21 line 1672): the source says the category is a functor category into finite sets and injections; it should be the full finite-set diagram subcategory with injective object transitions and arbitrary natural transformations; affects the proof.
- **Misprint** in BM21 at Example 6.1, printed p. 47 (BM21 line 1942): the source says horizontal-map fibres are supported K-theory; it should be vertical localization-map fibres; affects the proof.
- **Misprint** in BM21 at proof of Theorem 6.25, printed p. 55 (BM21 line 2310): the source says the special-fibre kernel is nilpotent; it should be nil, as its elementwise argument proves and universal homeomorphism requires; affects the proof.
- **Misprint** in BM21 at proof of Lemma 7.8, printed p. 58 (BM21 line 2458): the source says the minimum of generator absolute values is bounded positively below; it should be their maximum, as (X,1) at zero demonstrates; affects the proof.
- **Misprint** in BS17 at Example 2.3, printed p. 5 (BS17 line 206): the source says the valuation centred at the deleted exceptional point cannot lift to the full blowup; it should be cannot lift to the punctured blowup X; affects a stated result.
- **Misprint** in BS22 at proof of Theorem 9.1, footnote 15, printed p. 72 (BS22 line 2807): the source says algebraically closed residue fields suffice for splitting arbitrary finite covers of the valuation factors; it should be algebraically closed fraction fields, as in the chosen basis; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "9af1fe1682bee639fad990cd2e1c4ed3fd031f50", "job": "RT-ArcTopologyAndDescent~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
