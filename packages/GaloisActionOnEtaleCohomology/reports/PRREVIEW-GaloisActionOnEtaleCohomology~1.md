# Review of GaloisActionOnEtaleCohomology (pull request #2271 at 14c3a34)

**Verdict:** needs changes

## R01 (P2) — Retain characteristic-p coefficients for proper analytifications

**Location:** `TauCetiRoadmap/GaloisActionOnEtaleCohomology/README.md:536`, “for a proper `K`-scheme `Y` and `ℓ` invertible in `K`”; the exclusion is repeated at line 542.
**Claim:** Case (c) unnecessarily excludes `ℓ = char K`. Its proper comparison, constructible finiteness and analytic dimension bound cover this case with `j = 0`. The general-library contract requires retaining that generality.
**Witness:** milneLEC lines 4783–4786, Theorem 19.1(a), allows characteristic-p torsion. For `K = 𝔽₂((t))`, `Y = ℙ¹_K`, `ℓ = 2`, Artin–Schreier gives `H⁰(Y_C, 𝔽₂) = 𝔽₂`, `H^{q>0} = 0`; §4.2 transports these finite groups.
**Repair:** Replace the opening of (c) by “`X = Y^an` for a proper `K`-scheme `Y`, with any prime `ℓ` and `j = 0` when `ℓ = char K`.” Use ClassicalAdicEtaleCohomology §8.4 for the all-torsion bound; retain the alternative §F.3.0 route only when `ℓ ≠ char K`. Replace line 542 by “When `ℓ = char K`, case (c) applies with `j = 0`; cases (a), (b) and (d) do not.” Qualify the projective-space formula at line 541 by `ℓ ≠ char K`, and add the characteristic-two Check above: its integral groups are `H⁰ = ℤ₂`, `H^{q>0} = 0`, and its rational groups are `H⁰ = ℚ₂`, `H^{q>0} = 0`.

## R02 (P3) — Attach Milne’s completeness hypothesis to the variety

**Location:** `TauCetiRoadmap/GaloisActionOnEtaleCohomology/README.md:513`, “on a variety over a separably closed field that is complete or has `ℓ ≠ char k`”.
**Claim:** This describes completeness as a condition on the field. The cited theorem requires completeness of the variety when `ℓ = char k`.
**Witness:** milneLEC lines 4860–4862, Theorem 19.2, page 125: the hypotheses are separably closed `k` and either complete `X` or `ℓ ≠ char k`.
**Repair:** Replace the quoted phrase by “on a variety `X` over a separably closed field `k`, assuming `X` is complete or `ℓ ≠ char k`”. Thus `X = ℙ¹` qualifies in characteristic `ℓ`, while `X = 𝔸¹` does not acquire this hypothesis from completeness of its ground field.

## Verified sound

In the table, “comparison” is the claimed second side or the deliberately wrong model. Headline rows include the README end theorems; all 15 seeded targets occur explicitly.

