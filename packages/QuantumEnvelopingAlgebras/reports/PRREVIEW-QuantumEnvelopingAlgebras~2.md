# Review of QuantumEnvelopingAlgebras (pull request #1125 at 47df477)

**Verdict:** needs changes

AI review by Codex. Two blocking findings concern omitted generality and missing statable headline theorems. Five further findings concern citations, specification structure and Lean form. The supplied gate fails; the Lean elaboration and the dependency check pass. No files in the pull request were changed.

## R01 (P2) — Cover the omitted root-of-unity orders

**Location:** `TauCetiRoadmap/QuantumEnvelopingAlgebras/README.md:402`, with lines 430 and 542–544. The odd branch assumes “odd and coprime to every dᵢ”; the modified branch is explicitly even and also excludes small orders.

**Claim:** These branches specify the roadmap's root-of-unity theory. They leave the bad odd orders with no target, contrary to the required general-library scope. This is a scope omission, not a claim that the displayed coprime-order theorem is false.

**Witness:** For G₂, take `A=[[2,-3],[-1,2]]`, `d=(1,3)` and a primitive cube root. Then `gcd(3,3)=3`. The odd theorem excludes it; the even theorem cannot apply.

**Repair:** Add the general root-of-unity branch, with its actual modified root datum and the exceptional small-order cases, rather than simply dropping the coprimality hypothesis from the classical-target formula. Assign the constructions and any necessary exceptional targets to explicit layers. The first regression must be the instance above: the root-specific lengths are `(3,1)`, and scaling gives `A*=[[2,-1],[-3,2]]`, with symmetrizer `(9,3)`. Its two off-diagonal symmetrized entries are both `-9`; the existing uniform exponent `ℓ=3` does not describe both root directions. Also account explicitly for the B₂/G₂ small even orders left outside lines 542–544. This repair preserves the stated coprime theorem while supplying the theory it omits.

## R02 (P2) — State the braid and signed-Lucas headlines on the available carriers

**Location:** `TauCetiRoadmap/QuantumEnvelopingAlgebras/Suggested.lean:18` and `TauCetiRoadmap/QuantumEnvelopingAlgebras/README.md:269`, `:570`.

**Claim:** The docstring treats the braid operators as unstatable because their well-definedness is a theorem. That is precisely what an existential headline can assert. The signed quantum-Lucas identity is also absent, although its Laurent-polynomial carrier is present in the companion file.

**Witness:** A scratch copy elaborates `∃ T : U D q ≃ₐ[K] U D q, ...` with all five displayed generator families. It needs no new carrier or admitted data.

**Repair:** Add the braid-automorphism existence theorem with the QEA2 generator formulas, together with the braid-action headline, using the existing quotient and algebra-equivalence type. Add the full signed quantum-Lucas identity using a real signed extension of the companion's Gaussian polynomial, integer Euclidean division and native `Ring.choose`. Carry the genericity and root-order hypotheses explicitly. The signed extension is `[-a choose r]_v=(-1)^r[a+r-1 choose r]_v` for positive `a`; it needs no opaque predicate. Update the module docstring's complete headline inventory, including QEA4 and QEA8, and name the actual unavailable carriers for the remaining omissions.

**Repair validation:** The full braid generator-existence signature elaborated at the pins. Its formulas preserve all four mixed E/F commutators on the nine-dimensional tensor square of the standard A₂ representation at `q=2`, and the two length-three braid words give identical matrices for all six generators. The signed-Lucas signature was also checked on a scratch copy with the required `import Mathlib`; the arithmetic regression is `[-3 choose 3]_ζ=-1=binom(-1,1)`, not zero. These are statability and instance checks, not proofs of the general targets.

## R03 (P3) — Supply locators for the sampled integral specialization and the uncited layers

**Location:** `TauCetiRoadmap/QuantumEnvelopingAlgebras/README.md:360–398`, especially line 385's “the course”; `:829–843`.

**Claim:** The seeded target “Integral specialization at1” has no identified mathematical source, theorem number or printed page. ReductiveGroups §9A.5 supplies the classical lattice, not the quantum-to-classical integral isomorphism. The references list only McGerty and Gros–Kaneda; neither is attached to this target. Most claims in QEA0–4, QEA6 and QEA8 likewise lack locators.

**Witness:** The only link in QEA4 is to ReductiveGroups §9A.5. That section constructs a classical highest-generated lattice; it does not state `V_A(λ)⊗_(v↦1)ℤ ≃ V_ℤ(λ)`.

**Repair:** Identify the course and add exact locators for the integral result, its weight-piece restrictions and arbitrary-ring base change. A result only over ℂ does not certify the ℤ statement. Supply exact primary/textbook locators for the other theorem families, identifying any new full-Y extension and the lemmas used to prove it. The distinguishing test is highest weight `2ω`: the classical highest-generated lattice has basis `x²,2xy,y²`, whereas the monomial lattice has basis `x²,xy,y²`. The comparison to monomials has determinant `2`, so rational character equality cannot replace the missing integral argument. The proposed Φ between highest-generated lattices has determinant `1` in their own divided-power bases.

## R04 (P3) — Add the required APIs, discriminating Checks and target dependencies

**Location:** `TauCetiRoadmap/QuantumEnvelopingAlgebras/README.md:1–83`, `:252–356`, and the subsequent QEA sections.

**Claim:** The document lacks the required Summary, Scope and ownership, Exact supplier contracts and How to read the build sections. There are no `*Needs:*` lines or layer Dependencies sections. Most definitions have neither an API list nor three discriminating Checks; the three quantum-plane Checks at line 702 do not cover the other objects.

**Witness:** QEA0 introduces the datum and quantum integers without a Checks list. QEA2 introduces braid operators/root vectors without three computed Checks. Searching the whole README finds zero `*Needs:*` lines.

**Repair:** Reshape the existing mathematics into the prescribed layers without replanning its scope. Give each definition its API and three computed positive/negative controls; attach dependencies to each target and end each layer with Examples and Dependencies. Resolve the six supplier groups listed below into exact contracts, including the native library declarations. For QEA0, use empty-root data with nonzero central lattice, A₁, and B₂: `d=(1,2)` gives `-2=-2`, while `d=(1,1)` gives `-2≠-1`. For the quantum integer, explicitly distinguish the rational function from its integral specialization: the current totalized `qInt 1 1` is `0/0=0`, while the Laurent specialization is `1`. These controls discriminate the conventions instead of repeating their definitions.

## R05 (P3) — Bring the companion Lean file under the same form rules

**Location:** `TauCetiRoadmap/QuantumEnvelopingAlgebras/QuantumPlaneLatticeTargets.lean:5–23`, `:38–50`, `:74–104`.

**Claim:** The companion uses three Mathlib submodule imports, lacks the `TauCetiRoadmap` namespace prefix, has several undocumented declarations and does not have the required target-signatures module header. Its Lean names are not individually mapped in the README. The brief applies the Lean rules to this file as well as Suggested.

**Witness:** Lines 5–7 import `Mathlib.Algebra.Polynomial.Laurent`, `Mathlib.LinearAlgebra.Matrix.ToLin` and `Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots`; line 19 opens `QuantumEnvelopingAlgebras.QuantumPlaneLattice`.

**Repair:** Use the single `import Mathlib`; place any retained headline signatures and their necessary definitions under `TauCetiRoadmap.QuantumEnvelopingAlgebras`; add the prescribed module/declaration documentation and README name correspondence. Consolidate the statable acceptance targets into `Suggested.lean` so the targeted build actually checks them, and remove the illustrative-only API material. Do not preserve special-case substitutes for the general headlines in R02. The existing seven statements elaborate and the column convention passes the computations below; the requested change is their acceptance-test role and form, not a reversal of the matrices.

## R06 (P3) — Correct the classical-carrier explanation at the pins

**Location:** `TauCetiRoadmap/QuantumEnvelopingAlgebras/Suggested.lean:20–24`.

**Claim:** The omission explanation points to the classical integral enveloping algebra as an unavailable roadmap target and mentions only Mathlib. The acceptance test is against both pins. Tau Ceti already supplies the integral-form carrier and its Hopf structure. This does not by itself make every quantum comparison statable: the quantum integral form and the module constructions must be audited separately.

**Witness:** `TauCeti/Algebra/Lie/UniversalEnveloping/Kostant/Form.lean:124` defines `TauCeti.UniversalEnvelopingAlgebra.kostantForm`; `Kostant/HopfAlgebra.lean:303` supplies `instHopfAlgebraKostantForm`, for arbitrary supplied root and Cartan families.

**Repair:** Cite these exact pinned APIs in the supplier contracts and revise each omission explanation to name the genuinely missing quantum carrier or root-datum identification. The native definition is a subring generated by all divided powers and toral binomials; it does not itself assert that arbitrary input families form a Chevalley/root-datum basis. For the full-Y comparison, instantiate the Cartan family by the actual `H_y` or the proved basis-direction construction from ReductiveGroups §9A. The empty-root one-dimensional torus is covered by the carrier (`binom(H,n)` generators); a semisimple-only substitute would miss it.

## R07 (P3) — Replace the commit-pinned supplier link that fails the gate

**Location:** `TauCetiRoadmap/QuantumEnvelopingAlgebras/README.md:369`.

**Claim:** The ReductiveGroups §9A.5 URL contains a commit SHA. The supplied `blob` rule rejects this, so the gate fails even though its build passes.

**Witness:** Gate output: `blob=1`, `depcheck=0`, `build=0`, `FAIL`. The sole reported offending line is 369.

**Repair:** Name `ReductiveGroups §9A.5` and use the repository-relative README link with its §9A anchor, or a main-branch link. The main-branch section at lines 1592–1604 still supplies the required highest-generated lattice, so this repair preserves the mathematical dependency. Rerun the gate after repairing the link and the independently found companion form issues.

## Verified sound

These are verified examples, source checks and interface checks, not a claim that finite testing proves the general theorems. All three requested files were read. The worktree head is the requested `47df47759323796bc5ba9cd3a0de72b07bd03106`; the outside-folder diff is empty and the worktree stayed clean. No computational algorithm, copied source passage, `set_option`, sorry-bodied data declaration or duplicate fully qualified declaration name was found in the three files. The local coordinate recurrences are definitions for mathematical targets, not a computational-algorithm roadmap.

**Build and signature evidence.** `lake env lean` on the original Suggested file succeeds with exactly eight `sorry` warnings and no other warnings. A scratch copy of the companion elaborates with seven intentional admissions. Fresh `#check @name` output for all **36** Suggested declarations agrees with all 36 supplied signature blocks after whitespace normalization. The five flagged helpers—`dividedPower`, `genE`, `genF`, `genK`, `counitGenerator`—operate on free generators/scalars and do not require the omitted lattice/finiteness instances. `D` retains the realization assumptions; each generic headline retains `hq` and `hfac`. No lost-binder repair was needed.

All **15** sorried theorems were tried individually with `simp`, `rfl` and `infer_instance` on scratch copies, requiring each tactic to close the goal. None closed. Reading the relevant pinned declarations found no single existing lemma equal to these quantum statements. No theorem is reported as one-tactic padding. This does not excuse missing headlines or illustrative API material under R02/R05.

**Dependency-check output:**

```text
depcheck: 204 roadmaps, 1643 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. KacMoody is entry 2 and this roadmap entry 283 in the supplied order. The other cited suppliers are already on main. There are no declared gaps and no `*Needs:*` lines to conceal additional mechanically recognized edges; the latter omission is R04. The QEA0 → QEA1 → later quantum module direction agrees with KacMoody's separation of its classical construction from the downstream quantum Part II. QEA3's full-Y extension and QEA8's integral/root-specialized quantum-plane comparison have no competing owner in the supplied readable scope.

**Cross-roadmap citations resolved (six supplier groups).** Main is `929496d4221b974c60787257a3cdc28b600fc49c`. The following sections were opened, not inferred from their names:

| Supplier and file | Lines/section read | Contract and convention verified |
| --- | --- | --- |
| `TauCetiRoadmap/KacMoody/README.md`, supplied open head | 214–293, §§0.1–0.3; 53–57; 1273–1275 | Symmetrizer, independent rational roots/coroots, full dual lattices and central directions. Same row convention `a_ij=α_j(h_i)`. Quantum modules are downstream Part II, not a supplier premise of the classical roadmap. |
| `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md`, main | 273–293, Layer 3; following Layer 4 | General Coxeter strong exchange and Matsumoto; finite longest-element geometry is in Layer 4. Add that precise dependency for QEA2 rather than relying on the broad scope paragraph. |
| `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md`, main | 405–567, Layers 3–4; headings at 567 and 773 | Native classical Verma/simple highest-weight modules and finite-dimensional classification; Layers 5–6 supply semisimplicity and characters. This is classical input, not a quantum integral comparison. |
| `TauCetiRoadmap/ReductiveGroups/README.md`, main | 1535–1604, §9A.2–5; 1759–1805, §10B | Full-Y Kostant form and its native Hopf APIs, integral highest-generated lattice, later Weyl/simple-head distinction. The §9A.5 contract survives replacing the stale SHA link. |
| `TauCetiRoadmap/QuantumGroups/README.md`, main | 593–640, Q8.1 | Complex generic rank-one quotient, PBW and `ΔE=E⊗1+K⊗E`, `ΔF=F⊗K⁻¹+1⊗F`, `S(E)=-K⁻¹E`, `S(F)=-FK`; matches QEA1 and QEA8. Higher-rank/full-Y work is a distinct extension, not a second rank-one owner. |
| `TauCetiRoadmap/SchubertGeometry/README.md`, main | 54–68, S4; 93–98, S7 | Finite LS-chain/section interfaces and divisor coefficient `⟨λ,β∨⟩` for a codimension-one predecessor. QEA8 leaves these geometric constructions at that owner. |

The citation resolver's `McGerty2006 §2: no roadmap McGerty2006` is a false lead: it is a bibliographic key, not a roadmap supplier. Ownership searches used the mandated `roadmaps grep`/`show` service, the board packages and the supplied sibling trees, with object terms for Drinfeld–Jimbo presentations, quantum Frobenius, quantum planes, Cartan realizations and Kostant forms. The quantum search found KacMoody as a supplier/downstream boundary and HabiroNahmSeries as a consumer of QEA6's signed Gaussian convention. Open revisions without supplied files, including the QuantumGroups revision surfaced by the index, were not opened or used as suppliers; ownership against those unavailable open revisions was not checked. Main's QuantumGroups Q8 was checked. No claim is made about unprovided open files.

**Pinned library declarations opened.** Mathlib is `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Paths in this table are relative to the respective library repository.