| Statement | Instances tried | Computed first side | Computed comparison | Result / change |
| --- | --- | --- | --- | --- |
| Conventions: spectral norm | `K = ℚ₃`, `a² = 3` | `‖a‖ = 3^(−1/2)` | Multiplicativity gives `‖a‖² = 1/3`; coefficient maximum would give `1` | Distinguishes spectral norm |
| Conventions: inverse image | Structure sheaf at a geometric point | Inverse-image stalk `K^sep` | Completed structure-sheaf stalk `C` | Distinct carriers retained |
| Conventions: derived tensor | `Λ = ℤ/4`, both factors `ℤ/2` | `Tor_n = ℤ/2` for every `n ≥ 0` | Derived tensor has nonzero `H^(−n)` for every `n` | Unbounded ambient category necessary |
| Conventions: coefficients and zero | Zero ring, zero sheaf, empty space | All module cohomology groups `0` | All action and cup-product maps `0 → 0` | No nonzero coefficient assumption smuggled in |
| Conventions: indexing | Sheaf concentrated in degree zero, shift `[1]` | `H^(−1)(M[1]) = M` | `H⁰(M) = M` | Shift direction agrees |
| §0.1: completion | `K = ℚ₃` | Completion of spectral `AlgebraicClosure ℚ₃` | `PadicComplex 3` uses the same norm and completion | Native carriers agree |
| §0.1: density in equal characteristic | `K = 𝔽₂((t))`, root `a_N` of `X²+t^N X−t` | `‖a_N−t^(1/2)‖ = ‖t‖^(N/2+1/4)` | Limit `0`; derivative `t^N ≠ 0` | Separable approximants reach inseparable elements |
| §0.1: algebraic closedness | `K = 𝔽₂((t))`, polynomial `X²−t` | Root `t^(1/2) ∈ C` | Characteristic-zero-only pinned theorem is inapplicable | General-characteristic supplier is needed and named |
| §0.2 / Lean headline: extension and injectivity | Algebraically closed complete `K` | `G_K = {1}`, extension `id_C` | `Aut_cont(C/K) = {id}` | Singleton bijection |
| §0.2 / Lean headline: noncommutative composition | S₃ extension, `r(a)=ζa`, `s(a)=a`, `s(ζ)=ζ⁻¹` | `e(sr)(a)=ζ⁻¹a` | `e(s)(e(r)(a))=ζ⁻¹a`; reversed order gives `ζa` | Composition orientation fixed |
| §0.2 / Lean headline: uniqueness and surjectivity | Continuous K-automorphism, finite conjugate set of algebraic `a` | Image permutes that finite root set | Restriction preserves `K̄`; dense restrictions determine one extension | Excludes extra continuous automorphisms |
| §0.2 / Lean headline: joint continuity | `a` algebraic, `x` within `ε` of `a`, `σ(a)=a` | `‖σ(x)−x‖ ≤ ‖x−a‖ < ε` | Open subgroup fixing `K(a)` supplies the same bound | Joint continuity, not merely separate continuity |
| §0.3: geometric-point anti-action | Same S₃ generators | `Spa(sr)=Spa(r)∘Spa(s)` | Opposite order `Spa(s)∘Spa(r)` differs on `a` | Contravariance retained |
| §0.3: neighbourhood orientation | `K=ℚ₃`, coefficient `μ₄` | Colimit stalk has `4` roots | Ground-field sections have `2` roots | Opposite neighbourhood category matters |
| §0.3: purely inseparable stage | Extension of degree `2` in characteristic `2` | One geometric embedding | Two embeddings predicted by a separable-degree shortcut | Excludes that shortcut |
| §1.1 headline: cover pullback | S₃ regular cover, `s=(12)`, `r=(123)` | Composite pullback sends `δ₁` to `δ_(13)` | Reversed order sends it to `δ_(23)` | Anti-action on cover automorphisms |
| §1.1: coefficient linearity | Matrices `E₁₂,E₂₁` on `e₁` | `E₁₂E₂₁e₁=e₁` | `E₂₁E₁₂e₁=0` | Noncommutative coefficient order cannot be swapped |
| §1.1: identity and connecting maps | Identity cover map; coefficient sequence `0→ℤ→ℤ→ℤ/2→0` | Identity sends each Bockstein class to itself | Applying Bockstein after identity gives the same class | Naturality and identity directions agree |
| §1.1: cup and tensor | Point, commutative `Λ`, sections `u,v` | Pullback of product `uv` | Product of pullbacks `uv` | Cup statement retains commutativity |
| §1.2 headline: rigid action | Point, `K=ℚ₃`, `μ₄`, arithmetic Frobenius | `i ↦ i³ = −i` | Cyclotomic stalk action also gives `−i` | Positive Galois convention |
| §1.2: finite non-Galois fibre | Cubic subfield of an S₃ extension | Permutation character `(3,1,0)` on identity, transposition, three-cycle | Regular character would be `(6,0,0)` | Uses embeddings, not the Galois group as basis |
| §1.2: pro-étale compatibility | Point with constant `ℤ/7` | Étale `H⁰=ℤ/7`, higher `0` | Pulled-back pro-étale groups `ℤ/7`, higher `0` | Supplied unit comparison has correct specialization |
| §1.3(a–b): geometric and coefficient functoriality | Rational point on `ℙ¹`, constant coefficients | Pullback on `H⁰` is identity; on `H²` is zero | Both commute with the scalar Frobenius actions | Both squares have equal maps |
| §1.3(c–d): triangles and cup | Identity triangle map; point cup with `1` | Connecting class unchanged; `1·v=v` | Action followed by connection/unit cup gives the same values | No sign introduced |
| §1.3(e): restriction | Finite Galois `L/K`, element fixing `L` | Its permutation on `L`-embeddings is identity | Restricted representation fixes their characteristic functions | Open-subgroup restriction agrees |
| §1.3(f): change of closure | Relabelling by `τ` | Transport conjugates `ρ(σ)` to `ρ(τστ⁻¹)` | Geometric transport uses `Spa(τ⁻¹)` | Inverse in geometric transport required |
| §1.3: purely inseparable extension | `L/K` purely inseparable of degree `2` | Restriction `G_L ≅ G_K` | Cohomological action unchanged | No separability restriction added |
| §1.4 headline: scheme action | `Spec 𝔽₂`, roots `μ₇` | Arithmetic Frobenius sends `ζ` to `ζ²` | Opposite convention sends `ζ` to `ζ⁴` | Distinguishes action from inverse |
| §1.4: nonreduced geometric fibre | Purely inseparable degree-two point | `H⁰=Λ`, `H^{i>0}=0` | Reduction is one geometric point with the same groups | Nilpotents do not add embeddings |
| §2.1: rigid finite-level descent | Class defined over finite separable `L/K` | Stabilizer contains open `G_L` | Orbit has at most `[L:K]` elements | Discrete action |
| §2.1: non-qc negative control | Disjoint points carrying primitive `ℓ^m` roots | Tuple stabilizer `ker χ_ℓ` | Every individual coordinate has an open stabilizer | Infinite intersection need not be open |
| §2.2 headline: scheme discreteness | Non-Galois cubic, finite splitting stages | `H⁰` ranks `1`, then `2`, then `3` | Geometric fibre has exactly `3` points | Colimit reaches geometric cohomology |
| §2.2: empty scheme | Empty qcqs scheme | Every finite-level group `0` | Geometric group `0`, stabilizer entire `G_k` | Degenerate case nonvacuous |
| §2.3 headline: rigid dictionary | Point with `μ₄`, `K=ℚ₃` | Geometric cohomology `μ₄`, Frobenius `i↦−i` | Higher-direct-image stalk `μ₄`, same action | Equivariant comparison |
| §2.3: qcqs boundary | `K=ℚ₂`, cyclotomic degrees for `3,9,27` | Degrees `2,6,18` | No single finite stage contains the entire compatible tuple | Stalk/product interchange fails outside hypothesis |
| §2.3: trace | `ℙ¹`, `ℓ=7`, residue size `2` | `H²(ℙ¹,μ₇)` Frobenius scalar `4·2=1` | Trace target `ℤ/7` has scalar `1` | Imported trace matches normalization |
| §2.4 headline: scheme dictionary | `ℂ/ℝ`, `μ₄`, two geometric components | Conjugation sends `(i,1)` to `(1,−i)` | Permutation-only action gives `(1,i)` | Coefficient action cannot be omitted |
| §2.4: composition | Structure map of a geometric point | `R⁰f_*Λ` stalk `Λ`; higher stalks `0` | Composite derived global sections give `Λ[0]` | Degree and composition agree |
| §2.5 headline: Hochschild–Serre | Point over `K`, discrete module `A` | `E₂^(p,0)=H^p(G_K,A)`, other rows `0` | Abutment `H^p(Spa(K),A)` | Collapse has the asserted coefficient action |
| §2.5: twist orientation | `K=ℚ₂`, `A=μ₅` | Local `H²(G_K,μ₅)=ℤ/5` | Inverse-twist coefficient has `H²=0` | Wrong inverse action fails |
| §2.5: trivial group | Algebraically closed complete ground field | `E₂^(0,q)=H^q(X,ℱ)`, columns `p>0` zero | Abutment `H^q(X,ℱ)` | No spurious group cohomology |
| §2.6 headline: scheme adic action | Residue size `2`, `ℓ=7` | Arithmetic Frobenius on twist: `2` | Geometric Frobenius: `4`; product `1 mod 7` | Scheme bridge agrees |
| §2.6: top cohomology | `ℙ¹`, residue size `2`, `ℓ=7` | Untwisted `H²` arithmetic scalar `4` | Scheme Frobenius pullback scalar `2` | Scheme map is compared with geometric Frobenius |
| §3.1 headline: integral groups | Geometric point, `j=0` | `lim ℤ/ℓ^n = ℤ_ℓ` | Derived limit `H⁰=ℤ_ℓ`, higher `0` | Naive and continuous forms agree here |
| §3.1: Milnor correction | Tower `ℤ` with multiplication by `ℓ` | `lim=0`, `lim¹=ℤ_ℓ/ℤ` | Derived limit has that nonzero degree-one term | Naive limit cannot replace derived limit generally |
| §3.1: topology | Infinite disjoint union of points | `H⁰=∏ℤ_ℓ`, zero-neighbourhood `ℓ∏ℤ_ℓ` | Product topology does not make this subgroup open | Inverse-limit topology is specified independently |
| §3.1: derived reduction | Point | `ℤ_ℓ ⊗ᴸ ℤ/ℓ^n = ℤ/ℓ^n[0]` | Finite-level `RΓ=ℤ/ℓ^n[0]` | Correct reduction direction |
| §3.2 headline: continuity | `ℤ_ℓ(1)` and finite coefficient levels | Scalar `χ_ℓ(σ) mod ℓ^n` at every level | Limit scalar `χ_ℓ(σ)` | Joint action is continuous |
| §3.2: operator continuity is insufficient | Units act on discrete `ℚ_ℓ` | Each fixed unit is a homeomorphism | Stabilizer of `1` is `{1}`, not open | Joint continuity condition discriminates |
| §3.2: torsion allowed | `ℤ/2` with trivial action | Continuous representation of rank `0`, nonzero module | A finite-projective carrier excludes it | General pinned carrier required |
| §3.3 headline: rationalization | `A=ℤ_ℓ/ℓ`; `A=ℤ_ℓ(1)` | Rationalizations `0`; `ℚ_ℓ(1)` | Torsion dies; cyclotomic scalar remains `χ_ℓ` | Both cases agree |
| §3.3: rationalization versus product | `A=∏ℤ_ℓ` | Vectors have a common denominator | `(ℓ^(−m))_m` belongs to `∏ℚ_ℓ`, not `A[1/ℓ]` | Algebraic tensor carrier discriminates |
| §3.3: openness | Same `A`, product topology | Every basic lattice contains some `ℓ⁻¹e_m` | `ℓ⁻¹e_m ∉ j_A(A)` | Image of `A` is not open |
| §3.3: separation | Indiscrete `A=ℚ_ℓ` | Only basic neighbourhood is all `V` | Resulting rationalization remains indiscrete | No unjustified Hausdorff assertion |
| §3.3: universal property | `A=ℤ_ℓ`, map multiplication by `a` into `ℚ_ℓ` | Extension sends `ℓ⁻ⁿb` to `ℓ⁻ⁿab` | Multiplication by `a` on `ℚ_ℓ` has identical values | Unique continuous linear extension |
| §3.3: compact-group refinement | `G_K` acts on a basic lattice neighbourhood | Invariant intersection contains a zero-neighbourhood at every integral scale | Each compact orbit is contained in some `ℓ⁻ˢΩ` | Intersection remains absorbing; continuity route closes |
| §4.1 headline: equivariant twisting | Point, residue size `2`, `ℓ=7`, twists `1` and `−1` | Scalars `2` and `4` | Tensor scalar `2·4=1` | Twists cancel equivariantly |
| §4.1: zero twist and modulus one | `j=0`; `n=1` | Identity tensor identification; zero coefficient module | Original cohomology; zero cohomology | Boundary values consistent |
| §4.1: elliptic determinant | Elliptic `H¹`, `ℓ=7`, residue size `2` | Untwisted determinant `4`; twisted determinant `4·2²=2` | Tate module determinant `2`; wrong inverse convention gives `1` after twisting | Dual and twist signs agree |
| §4.2 headline: proper comparison | `Y=Spec K`, finite torsion `A` | Scheme geometric `H⁰=A`, higher `0` | Analytic geometric `H⁰=A`, higher `0` | Includes residue-characteristic coefficients |
| §4.2: nonproper comparison | `Y=𝔾_m`, `n` invertible | `H¹(μ_n)=ℤ/n`, class of `T` fixed | Analytic `H¹(μ_n)=ℤ/n`, same fixed generator | Twisted comparison equivariant |
| §4.2: affine line versus affinoid disc | Characteristic zero, residue prime `p`, coefficients `ℤ/p` | `H¹(𝔸¹_C,ℤ/p)=0` | Closed unit disc has infinite `H¹` | Comparison does not assert affinoid invariance |
| §4.2: noninvertible negative control | `K=𝔽_p((t))`, `Y=𝔸¹`, `c∈C∖K̄` | Class `cT` is present after extension to `C` | Source image has reduced coefficients in `K̄` | Nonproper field-extension map is not onto |
| §4.2: base-change coherence | Identity base-change square | Comparison mate is identity | Pasting with identity leaves comparison unchanged | Pinned mate composition supplies coherence |
| §4.3(a) headline: finite-level dévissage | Point | Orders `ℓ^(n−1)`, `ℓ`, `ℓ^n` | Short exact sequence has middle order `ℓ^(n−1)·ℓ` | Finiteness propagates |
| §4.3(b) headline: finite generation | Point, `H=ℤ_ℓ` | `H/ℓH=𝔽_ℓ`, one generator | Compact Nakayama gives one integral generator | Topology and hypotheses match pin |
| §4.3(c) headline: torsion and rational representation | Enriques surface in characteristic zero | `H²=ℤ₂^10⊕ℤ/2`; torsion quotient rank `10` | Rational `H²` dimension `10`; torsion maps to `0` | Integral torsion retained |
| §4.3(d): vanishing without finiteness | Characteristic-two closed disc, `N=1` | Independent classes `T,T³,T⁵,…`; `H²(𝔽₂)=0` | Degree-one transitions onto; `H²_cont(ℤ₂)=0` | Infinite `H¹` does not prevent conclusion |
| §4.3(d): boundary degree | Point, `N=0` | Reductions `ℤ/ℓ^(n+1)→ℤ/ℓ^n` onto | `lim¹=0`, hence `H¹_cont=0` | Boundary degree handled |
| §4.3: nonproper p-adic failure | Characteristic-zero closed disc, units `1+aT^m` | Infinitely many independent Kummer classes modulo `p` | Finitely generated integral `H` would have finite `H/pH` | Finiteness hypothesis cannot be dropped |
| §4.3 source hypothesis, R02 | `X=ℙ¹`, then `X=𝔸¹`, over complete algebraically closed characteristic-ℓ field | Milne’s completeness alternative: true, then false | Ground-field completeness: true in both cases | R02 changes the subject of the condition |
| §4.4(a) headline: prime-to-residue proper finiteness | `ℙ¹`, residue size `2`, `ℓ=7` | Ranks in degrees `0,1,2`: `1,0,1` | Finite coefficients have orders `7^n,1,7^n`; above `2` zero | Matches bound |
| §4.4(b) headline: mixed-characteristic finiteness | Elliptic curve over `ℚ_p`, `ℓ=p` | `H¹(𝔽_p)` dimension `2` | Integral rank `2`, rational dimension `2` | Primitive-comparison hypotheses apply |
| §4.4(c) headline and R01 | `ℙ¹/𝔽₂((t))`, `ℓ=2`, `j=0` | Finite-level groups `H⁰=ℤ/2^n`, higher `0` | Integral `H⁰=ℤ₂`, rational `H⁰=ℚ₂`; higher groups `0` | R01 removes unnecessary exclusion |
| §4.4: projective-space Check after R01 | `ℙ¹` in characteristic `2`, `ℓ=2` | `H²(ℤ₂)=0` | Prime-to-characteristic formula would give rank `1` | Retain its invertibility qualification |
| §4.4(d) headline: nonproper finiteness | Closed disc, `ℓ` prime to residue characteristic | `H⁰(ℤ/ℓ)=ℤ/ℓ`, higher `0` | All groups finite; above dimension bound `2` zero | Properness unnecessary in this case |
| §4.4(d): qc necessity | Infinitely many disjoint points, dimension `0` | `H⁰=∏ℤ/ℓ`, infinite | Each component has finite `H⁰=ℤ/ℓ` | Componentwise finiteness is insufficient |
| §4.4: dimension zero | Geometric point | `H⁰=ℤ_ℓ`, `H^{i>0}=0` | Bound `2d=0` | Rank-zero dimension case correct |
| Worked examples: permutation characters | S₃ cover and its cubic subcover | Regular character `(6,0,0)` | Cubic permutation character `(3,1,0)` | Distinct representations retained |

- Source verification: 32 locator groups across 9 readable works; all 15 seeded targets inspected, with direct verification of SGA 4½ in §2.6 unavailable as recorded below.
- Pinned field API: 12 named declarations opened in `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42`, `Mathlib/FieldTheory/KrullTopology.lean:170`, `Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean:451`, `Mathlib/Topology/UniformSpace/Completion.lean:414`, and `Mathlib/Topology/Algebra/Algebra/Equiv.lean:45`; no declaration proves the complete headline.
- Pinned cohomology/representation API: 12 named declarations opened in `Mathlib/AlgebraicGeometry/Sites/Etale.lean:50`, `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:76`, `TauCeti/CategoryTheory/Sites/SheafCohomology/Pullback.lean:69`, `TauCeti/RepresentationTheory/Continuous/ContinuousRep.lean:82`, `TauCeti/Algebra/Category/ModuleCat/Tower/MittagLeffler.lean:104`, and `TauCeti/Topology/Algebra/Module/Nakayama.lean:164`.
- Supplier audit: 11 supplier-roadmap contracts resolved; all 20 target `Needs` lines read; 16 resolver leads checked against their named targets; 1 precise, minimal finiteness gap matches `packages/GaloisActionOnEtaleCohomology/design/plan.json` and README line 103.
- Dependency output: `depcheck: 222 roadmaps, 1972 edges, 0 problem(s)`; 0 UPWARD or CYCLE lines.
- Worker gate: all checks pass, including `lake build TauCetiRoadmap.GaloisActionOnEtaleCohomology.Suggested`; independent `lake env lean` elaboration succeeds with 1 expected `sorry` warning.
- Signature/padding audit: 3 named declarations and 5 instances checked with `#check @…` in scratch copies; 0 lost hypotheses, 0 changes; 1 sorried theorem resists `simp`, `rfl`, `infer_instance`, with no matching one-lemma proof at the pins.
- Change/text audit: 1 new folder, 721 added lines, 0 removed headings/declarations, 0 outside-folder changes; title, description and generated merge-order block agree with this head.