| Library file and line | Declaration | What its actual body/type provides |
| --- | --- | --- |
| `Mathlib/Algebra/FreeAlgebra.lean:167`, `:306`, `:369` | `FreeAlgebra`, `FreeAlgebra.ι`, `FreeAlgebra.lift` | Free algebra, generator injection and extension equivalence; no quantum relations are supplied. |
| `Mathlib/Algebra/RingQuot.lean:462`, `:516` | `RingQuot.mkAlgHom`, `RingQuot.liftAlgHom` | Quotient map and factorization of a relation-respecting algebra map. The relation proof is an actual argument. |
| `Mathlib/RingTheory/Bialgebra/Basic.lean:180` | `Bialgebra.ofAlgHom` | Coproduct/counit algebra maps plus all three coalgebra laws; matches the associator and unitors in Suggested. |
| `Mathlib/Algebra/Polynomial/Laurent.lean:531` | `LaurentPolynomial.eval₂` | Ring evaluation at a **unit**, preserving negative powers; no characteristic-zero assumption is needed for this operation. |
| `Mathlib/LinearAlgebra/Matrix/ToLin.lean:285` | `Matrix.mulVecLin` | Column-vector linear action, not row-vector multiplication. |
| `Mathlib/RingTheory/Binomial.lean:379`, `:434` | `Ring.choose`, `Ring.choose_neg` | Native integral binomial values and negative-upper identity, suitable for the signed-Lucas RHS. |
| `TauCeti/Algebra/Lie/UniversalEnveloping/Kostant/Form.lean:101`, `:108`, `:124` | `kostantRootGenerators`, `kostantCartanGenerators`, `kostantForm` | Divided powers and binomials generate a subring of `UniversalEnvelopingAlgebra ℚ L` for supplied families. No root-system or PBW assertion is bundled in that definition. |
| `TauCeti/Algebra/Lie/UniversalEnveloping/Kostant/HopfAlgebra.lean:176`, `:303` | `instBialgebraKostantForm`, `instHopfAlgebraKostantForm` | Native integral Hopf structure on that carrier. |
| `TauCeti/Algebra/Lie/UniversalEnveloping/Kostant/Comultiplication.lean:232`, `:252` | `kostantFormComul_dividedPower`, `kostantFormComul_ringChoose` | The classical sum coproducts consumed by QEA7. |
| `TauCeti/Algebra/Lie/UniversalEnveloping/Kostant/BaseChange.lean:68` | `kostantFormBaseChange` | The actual rationalization equivalence, assuming the supplied families generate L as a rational Lie algebra. |
| `TauCeti/Algebra/Lie/UniversalEnveloping/Kostant/Weight/Basis.lean:94`, `:105`, `:183`, `:214` | `jointWeightSpace`, `weightSublattice`, `isInternal_weightSublattice`, `kostantWeightBasis` | Existing classical weight/lattice interfaces, for a rational representation and an additive subgroup stable under the Kostant form and contained in the integral weight-space span; the basis additionally needs finite generation over ℤ. They do not prove the new quantum specialization. |

The searches did not locate a native Drinfeld–Jimbo quotient or symmetric quantum Gaussian under the object spellings searched. This is a bounded search result, not a claim that spelling searches prove absence from every formalization. The QEA quotient uses native algebra carriers; it does not duplicate an identified quantum implementation.

**Source checks.** No README locator is explicitly labelled unverified. The required seeded target is one target, “Integral specialization at1”; its bibliography/theorem/page cannot be certified for the reason in R03. The calculations below test the mathematical assertion independently. Two named papers were obtained through the source service without editing the source manifest:

- McGerty2006 v4: §2, printed pp.3–4, lines 120–172, supports weight-projection modified forms, integral halves and Lemma 2.2's presentation after base change. The README's same-root formula correctly uses `i=j`; see the source typo below. The claim of a general ℓᵢ theorem is attributed to **v1**, which could not be retrieved. V4's coprime assumption is explicit at line 179 and must not be silently used to certify the different version's generality. [Paper](https://arxiv.org/abs/math/0601150v4).
- GrosKaneda2013 v2: §6.7 and Lemma 6.8, printed pp.23–24, lines 1842–1874. The printed statement has integrability and finite-generation hypotheses. Its displayed tensor calculation uses a finite sum of divided-power terms, not a finite basis; the roadmap supplies that computation explicitly. The full-Y toral extension is an additional Vandermonde calculation, checked below, not a claim that the source states it verbatim. [Paper](https://arxiv.org/abs/1302.2437v2).

**Adversarial mathematics record.** The 112 statement rows record actual values, including excluded or wrong-model controls; the following declaration table covers all 36 main-file and 20 companion declarations. Repeated formulas appearing in prose and Lean are cross-referenced rather than silently treated as new theorems. “Pass” means the stated instance agrees. “Excluded” verifies a stated hypothesis; it is not a proof outside that hypothesis. Structural policy findings have no mathematical counterexample and are labelled accordingly.

For generic numerical tests use `q=2`, `d=1`, so `[1]=1`, `[2]=5/2`, `[3]=21/4` and `c=(q-q⁻¹)⁻¹=2/3`. At odd roots, all computations use Laurent polynomials, never division by a specialized zero factorial. `ζ` below has order 3, so `ζ²+ζ+1=0` and `[2]_ζ=-1`.

| Statement / location | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| QEA0 full realization, perfect pairing | A₁: `X=Zω,Y=Zh,α=2ω`; central rank-one with no roots | `⟨α,h⟩=2`; empty root matrix has size 0 while the torus lattice has rank 1 | Pass; preserve central directions |
| QEA0 symmetrizer and matrix direction | B₂ `a12=-2,a21=-1` | With `d=(1,2)`: `1*(-2)=2*(-1)=-2`; with `(1,1)`: `-2≠-1` | Pass; add README Check, R04 |
| QEA0 independent roots/coroots | Affine A₁ matrix `[[2,-2],[-2,2]]` | Rank A is 1; a minimal realization has dimension `4-1=3`; coroot span has dimension 2 | Pass with KM0 supplier; no two-dimensional replacement |
| QEA0 q-integer definition | `q=2,m=0,1,2` | Quotient values `0,1,5/2`; Laurent sums `0,1,2+1/2` | Pass |
| QEA0 q-factorials/divided powers | `r=0,1,2` | Factorials `1,1,5/2`; divided powers `1,x,(2/5)x²` | Pass |
| QEA0 total-function boundary | `q=0`, `q=1`, nonempty I | `hq` fails at 0; `qInt 1 1=0`, hence factorial at 1 is 0 and `hfac` fails; integral Gaussian `[1]_(v=1)=1` | Excluded; do not specialize the rational quotient |
| QEA0 positive characteristic | `k=F₂(t),q=t` and `k=F₃(t)` | `q-q⁻¹=(t²-1)/t≠0`; `[2]=t+t⁻¹≠0` in both; `F₂,q=1` has zero denominator | Generic case passes; finite-field root case excluded |
| QEA1 torus unit/product/inverse | Empty roots, `Y=Z`, exponents 1 and -1 | `K_0=1`, `K_1K_-1=K_0=1`; Laurent monomials `T*T⁻¹=1` | Pass; rank-zero algebra retains the torus |
| QEA1 conjugation | Standard A₁ degree-one module | `K=diag(2,1/2)`, `KEK⁻¹=4E`, `KFK⁻¹=F/4`; pairing exponents give `2²` and `2⁻²` | Pass |
| QEA1 commutator | Same module | `EF-FE=diag(1,-1)=(K-K⁻¹)/(3/2)` | Pass |
| QEA1 Serre relations | A₂ standard three-dimensional module; disconnected pair | `E_i²=0` and `E_iE_jE_i=0`, so all three A₂ terms sum to 0; commuting pair has `E_jE_i-E_iE_j=0` | Pass; nonvacuous length checked below |
| QEA1 Serre lengths | `aij=0,-1,-2,-3`; diagonal `aii=2` | Lengths `1,2,3,4`; diagonal totalization gives `toNat(-1)=0`, but `i≠j` excludes imposing that relation | Pass |
| QEA1 universal property | Counit generator tuple; zero toral tuple | `K_y↦1,E,F↦0` sends every relation to `0=0` or `1=1`; `K_0↦0` would demand `0=1` | Pass; rejects zero map |
| QEA1 rank-one inclusion | `Y=Zh⊕Zc`, central c | Image torus exponents `(m,0)`; `K_c` has exponent `(0,1)` and is outside; pairing at `dh` is `2d` | Pass |
| QEA1 coproduct on E/F/K | A₁, degree 1 | `ΔE=E⊗1+K⊗E`, `ΔF=F⊗K⁻¹+1⊗F`, `ΔK=K⊗K`; mixed commutator is `(K⊗K-K⁻¹⊗K⁻¹)/(3/2)` on both sides | Pass |
| QEA1 coassociativity | Generator E | Both iterates give `E⊗1⊗1+K⊗E⊗1+K⊗K⊗E` | Pass; associator orientation matches Lean |
| QEA1 left counit | E, F, K | `(ε⊗id)Δ` gives `E,F,K`, respectively; inverse left-unitor gives `1⊗E,1⊗F,1⊗K` before identification | Pass |
| QEA1 right counit | E, F, K | `(id⊗ε)Δ` gives `E,F,K`; inverse right-unitor gives `E⊗1,F⊗1,K⊗1` | Pass |
| QEA1 antipode/convolution | E and F | Left: `-K⁻¹E+K⁻¹E=0`, `-FKK⁻¹+F=0`; right: `E-KK⁻¹E=0`, `FK-FK=0`; counit is 0 | Pass |
| QEA1 antipode invertibility | A₁ generators | `S²(E)=q⁻²E=E/4`, `S²(F)=q²F=4F`; both nonzero invertible scalings; on torus `S²K_y=K_y` | Pass |
| QEA1 divided E coproduct | `n=2` | Before dividing: middle coefficient `1+4=5`; after `/[2]`: `5/(5/2)=2=q^(1*1)` | Pass; rejects coefficient 1 or 1/2 |
| QEA1 divided F coproduct | `n=2`, order `F⊗FK⁻¹` | Two cross terms give `(1+4)F⊗FK⁻¹`; division gives coefficient 2 | Pass |
| QEA1 divided antipodes | `n=0,2` | At 0 both 1; at 2, `S(E^(2))=4K⁻²E^(2)` and `S(F^(2))=(1/4)F^(2)K²` | Pass |
| QEA1 normalized e/f | Multiply ΔK⁻¹ΔE and ΔFΔK | `e⊗K⁻¹+1⊗e`; `f⊗1+K⊗f` on both sides | Pass; agrees with supplier boundary |
| QEA1 triangular decomposition | Rank zero `Y=0`; rank zero `Y=Z`; rank-one PBW monomial | Maps `k⊗k⊗k→k`, `k⊗k[Z]⊗k→k[Z]`; `F⊗K²⊗E↦FK²E` with coefficient 1 | Pass instances; not a general independence proof |
| QEA1 torus independence | `Y=Z`, `K_0,K_1` | Laurent coefficients of `a+bT=0` are separately `a=0,b=0`; collapsing `T=1` would give `1-T=0` | Pass; wrong quotient rejected |
| QEA1 root grading | `EF-FE` | Both products have degree `α-α=0`; toral commutator RHS also degree 0 | Pass |
| QEA1 positive braided product/coproduct | E² | `r₊(E²)=E²⊗1+5E⊗E+1⊗E²`; middle factor `1+q²=5` | Pass |
| QEA1 negative braided product/coproduct | F² | `r₋(F²)=F²⊗1+(5/4)F⊗F+1⊗F²`; middle factor `1+q⁻²=5/4` | Pass |
| QEA1 braided antipodes | E² and F² | `S₊E²=4E²`; convolution coefficient `4-5+1=0`. `S₋F²=F²/4`; coefficient `1/4-5/4+1=0` | Pass |
| QEA1 bosonization factor order | F², negative torus before second F | Braided coefficient `5/4` becomes `5` because `K⁻¹F=4FK⁻¹`; agrees with ordinary ΔF² | Pass |
| QEA1 nilpotent pairing | E,F and E²,F² | `p(E,F)=2/3`; both recursion rules give `(1+1/4)*(2/3)²=5/9` | Pass |
| QEA1 pairing nondegeneracy control | Degree-one rank-one; rank-zero nilpotent half | Degree-one Gram entry `2/3≠0`; empty-root half has unit pairing 1 | Pass instances; no claim about full toral nondegeneracy |
| QEA1 skew Borel pairing | `KE` against F | Left value `c=2/3`; relation `KE=4EK` gives `4*c*q⁻²=2/3` | Pass |
| QEA1 double cross rule | a=E,b=F | Left `cK⁻¹+EF`, right `FE+cK`; rearrangement `EF-FE=c(K-K⁻¹)` | Pass; correct sign |
| QEA1 symmetric toral form | B₂, `d=(1,2)` | `b(h1,2h2)=a21*2=-2`; reversed pairing `a12*1=-2` | Pass |
| QEA1 denominators in toral form | Rank-one adjoint lattice `Y=Zy,h=2y,α(y)=1` | `b(y,y)=1/2`, choose `N=2`; `β(y,y)=t`, `β(h,y)=t²=v` | Pass; extension is necessary |
| QEA1 radical and central torus | A₁ plus c with `b(c,-)=0` | `β(c,y)=1`, `[K_c,E]=[K_c,F]=0`; `K_c` remains Laurent variable, not 1 | Pass |
| QEA1 torus-amalgamated double comparison | Rank zero with `Y=Z` and b=0 | Two commuting Laurent tori modulo `K⁺_m=K⁻_m` leave one Laurent algebra; exponent 1 remains nontrivial | Pass |
| QEA2 simple braid formulas | A₁ standard module, q=2 | `T(E)=-2F`, `T(F)=-E/2`, `T(K)=K⁻¹`; new commutator `diag(-1,1)` equals transformed toral RHS | Pass; R02 is omission, not falsity |
| QEA2 off-diagonal braid formulas | A₂ natural module | `T1(E2)=-e13`; `T1(F2)=-e31`; their commutator `diag(1,0,-1)` equals `(K1K2-(K1K2)⁻¹)/(3/2)` | Pass |
| QEA2 braid preservation and inverse | A₂ tensor-square representation | Four commutator-defect matrices have all 81 entries 0; the image torus is invertible, with exponent reflection squaring to identity | Pass relation tests; no inferred universal inverse proof |
| QEA2 length-three braid relation | A₂ tensor square, words 121 and 212 | All six resulting 9×9 matrices equal. E1-image entry `(2,1)` is `-2` on both; F1-image `(1,2)` is `-1/2` on both | Pass |
| QEA2 nonsimply-laced torus action | B₂ i=1,j=2 | `s1(2h2)=2h2+2h1`; `K2*K1^(-a12)=K_(2h2+2h1)`; swapped entry gives only `+h1` | Pass; rejects transposed Cartan entry |
| QEA2 root order and word dependence | A₂ words 121/212 | Root lists `(α1,α1+α2,α2)` / `(α2,α1+α2,α1)`; middle vectors `-E1E2+q⁻¹E2E1` / `-E2E1+q⁻¹E1E2` differ | Pass; no literal equality of bases |
| QEA3 toral binomial definition | `K=v^2`, n=0,1,2 | Values `1,[2]_v,1`; at v=1: `1,2,1`, agreeing with `binom(2,n)` | Pass |
| QEA3 full-lattice basis-direction extension | `K_y=K`, simple direction `2y`, d=2, n=1 | `(K²-K⁻²)/(v²-v⁻²)=(v⁻²-1)C₂(K)+v⁻¹K C₁(K)`; coefficients lie in A | Pass low-degree extension |
| QEA3 change of toral basis | Rank-one `y↦-y` | `C₁(K⁻¹)=-C₁(K)`; two directions generate the same n≤1 algebra | Pass low degree; higher basis-change theorem still substantive |
| QEA3 correct ε basis / wrong ±1 basis | K=1,-1 | Correct basis includes constant values `(1,1)`; wrong family always has values `(a,-a)` | Pass negative control |
| QEA3 integral PBW / divided products | One positive root, a=b=1 | `E*E=[2]E^(2)=(5/2)*(2/5)E²=E²`; over A the coefficient is `v+v⁻¹` | Pass |
| QEA3 integral Hopf/base change | E^(2), v=i; zero coefficient ring | Coproduct coefficients specialize to `1,i,1` without dividing by `[2]_i=0`; zero ring gives zero modules/maps on both sides | Pass; no inverted prime required |
| QEA3 v=1 full-Y Kostant quotient | Empty roots, Y=Z; H=2 on a character | `K=1`, `C₁→H`, `C₂→H(H-1)/2`; eigenvalues `2,1` | Pass; central direction retained |
| QEA3 central isogeny convention | Inclusion of coroot lattice `Zh` into `Z(h/2)` | Pairings with α are `2` and `1`; lattices have index 2 though rational spans agree | Pass; rational identification insufficient |
| QEA4 integral highest-weight lattice | A₁ highest weight 2ω | Divided basis `b0,b1,b2`; `F b0=b1`, `F b1=[2]b2`; rank is 3, not 2 | Pass |
| QEA4 sampled Φ and inverse | Same highest weight at v=1 | Quantum and classical divided-basis action coefficients are both `(1,2)` for F and `(2,1)` for E; Φ and inverse matrices both I₃ | Pass instance; bibliographic certification unavailable, R03 |
| QEA4 sampled highest-vector normalization | λ=0; empty-root central character m | Maps `1↦1`; central weight m has `K_y↦1` but `C_y(r)` eigenvalue `binom(m,r)` on both sides | Pass; torus collapse does not erase label |
| QEA4 sampled toral/weight-piece restriction | λ=2ω, weights 2,0,-2; r=2 | Binomial eigenvalues `(1,0,3)` on both divided lattices | Pass |
| QEA4 arbitrary-ring base change | B=F₂ and B=Z/4 | Φ stays I₃; F coefficients become `(1,0)` in F₂, `(1,2)` in Z/4 on both sides. The monomial comparison instead becomes `diag(1,0,1)` / `diag(1,2,1)` | Pass; no simple-head substitution |
| QEA5 odd Frobenius on root powers | ℓ=3, m=0,1,3,6 | Images `1,0,X,X^(2)`; `E^(3)E^(3)` coefficient `[6 choose3]_ζ=2`, matching `X*X=2X^(2)` | Pass coprime branch |
| QEA5 odd toral formula | Classical weight ν=2, source weight 6; m=1,3,6 | Eigenvalues `[6 choose m]_ζ=0,2,1`; prescribed target `0,binom(2,1),binom(2,2)` | Pass |
| QEA5 odd Hopf compatibility | E^(3), ℓ=3 | Only coproduct terms `(3,0),(0,3)` survive; both give `X⊗1+1⊗X` | Pass |
| QEA5 excluded odd order | G₂, d=(1,3), ℓ=3 | Lengths `(3,1)`; uniform coprimality test false; even-branch parity false | Missing branch; R01 |
| QEA5 star datum | B₂, ℓ=4,d=(1,2) | `ℓ_i=(4,2)`, `A*=[[2,-1],[-2,2]]`, `d*=(16,8)`; off-diagonal products `-16=-16` | Pass |
| QEA5 star parameter and order controls | A₁,d=1,ℓ=2,ζ=i; d=2 same ℓ | First `ℓ_i=2,ζ^(1*4)=1`; second `ℓ_i=1,ζ²=-1` | Pass; type name alone insufficient |
| QEA5 modified idempotents and shifts | A₁, weight μ, E | `E1_μ` has target μ+α, so `1_(μ+α)E1_μ=E1_μ`; `1_μ1_ν=0` when μ≠ν | Pass |
| QEA5 modified same-root relation | a=b=1, λ(h)=-2 or 0 | On input weight λ+α, commutator coefficients `[λ(h)+2]` are respectively `0` and `[2]`; agrees with `[E,F]` on weights 0 and 2 | Pass; source indices corrected |
| QEA5 modified different-root relation | a=1,b=0 | Both sides equal `E_i1_λ=1_(λ+α_i)E_i`; shift is +α_i | Pass |
| QEA5 integral halves versus generic presentation | A₁×A₁, ζ=i | `[2]_i!=0`; genuine commutator of second divided powers is 0; free-word control `xy-yx` has coefficients +1,-1 and is nonzero | Pass obstruction; does not certify the proposed full free-algebra module without all actions |
| QEA5 finite local units | One homogeneous arrow λ→μ | `(1_λ+1_μ)` acts as identity at both ends; `1_λ` alone gives zero on the μ end if λ≠μ | Pass |
| QEA5 modified Frobenius formula | A₁,ℓ=2; λ=0 versus ω | `1_0↦1_0`, `1_ω↦0`; `E1_0↦0`, `E^(2)1_0↦e1_0` | Pass displayed controls; v1 source unverified |
| QEA5 full-Y multiplier restriction | A₁,ℓ=2,λ=2ω,y=h | Source `i²=-1`; target restricted y gives same pairing 2 and scalar -1. First full-v Gaussian eigenvalue is `[2]_i=0` on both | Pass; replacing λ by λ/ℓ gives i and is wrong |
| QEA5 even ordinary-map obstruction | Adjacent A₂,ζ^ℓ=-1 | Conjugation scalar `ζ^(-ℓ)=-1`; proposed classical `K_i↦1` gives +1 | Pass negative control |
| QEA6 Frobenius pullback/simple head | A₁,ℓ=3,λ=ω | Pullback dimension 2, weights ±3ω, E=F=0; Weyl module at 3ω has dimension 4 | Pass; these objects cannot be identified |
| QEA6 signed quantum Lucas | `(m,r)=(6,3),(-3,3),(3,1),(0,0)` at order 3 | LHS values `2,-1,0,1`; RHS values `binom(2,1),binom(-1,1),0,1` | Pass; R02 missing general signature |
| QEA6 highest-vector countercontrol | λ=ω, `Fv_λ` | `EFv_λ=[1]v_λ=v_λ≠0` | Pass; nonzero integral label does not imply highest |
| QEA6 Steinberg tensor product | A₁,ℓ=3,λ0=ω,λ1=ω | RHS dimension `2*2=4`, weights `4,2,-2,-4`; highest label `1+3=4` | Pass simply-connected instance |
| QEA7 weight data rejects relabelled counit | Counit proposed label 3ω | Actual C_h(3) acts by 0; proposed label requires `[3 choose3]_ζ=1` | Pass wrong-model rejection |
| QEA7 contraction selected weights/operators | Fr*L(ω), ℓ=3 | Weights ±3ω become ±ω; F^(3) carries highest to lowest with coefficient 1, matching classical F | Pass |
| QEA7 toral contraction | Weight 3ν, ν(h)=-1 | C_h(3) gives `[-3 choose3]_ζ=-1=binom(-1,1)` | Pass |
| QEA7 functoriality | Identity and zero morphism on selected sum | Restrictions are respectively I and 0; both commute with E^(3),F^(3) | Pass |
| QEA7 pullback then contraction | Classical one-dimensional weight-zero module | Underlying rank `1→1→1`; all positive root operators and positive binomials remain 0 | Pass |
| QEA7 left tensor comparison | Both factors pulled back from L(ω), ℓ=3,m=1 | Surviving coefficients `ζ^0=1` at `(a,b)=(3,0),(0,3)`; both sides act by `E⊗1+1⊗E` | Pass |
| QEA7 right tensor comparison | Same, reverse tensor order | Torus factor on pulled-back factor is 1; again `1⊗E+E⊗1` | Pass |
| QEA7 full toral tensor compatibility | Weights a=2,b=-1, m=2 | `binom(1,2)=0`; sum `1 + (2*-1) + 1 =0` | Pass signed Vandermonde |
| QEA7 nonmonoidality control | Lζ(ω)⊗Lζ(ω), ℓ=3 | Each contraction has dimension 0; tensor has two weight-zero vectors, so contracted dimension 2 | Pass; rejects monoidal claim |
| QEA7 finite dual comparison | ℓ=3,m=1, selected weights | Sign `(-1)^3=-1`, phase `ζ^6=1`, torus power 1; classical antipode coefficient -1 | Pass |
| QEA7 unprojected nilpotent actions | A₁, exponents 3 and 3 | Product coefficient `[6 choose3]_ζ=2`, matching `X*X=2X^(2)` | Pass rank-one test; higher Serre relations remain substantive |
| QEA8 quantum plane relation/action | x,y,xy,yx | E gives `v x²,x²`, hence relation 0; F gives `v y²,y²`, hence relation 0 | Pass |
| QEA8 wrong coproduct control | Opposite E rule on xy-vyx, q=2 | Output `(1-4)x²=-3x²≠0`; actual rule gives 0 | Pass |
| QEA8 action coefficients / grading | y², degree n=2 | E(y²)=(5/2)yx; both source and target degree 2; degree-two rank is 3 | Pass |
| QEA8 generic simple and classical limit | n=0,1,2 | Dimensions `1,2,3`; E/F string coefficients nonzero at q=2; at v=1 E(y²)=2yx=x∂_y(y²) | Pass instances |
| QEA8.1 ordered multiplication | `(yx)(yx)` | `y(xy)x=v y²x²`; formula exponent `k*a=1` gives same v | Pass |
| QEA8.1 monomial divided E/F | n=2,j=1,r=1; j=0,r=3 | E w1=w0, F w1=w2; out-of-range action is 0 rather than using truncated indices | Pass |
| QEA8.1 Weyl divided E/F | n=2,j=1,r=1 | E b1=[2]b0=(5/2)b0; F b1=[2]b2=(5/2)b2 | Pass |
| QEA8.1 toral signed shifts | n=2,j=2,t=1,c=0,r=2 at v=1 | `binom(-2,2)=3`; unsigned replacement would give 0 | Pass |
| QEA8.1 comparison / all divided powers | n=2,j=1,r=1 | C E b1=(5/2)w0=E C b1; C F b1=(5/2)w2=F C b1 | Pass; 168 Laurent coefficient identities checked |
| QEA8.1 injectivity / generic inverse | n=2 | C diagonal `1,v+v⁻¹,1`; determinant `v+v⁻¹≠0`; inverse middle entry `1/(v+v⁻¹)` exists in Q(v) | Pass; inverse is not integral |
| QEA8.1 cokernel / nonisomorphism | n=2; v=1 | Cokernel `A/(v+v⁻¹)` in middle coordinate; at 1 it is Z/2 | Pass |
| QEA8.1 n=0,1 controls | C₀,C₁ | Matrices `(1)` and I₂; determinant 1 in both | Pass; these boundary results belong in README |
| QEA8.1 base-change kernel/image | n=2,v=1,B=F₂ | Diagonal `(1,0,1)`; kernel span b1 has dimension 1, image endpoint span has dimension 2 | Pass; injectivity does not base change |
| QEA8.1 Hopf dual T and inverse | n=2,q=2 | Anti-diagonal coefficients `(1,-1,4)`, inverse coefficients `(1,-1,1/4)` in reversed positions; product I₃ | Pass |
| QEA8.1 dual E/F intertwining | n=2,q=2,j=1 for E, j=0 for F | Both E sides are φ₂; both F sides are `-(5/2)φ₁` | Pass; 168 divided-power dual coefficient identities checked |
| QEA8.1 dual torus | n=2,j=0 | T sends w0 to φ2; K acts on both by q²=4 | Pass |
| QEA8.2 first-root diagonal/kernel/image | ℓ=3 and 5 | Diagonals `(1,0,0,1)` and `(1,0,0,0,0,1)`; kernel dimensions 2 and 4, image dimensions both 2 | Pass |
| QEA8.2 W as pullback | ℓ=3 | E,F kill w0,w3; F^(3)w0=w3, E^(3)w3=w0; C_h(3) eigenvalues 1,-1 | Pass |
| QEA8.2 restricted simple | ℓ=3, highest weight ℓ-2=1 | Two-dimensional string E a1=a0,F a0=a1; nonzero coefficients 1,1 | Pass |
| QEA8.2 kernel identification | ℓ=3,k=0,1 | a0↦b1,a1↦-b2; F b1=-b2 and E(-b2)=b1 | Pass |
| QEA8.2 quotient identification | ℓ=3,k=0,1 | a0↦w1+W,a1↦-w2+W; F w1=-w2, E(-w2)=w1 | Pass |
| QEA8.2 first exact sequence/nonsplitting | ℓ=3 | Ranks `2→4→2`; F b0=b1≠0, but F kills pullback highest vector | Pass |
| QEA8.2 second exact sequence/nonsplitting | ℓ=3 | Ranks `2→4→2`; E w1=w0≠0, but E kills quotient highest vector | Pass |
| QEA8.2 comparison by Hopf dual | ℓ=3, T coefficients | `(1,-ζ⁻¹,1,-1)`; each is a unit, so both short exact sequences dualize with dimension pattern 2,4,2 | Pass normalization |
| QEA8 geometry boundary | Rank-one divisor, λ=2ω; λ=0 | Coroot coefficient `⟨2ω,h⟩=2`; at zero weight coefficient 0 and empty divisor | Pass at named supplier; no quantum flag carrier asserted |

**Declaration-by-declaration coverage.** The following table makes the mapping to every Lean declaration explicit. It adds the few native encoding boundaries not already displayed above. `S` means `Suggested.lean`; `C` means `QuantumPlaneLatticeTargets.lean`. This is coverage accounting, not a second assertion that the same calculation proves a theorem.

| Declaration | Test / computed values | Result / change |
| --- | --- | --- |
| S `CartanDatum` | A₁ pairing 2; B₂ symmetry -2=-2; wrong d gives -2≠-1 | Matches supplier; R04 Checks |
| S `CartanDatum.pairingValue` | `pairingValue i (2h)=4`, direct pairing 4 | Pass |
| S `CartanDatum.simpleTorus` | d=2 gives 2h, pairing with α gives 4 | Pass |
| S `Generator` | With no roots and Y=Z, E/F constructor inputs are empty; K0 and K1 are two distinct symbols | Pass |
| S `qInt` | q=2: m0→0,m1→1,m2→5/2; q=1,m1→0 | Matches rational, not specialized, definition |
| S `qFactorial` | r0→1,r1→1,r2→5/2 | Pass |
| S `dividedPower` | r0→1,r2→(2/5)x² | Pass; omitted lattice binders harmless |
| S `genE` | Under free lift E↦2, evaluation is 2 | Pass |
| S `genF` | Under free lift F↦3, evaluation is 3 | Pass |
| S `genK` | Under free lift K0↦0, evaluation is 0 before quotient | Pass; no premature torus relation |
| S `simpleK` | d=2 produces symbol K_(2h), not K_h | Pass |
| S `serreLength` | a=-3→4; a=2→0, latter excluded by i≠j | Pass |
| S `serreE` | aij=0 gives EjEi-EiEj; aij=-1 gives Ei²Ej/[2]-EiEjEi+EjEi²/[2] | Same zero relations as README |
| S `serreF` | aij=0 gives FjFi-FiFj; aij=-1 gives Fi²Fj/[2]-FiFjFi+FjFi²/[2] | Same zero relations as README |
| S `Relation` | Counit tuple yields 1=1 for torus and 0=0 elsewhere; zero torus yields 0≠1 | Pass |
| S `U` | Empty roots,Y=0 gives k; empty roots,Y=Z gives k[Z] | Pass instances |
| S `generator` | K0 becomes 1 in quotient, unlike free genK0 | Pass |
| S `E` | On degree-one module sends y↦x, x↦0 | Pass |
| S `F` | Sends x↦y, y↦0 | Pass |
| S `Ktorus` | h acts diag(2,1/2); 0 acts I₂ | Pass |
| S `Ki` | d=1 gives diag(2,1/2) | Pass |
| S `KiInv` | Gives diag(1/2,2); product with Ki is I₂ | Pass |
| S `lift` | Counit lift sends K0 to 1,E to 0; defining relation images agree | Pass |
| S `comulGenerator` | E↦E⊗1+K⊗E; counit on left gives E | Pass |
| S `comul_relations` | A₁ tensor commutator equals `(K⊗K-K⁻¹⊗K⁻¹)/(3/2)` | Pass instance; not one-tactic padding |
| S `comulAlgHom` | Unit ↦1⊗1 and K_h↦K_h⊗K_h | Pass; explicit hq/hfac retained |
| S `counitGenerator` | E/F→0,K→1, independently of lattice structure | Pass; dropped binders harmless |
| S `counit_relations` | Serre terms evaluate to 0, torus relation to 1=1 | Pass; one-tactic probes did not close |
| S `counitAlgHom` | Unit→1,E→0 | Pass |
| S `comul_coassoc` | E gives the same three tensor terms in both orders | Pass instance |
| S `counit_comul_left` | E↦1⊗E on both sides | Pass |
| S `counit_comul_right` | F↦F⊗1 on both sides | Pass |
| S `bialgebra` | Native constructor uses the three preceding equalities; unit maps 1⊗1 and 1 | Pass type/interface |
| S `exists_antipode` | E convolutions 0=εE; S²E=E/4; K_h↦K_-h | Pass instance |
| S `triangular_bijective` | Rank-zero k[Y] multiplication identifies 1⊗K_y⊗1 with K_y | Pass instance; tensor order is -/0/+ |
| S `Ktorus_linearIndependent` | In k[Z], coefficients of 1 and T separately vanish | Pass instance |
| C `A` | Laurent coefficients include T^-1; T*T^-1=1 | Pass native carrier |
| C `gaussian` | g(0,0)=1,g(0,1)=0,g(2,1)=v+v^-1,g(2,3)=0 | Pass recurrence/junk-index control |
| C `comparison` | n2 diagonal (1,v+v^-1,1) | Pass column convention |
| C `monomialE` | n2,r1,entry(0,1)=1; r3 all entries 0 | Pass |
| C `monomialF` | n2,r1,entry(1,0)=[2]; r3 all entries 0 | Pass |
| C `weylE` | n2,r1,entry(0,1)=[2]; invalid j<r gives 0 | Pass |
| C `weylF` | n2,r1,entry(1,0)=1,entry(2,1)=[2] | Pass |
| C `torus` | n2,sign1 diagonal (v²,1,v^-2); sign0 gives I₃ | Pass |
| C `comparison_intertwines` | n2,r1,j1 E and F both have coefficient [2] on both sides | Pass; 168 coefficient checks |
| C `comparison_injective` | n2 determinant v+v^-1≠0; after F₂ specialization determinant 0 | Pass over A; specialization not asserted |
| C `hopfDualComparison` | n2 anti-diagonal (1,-1,v²); n0=(1) | Pass |
| C `dualE` | n2,q2: φ0↦-(5/8)φ1, φ1↦-φ2 | Pass antipode transpose |
| C `dualF` | n2,q2: φ1↦-4φ0, φ2↦-(5/2)φ1 | Pass antipode transpose |
| C `hopfDualComparison_bijective` | n2 determinant v², a unit; inverse anti-diagonal has inverse unit coefficients | Pass |
| C `hopfDualComparison_intertwines` | n2,j1 E gives φ2 on both sides; j0 F gives -(5/2)φ1 | Pass |
| C `specialize` | At z=1,T^-1↦1; z=2,T^-1↦1/2; z=0 is not a unit | Pass domain restriction |
| C `specializedComparison` | n3,primitive cube root gives diag(1,0,0,1) | Pass |
| C `gaussian_at_one` | n3,j0..3 gives 1,3,3,1; j4 gives 0 | Pass, no one-tactic closure |
| C `gaussian_first_root` | ℓ3 gives 1,0,0,1; ℓ5 gives 1,0,0,0,0,1 | Pass special case; full Lucas still missing |
| C `specializedComparison_ker_range` | ℓ3: ker span e1,e2; image span e0,e3. Conversely interior vectors map 0, endpoints are attained | Both directions tested |

The machine computations comprised **168** exact Laurent coefficient identities for C, **168** for all divided-power Hopf-dual identities, binomial specialization checks through degree 6 including out-of-range lower indices, and exact cyclotomic reductions at orders 3 and 5. The A₂ tensor-square probe checked four mixed commutators and six braid-word matrix equalities. These calculations include dimensions 0/1/2, zero actions, nonzero central lattices, signed upper indices, root-order 3, characteristic 2 specialization, and nonreduced coefficients `Z/4`. Conditions concerning topology, properness, inseparability and infinite-dimensional analytic duals do not occur in the Lean statements; the README explicitly restricts its full-dual comparison to finite dimension.

## Not verifiable

- **Seeded sample:** the source, theorem number and printed page for QEA4 “Integral specialization at1” cannot be identified from the README. Looked at QEA4, both reference entries, the PR's page-91 mention and legal web search results. No guessed course has been substituted. The classical supplier and the explicit rank-one integral/base-change computations were checked; these do not certify the general integral theorem.
- **McGerty2006 v1 §2:** the source service twice failed to retrieve the version-specific arXiv text (timeout/HTTP 500). V4 was read and its printed page 4 rendered; it has a different coprime-order formulation. The precise v1 small-order theorem, numbering and hypotheses therefore remain unverified. This is recorded under the same work key, not a second source identity.
- **Lusztig1993 §§23.2 and 31.1.3:** the service found no legal readable copy. McGerty's attribution and stated presentation were checked, but the book was not independently read. It is listed in the missing-reference record. No paywall was bypassed.
- The absence of locators in QEA0–4/QEA6/QEA8 prevents source certification of their general statements. The tables record tested values, not invented source support. No source manifest was edited, and this review is completed rather than parked for a text.
- Ownership against open revisions whose files the brief does not provide was not checked. Main and the supplied relevant open head were used for supplier decisions.

## Source issues

- **Misprint** in McGerty2006 at Lemma 2.2, printed p.4 (arXiv v4; lines 165–166): the source uses a j-indexed opposite generator on the left of two same-root identities; it should use i in both places; affects nothing. The roadmap already states the same-root formula with i=j; the discrepancy was confirmed on the rendered page.