Overlap check: read ClassicalAdicEtaleCohomology (#875: analytic cohomology, comparison, trace and finiteness), EtaleCohomologyFoundations (main and #1891: scheme adic realization and Frobenius bridge), DiamondEtaleCohomology (#922: diamond étale coefficients), AdicCoefficientsAndComparisons (#965: adic/v-sheaf coefficient comparisons), ClassicalAdicEtaleCohomologyPartII (#1549: p-primary duality), AdicSpacesPartIV (main: pro-étale sites), and AdicEtaleGeometry (main: analytic étale sites and descent); these remain their respective owners. This roadmap owns the explicit geometric-fibre action, its identifications with the supplied actions, and arbitrary-characteristic completion-automorphism equivalence. The result/heading proximity list is empty; no second copy, conflicting head, dropped cited id, or unmapped renumbering was found. LocallyAnalyticDistributions §0.0 concerns limits of topological vector spaces; §3.3 here additionally starts from arbitrary topological integral modules and constructs their rationalization.

Source independence: 21 passages compared across 9 readable sources, with no copied nonmathematical wording or reused tables, figures or example lists found; largest share stacks03N1, 13 of 67 explicit source-key citations before References. Its contents were read: no consecutive chapter-to-layer correspondence. Dependencies §0.2 → §1.2 → §2.1 → §3.2 → §4.3 force the field/action/discreteness/continuity/finiteness order. Wording at the four settled uncertified works below could not be compared directly.

## Not verifiable

- huber1996: Proposition 2.3.10, §2.4/Corollary 2.4.6, Corollary 2.8.3, Theorems 3.7.2–3.8.1 and Proposition 6.1.1; settled uncertified in the supplied source record, no readable cached text; supplier restatements and available secondary attestations checked.
- huber1994: §§1–3; settled uncertified in the supplied source record, no readable cached text; conventions checked against the named adic-space suppliers.
- sga4half: Arcata/Rapport locators used for §2.6; settled uncertified in the supplied source record, no readable cached text; scheme Frobenius supplier and arithmetic/geometric examples checked.
- serreGC1997: Chapter I, §2; settled uncertified in the supplied source record, no readable cached text; discrete-module and continuous-cohomology contracts checked against ProfiniteCohomology.

## Source issues

- **Misprint** in milneLEC at Remark 14.10, printed page 97, line 3863: the source says the finite-cover spectral sequences are passed to an inverse limit; it should be a filtered direct limit along pullback and inflation, while the covering spaces and finite Galois groups form inverse systems; affects the proof.
- **Misprint** in dejongvanderput1996 at the proof of Corollary 3.7.5, printed page 39, line 1607: the source says the cited result 3.3.2 is a lemma; it should be Corollary 3.3.2, printed page 29, line 1201; affects nothing.
- **Gap** in dejongvanderput1996 at the proof of Corollary 3.7.5, printed page 39, lines 1601–1604: the source invokes geometric-fibre/stalk comparison with an overconvergence condition while the corollary allows arbitrary abelian sheaves; it should justify that comparison for arbitrary sheaves or supply a proof avoiding it; affects the proof.

## For the human reviewers

- none
