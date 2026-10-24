# Repair report

The finding numbers below retain each review's numbering. Overlaps are resolved once in the edits and cross-referenced explicitly. Only `packages/HabiroNumberFields/README.md`, the top-level gaps of `packages/HabiroNumberFields/design/plan.json`, and this report change. The acceptance signatures do not need alteration or additional declarations.

# Review a

## F01 (P2) — applied

Broad arithmetic gap → exact imports from ArithmeticKTheory §§3.4, 4.1–4.4, 5.2–5.3 and 6.13. The remaining degree-two coefficient and torsion diagrams resolve through KTheoryFiniteLocalFields §3.0a and K2SymbolsBrauerPartII §5.2. Deleted gap:arithmetic-k-inputs and updated §§0.2, 0.5–0.6, 1.6 and supplier/ownership paragraphs. At p=5, χ=2 gives inverse weight 3 and diagonal twist 2·3=1.

## F02 (P2) — applied

Second Bott construction → import KTheoryFiniteLocalFields §1.2 and its §1.8 Chern normalization. Section 1.8 now owns only comparison of the positive chains with that class; noncommutative rings receive it along ℤ[C_N]→B. H2024 line 290–295 confirms odd-order coefficient construction without inverting N. For ℤ[ζ₃], its Bockstein is [ζ₃] before inverting 3. Supplier/ownership paragraphs agree.

## F03 (P2) — applied

Nontrivial unit → nonzero K₁ class as the obstruction to an integral Bott lift. In §1.8, Bockstein is [ζ]; étale evaluation requires commutativity and invertible N. For M₃(ℚ(ζ₃)), det(ζ₃I)=1, hence [ζ₃I]=0 and coefficient exactness gives an integral lift. Over ℚ(ζ₃), [ζ₃]≠0 excludes one. Both assertions and the negative Check were repaired.

## F04 (P3) — applied

Unqualified nontrivial cubic class → class in ℚ(ζ₃) and its trivialization over ℚ(ζ₉), in both §§1.1 and 1.4. The product identity is unchanged: D(1)=ζ₃(1−ζ₃)³=(ζ₉(1−ζ₃))³ after extension. Nontriviality over ℚ(ζ₃) follows since a cube root of ζ₃ would have order nine and degree six over ℚ.

## F05 (P3) — applied

Arbitrary fifth root → ζ=exp(2πi/5) for the −φ arguments, alongside the ζ² sum with arguments 1/φ. Section 1.7 retains both degenerate terms and records eta(ζ²)=4eta(ζ) modulo five. Direct squared sine ratios give −1.618033988750 and 0.618033988750. CGZ line 1204–1220 fixes the projective formula; its root action agrees with the K₃ product in §1.9.

## F06 (P1) — not actionable in this package: exceptional comparison is owned by K3BlochGroups

K3BlochGroups §3.13 already supplies B_old(𝔽₂)=ℤ/3, but §§5.4–5.5 do not supply its positive K₃/reduction comparison. Narrowed gap:bloch-foundations to that comparison and square, in README and plan; §§1.11–1.12 consume it and retain every prime. Added D_ζ(1)=ζ, R([0])=ζ²≠1 in 𝔽₄. CGZ line 1048 assumes odd residue characteristic. Supplying the missing theorem requires its owner's edit.

## F07 (P2) — applied

Second completed-Frobenius construction → QWittVectors §§2.4 and 6.1 at A=ℤ, R=O_K[1/Δ]. Section 2.2 retains factor identification, order lcm f_v and the two cyclotomic extensions. Scope, suppliers, Layer 2 dependencies, §3.16 and consumers now cite the supplied naturality. Q line 647–658 confirms the linearized equivalence. Checks give i↦−i at 3, identity at split 5 and the unique map on zero.

## F08 (P3) — applied

Intersection characterization in §2.5 → §2.7, after the all-order image theorem. Its inputs now explicitly include §2.5 reconstruction/untwisting, §2.7 image, finite-free coefficient extension and coefficient intersection. Section 2.5 retains seed reconstruction only. At p=2 the indicator seed reconstructs the 2-power chain first; §2.7 then identifies its classical image. No forward image-theorem input remains in §2.5.

## F09 (P2) — applied

New picardEigenObstruction_vanishes target → ArithmeticKTheory §6.13's invariant-vanishing corollary. Section 0.6 uses that import; §0.5 retains the elementary finite-endomorphism theorem and explanatory cyclic-group argument. Same ownership repair as F01. At p=5 the χ⁻¹ component has action 3 and twisted action 1; at p=3,a=2 the proof never divides by |G|=6.

# Review b

## F01 (P2) — applied differently

Resolved with review a F01/F06/F09: replaced Bloch, arithmetic and local-regulator requests by verified section contracts, updating every occurrence through §§3.1, 3.4, 3.18 and Layer 3 dependencies. Deleted the arithmetic and local-regulator gaps. Kept only the exceptional characteristic-two comparison gap: K3BlochGroups §3.13 supplies its group, whereas §5.5 explicitly restricts the general comparison to q≥4. Removing every gap would conceal that input.

## F02 (P3) — disputed

The Sources instruction requests locators of the form “source id line N” against the supplied extractions. The cited README passages also retain printed theorem/equation/page locators, and the manifest identifies each extraction by hash. GZ line 129, CGZ line 1443, GSWZ line 806 and BG line 1268 resolve to the stated passages. No source text is copied; no locator is removed.

# Verification

## Elaboration and signatures

The prescribed `lake env lean` invocation on `packages/HabiroNumberFields/Suggested.lean`, run from the content checkout, exited 0. Its complete diagnostics, with repository-relative filenames, were:

```text
packages/HabiroNumberFields/Suggested.lean:43:8: warning: declaration uses `sorry`
packages/HabiroNumberFields/Suggested.lean:50:8: warning: declaration uses `sorry`
packages/HabiroNumberFields/Suggested.lean:62:8: warning: declaration uses `sorry`
packages/HabiroNumberFields/Suggested.lean:71:8: warning: declaration uses `sorry`
```

A separate scratch copy appended `#check @name` for all six declarations and was elaborated once with `lake env lean`, also from the content checkout. Exit 0, the same four warnings, no errors. Compared every resulting type with §§1.1–1.3:

| Declaration | Explicit elaborated context | Comparison |
|---|---|---|
| cyclicDilog | arbitrary universe, CommRing, n, ζ, x | Integral finite product; no field or characteristic hypothesis lost. |
| cyclicDilog_quasiPeriodicity | Field; n>0; primitive ζ of order n; s≤n | Same field, root and shift scope as §1.1. |
| cyclicDilog_one_pow_twentyFour | Field; n>0; primitive ζ; (n:K)≠0 | Same invertible-order scope as §1.1. |
| cyclicHypergeom | arbitrary universe, Field, n, ζ, x, y, z | Total field division, including singular inputs as in §1.2. |
| cyclicHypergeom_shift | Field; n>0; primitive ζ; xⁿ,yⁿ≠1; hypersurface equation | Same nonsingular hypersurface and direction as §1.2. |
| kms | Field; n>0; (n:K)≠0; primitive ζ; x,y,z≠0; X,Y≠1; X≠Y; hypersurface | Every binder and denominator guard matches §1.3, including even orders. |

No binder changed, no headline became statable through these prose repairs, and no Check was added to Lean. The unchanged file has two real definitions, four headline theorems, one `import Mathlib`, and no additional imports or options.

## Dependency check

Final prescribed dependency check: exit 0; complete output:

```text
depcheck: 30 roadmaps, 270 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. An earlier run interpreted the sentence naming HabiroRings's relative ownership in README line 11 as a supply edge and reported:

```text
not movable: HabiroNumberFields consumes HabiroRings (#217) and is consumed by HabiroRings (#217), which comes first: moving HabiroNumberFields after HabiroRings would put a supplier after a consumer, a cycle through HabiroNumberFields
UPWARD: HabiroNumberFields (#216) -> HabiroRings (#217) at README lines [11]
CYCLE among: HabiroNumberFields, HabiroRings
depcheck: 30 roadmaps, 273 edges, 2 problem(s)
```

The sentence now explicitly says “Downstream HabiroRings consumes this roadmap's number-field ring and indexed lines”. No mathematical supply direction changed; no tooling or order file was edited. No initial gate failures were supplied in the brief.

## Ownership, citations and sources

Read main examples `TauCetiRoadmap/Chebotarev/README.md`, `TauCetiRoadmap/RestrictedPowerSeries/README.md` and `TauCetiRoadmap/ComplexTori/README.md`. Existing layers and targets retain their order, except the requested intersection paragraph within Layer 2.

Used the roadmap search/show tools, board package index and supplied sibling checkouts. ArithmeticKTheory was read at its supplied head; K3BlochGroups at its supplied head; PadicHodgeRegulators was additionally read through the board index's head 5eff35d, not assumed absent when the roadmap index returned no result. Its §§5.6–5.9 explicitly contain the root classes, finite integral presentations, normalization, naturality and transfer used here. The transfer law is cited by its actual section; the review's name completedK3_transfer is not asserted to be a declaration there.

| Supplier citation | Verified content and scope |
|---|---|
| ArithmeticKTheory §§3.4, 4.1–4.4, 5.2–5.3 | Finite even groups and ranks; fixed twists and rational Tate values; actual coefficient-compatible arithmetic étale descent and odd-primary K₃ structure. Soulé §5.1 alone is not the global H¹ comparison. |
| ArithmeticKTheory §§6.1, 6.13 | Degree-two arithmetic comparison; positive twisted Picard injection and χ⁻¹ identification; invariant vanishing under p∤#K₂(O_F), including ramified odd p. |
| K2SymbolsBrauerPartII §5.2 | Actual finite and adic global Tate symbols, restriction/completion diagrams and torsion identification, with its explicitly stated supplier contracts. Its §5.3 imports the integer-ring comparisons from ArithmeticKTheory. |
| K3BlochGroups §§3.12–3.16, Layer 4, §§5.4–5.5, 6.7 | Distinct old/new/Suslin conventions, specialization and configurations, q≥4 finite comparison, finite-coefficient Chern equivalence independent of this roadmap. §3.13 separately computes old 𝔽₂; it does not make the ≥4 comparison apply there. |
| KTheoryFiniteLocalFields §§1.2, 1.8, 2.1, 3.0a, 6.5a–6.6, 7.1–7.4 | Bott class and parity restriction for additivity; independent early finite Chern construction; henselian rigidity with invertible coefficient order; norm-residue and field étale descent; actual completion and reduction maps. |
| QWittVectors §§2.4, 6.1 | ℤ is perfectly covered, ψ_p=id; unique continuous completed Frobenius and invertible linearization for étale R. The zero completion is included. |
| PadicHodgeRegulators §§3.2–3.3, 3.6, 5.4–5.9 and its completed-K₃ supplier block | Factorwise Coleman normalization, roots nontrivial in every factor, p>3 unramified isomorphism onto p²O_L, finite ℤ_p-linear generation, transfer/corestriction and log-norm/trace compatibility. |
| StableHomotopyKTheory §§7.2–7.4, 7.33 | Finite coefficients and Bockstein UCT; coefficient products retain their spectrum/vanishing hypotheses. |
| GeneralAlgebraicKTheory §§2.1–2.4, 3.2, 7.4–7.8 | Shared K-theory carriers, ring functoriality, products, finite-flat transfer and projection/base-change laws. |
| HabiroCyclotomicCompletions §§1.1–1.5, 3.1–3.3, 4.5–4.8, 5.2–5.4 | q-products, ordinary completions, convergent Taylor changes, finite weighted jets and integral detection, component CRT and localization distinction. |
| QSeriesPartitionsAndMockModularForms §§1.2–1.6, 2.3, 2.5, 5.2 | Integer-index quotients, normal convergence on the actual annulus, Ramanujan summation and eta multiplier; no supplier root-of-unity asymptotic is presumed. |
| PolylogarithmFunctions §§1.1–1.7, 3.2, 3.4 | Principal continuation, derivative recursion, Li₂(1), inversion and Abel five-term identity on its stated domain. Landen remains the local target in §1.3. |
| ColemanIntegration L2.16–L2.18, L3.Fa.2–L3.Fa.4 | Branch-aware polylogarithms, D=Li₂+½log·log, coefficient naturality and the rational de Jeu complexes and map. |
| Chebotarev Layer 10 | Prescribed arithmetic Frobenius, positive density and deletion of a finite exceptional set. |
| HabiroRings; HabiroNahmSeries | Consumer contracts for this arithmetic ring and actual indexed lines; regulator construction here does not consume the later Nahm eta evaluation. |

Searched the 29 named sibling folders from the brief, each README and Suggested.lean, and main/board sources by object. Relevant boundaries are also explicit in HabiroCohomologyFoundationsPartII §4 and Scope, HabiroCohomologyFoundations's finite-étale exports, and HabiroRings §§5.9, 6.1–6.2. The finite Chern/regulator interfaces, positive-chain comparison, arithmetic chart/assembly, and indexed-line descent remain owned here. A search for the four finite theorem names and their defining products found no competing declarations in the pins or roadmap heads. No fully qualified Lean declaration name changes. Open roadmap heads without files in the brief were not separately investigated.

The pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, confirmed from the content manifest. Pinned interfaces used in the repairs were read at:

| Declaration | Repository-relative file and locator; retained hypotheses |
|---|---|
| IsPrimitiveRoot.autToPow / autToPow_spec | `Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean:784`, `:821`; NeZero n and the stated primitive root. |
| NumberField.not_dvd_discr_iff_isUnramifiedIn | `Mathlib/NumberTheory/NumberField/Discriminant/Different.lean:191`; integral closure and prime p. |
| Algebra.Etale.of_formallyUnramified_of_flat | `Mathlib/RingTheory/Smooth/Fiber.lean:245`; finite presentation, flatness and formal unramifiedness. Localization after inverting the discriminant supplies the domain used here. |
| Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete | `Mathlib/RingTheory/Smooth/AdicCompletion.lean:94`; formal smoothness and completeness, used by the retained chart proof, not a second Frobenius construction. |
| Algebra.FormallyUnramified.ext_of_iInf | `Mathlib/RingTheory/Unramified/Basic.lean:161`; formal unramifiedness and zero intersection of ideal powers. |
| Polynomial.separable_cyclotomic | `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:652`; field and nonzero order in that field. |
| Polynomial.eval_one_cyclotomic_prime_pow | `Mathlib/RingTheory/Polynomial/Cyclotomic/Eval.lean:41`; prime-power exponent convention as in the existing root-difference Checks. |
| TauCeti.frobeniusAlgEquiv / orderOf_frobeniusAlgEquiv | `TauCeti/NumberTheory/LocalField/ResidueCorrespondence.lean:164`, `:178`; unramified local extension and its native local-field context. |
| TauCeti.eq_frobeniusAlgEquiv_of_valuation_sub_pow_lt_one | `TauCeti/NumberTheory/LocalField/ResidueCorrespondence.lean:237`; automorphism and congruence on every integer. At base ℚ_p the residue cardinality is p. |

The roadmap resolver exits 0 and lists no missing Lean names. It reports `9: PadicHodgeRegulators §§5.6: no roadmap PadicHodgeRegulators on main or in an open pull request`. This is an index limitation: the board index lists the supplier at head 5eff35d, whose actual text was read as described above. The resolver also says it did not check external Lean names because its host has no pinned Lake packages; the relevant pins were therefore inspected directly, with the declaration locators recorded above. No new directly cited work was introduced. All eight source keys retain their legal cached texts and certified entries; no source fetch or missing-text request was needed. Source passages were read, not copied into this package. Principal locator checks for the repairs are:

| Source | Passage and use |
|---|---|
| CGZ line 901–930 | §3 arithmetic unit/Picard argument; the supplied Keune quotient replaces reconstructing its arithmetic corollary. |
| CGZ line 1048 | Odd residue prime assumption; it cannot certify the ℓ=2 extension. |
| CGZ line 1128; line 1197; line 1228 | Reduction square, exact-valuation eta reduction and all-prime local regulator statement, kept distinct. |
| CGZ line 1204–1220 | Projective eta sum with degenerate terms. |
| CGZ line 1439–1519 | Étale Bloch definition, coefficient exact sequence and Tate comparison; coefficient diagrams now have named suppliers. |
| H2024 line 289–309 | Odd-order Bott class, Bockstein/Chern normalization and the product-sign comparison; noncommutative K₁ nonvanishing is not inferred. |
| H2013 line 1506–1575 | Chain-level cross-ratio and cyclic-resolution route; its orbit and normalization hypotheses remain in the supplier contract. |
| Q line 647–658; W-thesis line 1313–1321 | Relative completed Frobenius and linearization; specialization at ψ_p=id is invertible Frobenius itself. |
| GSWZ line 798–816 | Pochhammer logarithm and negative depleted-polylogarithm residue retained in all dependent Checks. |
| GZ line 129–144 | Root-of-unity expansion used with the unshifted-product convention and negative half exponent. |
| BG line 1267–1268 | Trivial tame-kernel entry at discriminant −4; the printed page and extraction locator both remain. |

## Adversarial mathematics pass

Each row records an instance calculation, not a proof of an admitted headline or of a supplier theorem. “Conditional” means the calculation uses the stated mathematical carrier or compatibility contract, whose construction remains a roadmap obligation. The repairs introduce no substitute carrier or assumed conclusion. All changed paragraphs and their consumers are included; unchanged targets were also tested by the following instances.

| Statement | Instances and computed values on both sides | Result; change |
|---|---|---|
| Completion convention | R=ℤ[1/6], p=3: R/3ᵃR=0 for every a≥1, hence R̂₃=0; R⊗ℤ₃=ℚ₃. At p=5 both models give ℤ₅. | Keep separate completion and tensor domains. |
| Full cyclotomic algebra convention | K=ℚ(i), m=4: K⊗ℚ(i)=K×K has K-rank 2; a chosen compositum has rank 1. A_m(0)=0. | Keep full algebra. |
| Root character and positive Kummer convention | n=5, σζ=ζ²: inverse weight is 3 because 2·3=1 mod 5. For αⁿ=a, replacing α by ζα multiplies σα/α by σζ/ζ. | Coboundary change, with the positive ratio retained. |
| Bloch convention and coefficient orders | At 𝔽₁₁ the old and new groups have orders 6 and 3; their odd quotients both have order 3. At 𝔽₂ old group has order 3, Suslin group 0. At n=1 every coefficient group is 0. | Separate the exceptional comparison; no order-zero construction. |
| c_raw, c_plus and ε convention | In C₃, a value ζ becomes ζ² under inversion; its square ζ² becomes ζ. The two squared maps still differ. | Keep normalization comparison as a target. |
| Additive/logarithmic/multiplicative coordinates | ζ₂=−1 gives x=u and h=−x−x²/2+…; exp(h) has constant 1 whereas q has constant −1. At m=1, x=−u. | Correct sign and constant-one half power retained. |
| Imported coefficient UCT | K₂(𝔽₃)=0, K₁(𝔽₃)[2]=C₂, so K₂(𝔽₃;ℤ/2)=C₂; integral tensor quotient is 0. At n=1 all terms vanish. | No identification of finite coefficients with ordinary quotient. |
| Imported Picard twist | For χ=2 and class action 3 mod 5, χσ−1=2·3−1=0, while σ−χ⁻¹=3−3=0. The wrong twist gives 2·2−1=3≠0. | Same inverse-character source; import ArithmeticKTheory §6.13. |
| Imported local regulator lattice | At p=5, the specified root class has regulator 25 mod 125. Gros depletion gives (1−1/25)·25=24 mod 25, a unit. Zero class has value 0 in either map. | Coleman p² normalization cannot be replaced by Gros normalization. |
| Imported completed Frobenius | A=ℤ has ψ_p=id, so r⊗a↦φ(r)a identifies the linearization with φ. On ℤ₅×ℤ₅ it is identity; on zero it is the single zero map, an isomorphism of zero rings. | Supply from QWittVectors; no prime discarded. |
| §0.1 integral eigenclass equations | Trivial G fixes the whole class group. In ℚˣ/(ℚˣ)², 8/2=4 is a square, so [8]=[2] despite unequal representatives. | Equations are on classes. |
| §0.1 failure of exact character parts | In (ℤ/9)[C₆], weighted augmentation of an inverse-weight eigenvector is 6a, with image {0,3,6}; 1 is missed. Inverting 6 permits the projector. | No unconditional integral averaging. |
| §0.2 excluded integers | ℚ: M=6·1·2=12, M′=4; ℚ(i): M=6·4·1=24, M′=8. gcd(1,M)=1; gcd(2M,M)=M. | Values unchanged; exact suppliers replace the gap. |
| §0.2 reduced-M restriction | For ℚ, gcd(3,4)=1 and 9∤3; gcd(9,4)=1 but 9 divides 9. | Extra 9∤n premise is necessary for the stated variant. |
| §0.3 finite Chern definition | r=1 gives t_ζ=id on μ_n; r=2 changes basis t_(ζ²)=2t_ζ at n=5. Its inverse change is multiplication by 3. At n=1 source and target are 0. | All positive orders remain in the definition. |
| §0.3 equivariance and change-root law | At r=2,n=5, χ=2, χ^(1−r)=3; at r=1 it is 1. Root inversion gives exponent −1 in degree three. | Direction unchanged. |
| §0.3 field, coefficient and additive laws | Identity embedding fixes ζ; 25→5 sends ζ₂₅ to ζ₂₅⁵. Zero K-class maps to 1, and c(ξ+0)=c(ξ)·1. | Conditional coefficient diagrams; now exact supplier sections. |
| §0.4 scalar Sah consequence | C₂ acting by −1 on C₃ has scalar a−1=−2=1 mod 3, giving H¹=0. With trivial action a−1=0, the equation is only 0·H¹=0. | No vanishing inferred from a zero annihilator. |
| §0.4 restriction injectivity condition | For ℚ, w₂=24: at n=5 gcd=1; at n=3 gcd=3. The repeated-prime Chern criterion nevertheless accepts squarefree n=3. | Distinguish the two criteria. |
| §0.4 repeated-prime injectivity | n=3 has no prime-square divisor. n=9 has 3² dividing it and 3 dividing w₂(ℚ)=24. | Former allowed, latter excluded by this theorem. |
| §0.5 finite-endomorphism theorem | A=C₉,f=2,n=9: f(A)=A, ker f={0}, A[9]=A. For f=0,n=3, f(A)+3A={0,3,6}≠A and A[3]={0,3,6}. | Premise separates the failed model. |
| §0.5 finiteness and n=0 | A=ℚ/ℤ, f=3, n=3: f is onto but kernel contains 0,1/3,2/3. For finite A,n=0, onto f is injective; A[0]=A. For A=0 both groups are 0. | Keep finiteness and zero-modulus boundary. |
| §0.5 quotient versus torsion | C₃→C₉ by 1↦3 induces zero on quotients modulo 3, but an isomorphism onto 3-torsion. | No natural identification of the two functors. |
| §0.5 supplied Picard vanishing | On the inverse component mod 5 the diagonal twist acts by 2·3=1. Zero coinvariants force zero finite module via the supplied p-group argument; at p=3,a=2, |G|=6 has no inverse mod 9. | Arithmetic corollary imported; obsolete target deleted. |
| §0.6 exact eigenclass lift | 3ℤ↪ℤ→ℤ/3: 6 has unique lift 6∈3ℤ; 1 has nonzero obstruction. ℤ→0 would give infinitely many lifts of zero. | Injectivity and image=kernel both needed. |
| §0.6 cyclotomic ramification | F=ℚ,p=3,a=2: degree=e=φ(9)=6,f=1. Over ramified F=ℚ(ζ₃), p=3,a=1 gives degree 1 rather than 2. | Keep unramified premise on this target. |
| §0.6 valuation-image exact sequence | D=3ℤ⊂ℤ,n=3: 3∈D/3D is nonzero but maps to 0∈ℤ/3. | Use D, not an assumed saturated ambient lattice. |
| §0.6 ordinary-unit lift | On D/n with trivial action and χ=−1, the eigen-equation is d=−d; at odd n this gives d=0. With trivial χ it allows every d. | Tame nontrivial character kills the valuation obstruction. |
| §0.7 S-unit existence and avoidance | At n=1 the class is trivial and S=∅ works. In ℚ, 2 is a {2}-unit with valuation 1 at 2; ordinary units ±1 have all finite valuations 0. | Do not confuse S-units and ordinary units. |
| §0.7 extension and CRT diagrams | ℚ→ℚ(∛2) kills [2] in cubic classes. At n=35, ζ₃₅⁷ has order 5 and ζ₃₅⁵ order 7. | Field maps need not be injective; CRT retains its fields. |
| §0.8 equivariant Dirichlet multiplicity | ℚ(ζ₃)/ℚ has unit rank 0 and odd-character multiplicity 0. In the S₃ splitting field of x³−2, the unit representation is the two-dimensional standard representation; the odd sign character has multiplicity 0=r₂(ℚ). | Nonabelian test agrees with actual stabilizers. |
| §0.8 trivial-character correction | For ℚ(ζ₅)/ℚ the trivial multiplicity is 1+0−1=0, while the full unit rank is 1. For trivial extension of an imaginary quadratic field it is 0+1−1=0. | No arbitrary-character rank formula. |
| §0.8 p-unit dimension versus rank | F=ℚ: p=3 gives rank 0 plus root contribution 1; p=5,7 gives 0. F=ℚ(∛2) has r₂=1 and no need for its Galois closure to avoid ζ₃. | Preserve torsion correction and actual subgroup. |
| §0.9 finite Chern unit theorem | ℚ,n=5: K₃/5=0 and inverse-weight ordinary units=0. n=3 with M′: both are C₃. n=25: the theorem asks for injection only. | No extra prime-power surjectivity. |
| §0.9 uniqueness and sign | Representatives u and uvⁿ have equal power class. Inverting a map preserves its kernel and image subgroup: in C₃, ζ and ζ² generate the same group. | Unique class, not unique unit. |
| §1.1 cyclicDilog definition | n=0,1 gives 1; n=2,ζ=−1 gives 1+x. On ℤ[e]/(e²), x=e gives 1+e; in the zero ring 1=0. | Native CommRing body includes nilpotents and zero ring. |
| §1.1 coefficient/polynomial API | Reduction ℤ→𝔽₂ takes 1+x to 1+x. The n=3 product has factors (1−ζx) and (1−ζ²x)², which differ on swapping the exponents. | Correct asymmetric polynomial orientation. |
| §1.1 quasi-periodicity | n=2,s=1,ζ=−1,x=2: both sides 3. s=0: D=D; x=1 gives 0=0. Across 1,723 finite-field instances every difference was 0. | Cleared identity retains singular points. |
| §1.1 nonvanishing | x=0 gives 1. For n>1, x=ζ⁻¹ gives a zero k=1 factor; xⁿ=1. In a field, xⁿ≠1 prevents every vanishing factor. | Guard on inversion/logarithm retained. |
| §1.1 exact phase | n=3 gives D(1)²=−27ζ². Exact reduction in ℤ[t]/Φ_n gives D(1)^24−n^(12n)=0 for every 1≤n≤16. | Headline unchanged. |
| §1.1 power-class normalization | At n=3, D(1)=ζ₃(1−ζ₃)³; [ζ₃]≠1 over ℚ(ζ₃), but becomes 1 over ℚ(ζ₉). At n=9 the formula gives [ζ₉³]. | Both ambient-field Checks repaired. |
| §1.2 cyclicHypergeom definition | n=0 gives 0; n=1 gives 1. Over ℚ,n=2,(x,y,z)=(2,3,5) gives 1+(4/3)·5=23/3. | Total division and argument order retained. |
| §1.2 singular diagonal | n=2,ζ=−1,x=y=−1,z=1: second ratio is 0/0=0, so f=1 while geometric sum=2. | Nonsingular premise cannot be dropped. |
| §1.2 periodicity | Term n divided by term 0 is (1−Y)Z/(1−X)=1. For n=1,x=2,y=3,z=1/2, relation gives (−2)(1/2)=−1. | Guarded cyclic extension only. |
| §1.2 shift headline | Same order-one triple: left 1−1/2=1/2, right 2−3/2=1/2. All 8,038 admissible KMS test triples also satisfy the shift. | No characteristic-zero binder needed. |
| §1.2 nonsingular geometric sum | x=y=0,z=ζ₃: f=1+ζ₃+ζ₃²=0. x=y=0,z=1,n=3 gives 3. | Agreement holds on its stated domain. |
| §1.3 KMS headline | Over 𝔽₁₁,n=2,ζ=10,(x,y,z)=(2,4,3): both sides 2. Over 𝔽₁₉,n=3,ζ=7,(2,10,5): both 5. Total 8,038 admissible instances passed. | Even orders and positive characteristic retained. |
| §1.3 even-order sign | At n=2,ζ=−1,(x,y,z)=(1/2,1/3,3√6/8), the hypersurface reads 3/4=3/4 and both cleared sides are −2/9−4√6/27. | T=n(n−1)/2 sign fixed. |
| §1.3 denominator guards | X=Y implies Z=1; then D(ζ/z)=D(ζ)=0. At n=1 all D factors and f are 1. At n=0 no theorem is asserted. | Divided identity uses the real guards. |
| §1.3 small-characteristic scope | In 𝔽₁₆=𝔽₂[t]/(t⁴+t+1), n=3,ζ=t²+t,(x,y,z)=(t,t+1,t): both sides t³+t². In 𝔽₂₇=𝔽₃[t]/(t³+2t+1), n=2,(t,t+1,t²+2t): both t²+t+2. | 108 and 480 admissible triples respectively; no good-prime shortcut. |
| §1.3 Gaussian-limit target | X=1/5,Y=2,Z=−4/5 gives annulus 1/10<4/5<1 and S=4/9, hence prefactor (2/3)√(2π/n). At X=9/10,Y=2, the required 9/20<1/10 is false. | Conditional uniform tail/limit theorem, center valid. |
| §1.3 eta phase target | Dedekind sums s(1,2)=0, s(1,3)=1/18. Thus n=2 has D=2,μ²=1, while n=3 has D=3√3·exp(πi/6),μ³=exp(−πi/6). | Absolute values alone would miss the phase. |
| §1.3 radial Pochhammer asymptotic | n=1,x=−1: normalized values at ε=.1,.05,.025 are .704166632495,.705635175514,.706370595120, approaching 1/√2=.707106781187. x=0 gives 1 for every n. | Negative half exponent retained. |
| §1.3 complex dilogarithm cancellation | At center Abel inputs are 4/9,1/9 with sum 5/9; resulting arguments are 1/2,1/5,1/10. Log ratio (1−Z)/(1−X/(YZ))=8/5=−YZ; dropped log term is ½log²(8/5)≈.1104517≠0. | Branch-sensitive cancellation remains an explicit proof target. |
| §1.3 Landen identity | At w=0 both sides 0. Differentiating both sides gives Log(1−w)/(1−w) on the cut plane, with denominators 1−w≠0. | Separate local target from supplied derivative recursion. |
| §1.3 integral specialization | At n=2, x²−1+z²−y²z² is monic in x, with free basis 1,x. At n=3 the same construction has basis 1,x,x², also modulo 2 and over a square-zero coefficient extension. | Torsion-free integral model supplies the route; no embedding of finite fields into ℂ. |
| §1.4 Kummer-value definition | n=1 gives P=1. At n=3, P(0)P(∞)=D(1)⁻¹D(1)=1. In the base ℚ(ζ₃) the two factors have classes ζ₃²,ζ₃; in ℚ(ζ₉) both classes are 1. | Do not infer nontriviality in an unspecified further target. |
| §1.4 change of radical lift | x→ζx multiplies D by (1−x)ⁿ/(1−X). If (1−X)=bⁿ, this is ((1−x)/b)ⁿ. | Root of 1−X is required, not just a root of X. |
| §1.4 inversion | In the n=3 normalizing factors, P(0)P(∞)=1. For odd n the squared inversion relation implies inversion since squaring is invertible mod n. At n=2 it is not invertible. | Odd/even distinction retained. |
| §1.4 connecting obstruction | For [3] over ℚ, boundary 3∧(−2) has v₃∧v₂ coefficient 1. For [32] mod 5, boundary is 5(2∧−31), hence 0 mod 5. | Only boundary-zero combinations descend. |
| §1.4 universal versus finite witness | With a trivial finite Galois group H¹=0, but ℚˣ/(ℚˣ)³ contains [2] because v₂(2)=1. | No finite-witness Kummer surjectivity assertion. |
| §1.5 finiteRegulator definition | n=1 target is trivial. At F=ℚ(ζ₃),n=3,ξ=0, both [1] and [2] restrict to 1 in the universal Kummer extension; [2] is not a cube before extension. | Unique descent retains root-free hypothesis. |
| §1.5 powered lift set | Same field has w_F=6 and trivial G; P(0)^6=1, with at least the distinct lifts [1],[2]. At coprime orders the eigenkernel is 0. | Set-valued ambiguity, not a canonical powered regulator. |
| §1.5 five-term law | At X=2,Y=3 over ℚ the five arguments are 2,3,3/2,3/4,1/2 with signs +−+−+. Their ordinary Bloch boundary cancels by bilinearity; at X=Y denominators/degenerate relations require separate treatment. | KMS factorization remains conditional on that relation, not on arbitrary symbols. |
| §1.5 root-change law | n=5,k=2 gives k⁻¹=3; k=−1 gives inverse. At n=3, ζ³=1 is not a primitive root and cannot be a unit root change. | Exact unit premise retained. |
| §1.5 order and field naturality | 15→3 uses ζ₁₅⁵,15→5 uses ζ₁₅³. For an extension adjoining ∛2 the image of [2] becomes 1. | Naturality is not injectivity. |
| §1.6 étale Bloch definition and exactness | [32] has exterior boundary 32∧(−31)=5(2∧−31), so it is a mod-5 cycle. Its divided boundary maps to {2,−31}; five times it is 0. | Larger group than ordinary Bloch/n; target unchanged. |
| §1.6 nonzero K₂ boundary | Tame symbol at 31 of {2,−31} is 2, with 2⁵=1 mod 31 and 2≠1. At n=1 all coefficient groups vanish. | Ordinary Bloch image has zero boundary; converse needs actual exactness. |
| §1.6 H¹ comparison | For ℚ,n=5, K₃(ℚ)/5=0 but the preceding K₂[5] class is nonzero. Thus finite coefficients and H¹ have a nonzero right-hand quotient. | Supplied Tate/coefficients square retained rather than collapsing it. |
| §1.7 eta definition | At n=3 the sum [∞]+2[0] becomes [0] because [∞]=−[0], with 3[0]=0. Deleting the degenerate symbols gives 0 instead. | Keep old convention. |
| §1.7 fifth-root arguments | ζ=exp(2πi/5): two arguments −φ≈−1.618033988750. ζ²: two arguments 1/φ≈.618033988750. | Repaired root-dependent Check. |
| §1.7 eta root scaling | Inverting ζ leaves every squared ratio unchanged, giving factor (−1)²=1. For n=5,k=2 scaling is 4, while the root-based regulator changes by 3. | Both laws retained, not conflated. |
| §1.8 positive bar chains | In C₃, ∂([t∣t]+[t²∣t])=3[t]; ∂([t∣t∣t]+[t∣t²∣t])=0. In C₁ normalized chains vanish. | Positive generator fixed before comparison. |
| §1.8 imported Bott comparison | Over ℤ[ζ₃], Bockstein is [ζ₃] although 3 is not invertible. Replacing ζ by ζ⁻¹ negates the class at odd N. | Import construction; only chain identification remains here. |
| §1.8 obstruction to integral lift | In ℚ(ζ₃), determinant of ζ₃ is ζ₃≠1. In M₃(ℚ(ζ₃)), determinant of ζ₃I is 1. | First cannot lift; second lies in integral image by exactness. |
| §1.8 Chern value | After inverting 3 in commutative ℤ[ζ₃], c_(1,0)(bott)=ζ₃. Before inversion the étale assertion has no stated domain; the Bott class still exists. | Commutativity and coefficient invertibility explicit. |
| §1.9 cyclic class to eta | n=3 maps the positive cycle to [0], not 0, under the required configuration comparison. This is nonzero in the old cubic presentation. | Conditional comparison; exceptional reduction uses the supplier gap. |
| §1.9 SL diagonalizer | t(ζ,1)=(1,ζ⁻¹)=ζ⁻¹(ζ,1); t(ζ⁻¹,1)=(1,ζ)=ζ(ζ⁻¹,1). det A=ζ−ζ⁻¹=d≠0; scaling column one by d⁻¹ gives determinant 1. | Actual SL conjugation preserved. |
| §1.9 eta times Bott | Replacing ζ by ζᵏ multiplies both degree-one and Bott factors by k, hence product by k². Restriction/corestriction has composite 2; 2⁻¹=3 mod 5, but 2=0 mod 2. | Odd restriction injectivity only. |
| §1.10 product sign | a=1 gives δ(a)=0 and trivial multiplicative value 1. Over 𝔽₇, cubes are {1,6}; [2] and inverse [4] differ. | Sign remains detectable. |
| §1.10 normalization diagram | Raw eta value ζ⁻¹ and positive value ζ differ over ℚ(ζ₃); their squares ζ and ζ² also differ. | Comparison to c_fixed remains an explicit target. |
| §1.11 local regulator definition | n=3,ℓ=5: unique cube root of 2 in 𝔽₅ is 3 since 3³=2. For ℓ=7, cubes of C₆ form only its order-2 subgroup. | ℓ≡−1 gives the correct root domain. |
| §1.11 exceptional finite field | In 𝔽₄, ζ²+ζ+1=0 gives D(1)=(1−ζ)(1−ζ²)²=ζ and R([0])=ζ². All three nonzero elements cube to 1. | Nonzero map C₃→C₃; positive comparison/reduction remains gap:bloch-foundations. |
| §1.11 local reduction square | Unit 1 reduces to 1. A representative with valuation 1 at 𝔮 does not reduce to a nonzero residue unit. | S-unit representatives must first avoid 𝔮; square is conditional on supplier comparison. |
| §1.12 exact-valuation eta generator | n=3: v₃(5+1)=1, v₃(2+1)=1, v₃(17+1)=2. In C₂₈₈ the order-3 root is g⁹⁶=(g³²)³, so its cube class is 1 at ℓ=17. | Exact-valuation generator argument kept separate from all-prime theorem. |
| §1.12 all-prime isomorphism | At (3,2), [0]↦ζ² generates C₃. At (3,17) the target cube quotient still has order 3 although [ζ]=1. | Keep higher-order proof and exceptional comparison obligation. |
| §1.12 valuation witness | If only factor k=1 has valuation 1, τ has valuation 1 mod p. If it is factor k=0, valuation contribution is 0. | Positive nonzero weight required. |
| §1.12 eta finite evaluation Check | For odd n=3,…,27 and four exact-valuation primes each, all 52 quotient comparisons R(eta)=[ζ²] agree. At n=5,ℓ=19, the common n-th power detector value is (7,9) in the quadratic basis. | Computed Checks, not proof of calibration. |
| §1.13 Chebotarev detection | Nonzero elements 1,2 in C₅ generate the same subgroup and have the same vanishing set under scalar-rescaled maps. A nontrivial Frobenius class has positive density, hence infinitely many coordinates. | Product target; no scalar determined by zero sets. |
| §1.13 eta comparison scalar | n=5,F₀=ℚ(√5): disc=5 fails the good-order premise. At ℓ=19, v₅(20)=1 and [ζ₅] has order 5; at ℓ=149, 25 divides 150 and [ζ₅]=1. | Separate eta bridge, no appeal to good-order units there. |
| §1.13 CRT comparison | n=35 scalar γ is a unit iff both mod-5 and mod-7 components are units. γ=2 passes both; γ=5 fails mod 5. | Unit scalar and order diagrams retained. |
| §1.14 image and scalar reading | n=5: (a,b)=(2,1) gives γ=2; (2,−1) gives γ=−2=3. At n=9,b=3,a=3, both γ=1 and 4 solve bγ=a. | Invertibility of b is indispensable. |
| §1.14 conditional calibration | At n=5,k=2, combined eta/root exponent is 2·4·3=4, agreeing with (ζ²)². Over ℚ both mod-5 source groups are zero, and every scalar acts the same. | Numerical input remains downstream; zero groups cannot calibrate it. |
| §1.15 all-order ε definition | m=1 gives ε=1. ℚ,m=5 has C₄₈/5=0. K=ℚ(ζ₃),m=3 still admits the Chern definition although unique regulator descent fails. | All orders retained. |
| §1.15 torsor and associated line | yᵐ=u becomes (vy)ᵐ=uvᵐ. At m=1 this is the ordinary coefficient line; for u not an m-th power the root need not lie in the base field. | Source/target lines and representative change are explicit. |
| §1.15 tensor/coherence laws | μ_m characters of weights 1 and −1 tensor to weight 0. Reduction 25→5 sends a chosen root y to y⁵. Two isomorphism classes alone do not pick that map. | Coherent maps remain actual targets. |
| §2.1 compatible roots | ζ₂ζ₃=exp(5πi/3); independent exp(2πi/6) differs. For p=2,m=5, CRT exponent e=6 satisfies e=2 mod 2 and e=1 mod 5. | Fixed compatible family retained. |
| §2.1 transition composition | For m=3,p=2, e=4 mod 6 and ζ₆⁴=ζ₃. Two successive p-power root maps send ζ_(p²m) to its p² power on the p-primary factor and fix prime-to-p roots. | Same composite on distinguished generators. |
| §2.1 root-difference valuation | (p,m)=(2,5): c=−2ζ₅, v₂=1. (3,4): v₃=1/2. (3,3): v₃=1/6. Independent roots ω₆−ω₃=1 have valuation 0. | Topological nilpotence, not nilpotence or arbitrary substitution. |
| §2.2 arithmetic algebra and basis | A₄(ℚ(i)) has basis 1,ζ₄ and rank 2. e=(1−i⊗ζ₄)/2 satisfies e²=e and projects to (0,1) under the two embeddings. | Full tensor factors retained. |
| §2.2 Frobenius specialization | On ℤ₃, φ(2)=2 and 2³=8 differ by 6∈3ℤ₃. On ℤ₃[i], φ(i)=−i has order 2; on ℤ₅×ℤ₅ order is 1. | Imported construction identified with actual local lift. |
| §2.2 Frobenius order/naturality | x³−2 mod 5=(x−3)(x²+3x+4), with quadratic discriminant 3 nonsquare. Residue degrees 1,2 give lcm 2. ℚ→ℚ(i) at 5 sends a to (a,a), fixed by both Frobenii. | No global cubic automorphism substituted for local Frobenius. |
| §2.2 inverted-prime case | R=ℤ[1/6],p=3 gives R̂_p=0 and exactly one endomorphism; completion of every cyclotomic factor is 0. | Zero case retained. |
| §2.2 two Frobenius extensions | K=ℚ,p=2,m=3: coefficient action fixes ζ₃, cyclotomic action sends ζ₃ to ζ₃². At K=ℚ(i),p=3,m=4, coefficient action sends e to 1−e. | Distinct root action and factor permutations. |
| §2.3 convergent re-expansion | rex_c(x)=x+c, rex_c(x²)=x²+2cx+c². For c=p, rex of Σxʲ has constant Σpʲ=1/(1−p); for c=1 its partial constants N+1 are not p-adically Cauchy. | Completeness and topological nilpotence retained. |
| §2.3 composition and ring laws | rex_d rex_c(x²)=x²+2(c+d)x+(c+d)²=rex_(c+d)(x²). rex_c(1)=1 and rex_c(0)=0. | Imported generic theorem specialized, no formal zero-constant shortcut. |
| §2.4 arithmetic ring definition | Constant i over ℚ(i) at p=3 gives i≠−i; constants 0,1 give equality. For ℚ the q² components at m=1 are 1+2x+x² with evaluation 1. | Frobenius gluing direction unchanged. |
| §2.4 operations and restriction | γ=1 retains every order; γ=2 retains odd orders and removes 1→2. Products of two satisfying equations satisfy the equation because rex and φ preserve products; 0+1 and 1·1 give 1. | Restricted edges have both endpoints present. |
| §2.4 individual-root descent | At K=ℚ(i),m=4, e has two component values 0,1. Choosing one root loses one of them. | Coinduction/descent on full algebras, not selected composita. |
| §2.4 KZ edge values | At q=−1, terms 1,2 give sum 3. At ζ₃, three terms give 5−ζ₃. At i, four terms give 8−3i. | Compatible root evaluations retained. |
| §2.5 local product definition | p=2 seeds at orders 1,3 are independent. Seed 1 at order 1 and 0 at every other odd order reconstructs values 1 on 2-powers and 0 elsewhere. | Product, not an asserted p-completion of the global ring. |
| §2.5 reconstruction and untwist | For ℚ(i),p=3, f₁=i,f₃=−i,f₉=i; φ^v₃(m) gives i,i,i. At m=p²d exponent is 2. | Forward untwist and inverse scalar reconstruction agree. |
| §2.6 local chart | m=1 gives q=1+x and ℤ_p[[x]]. At p=11,m=5, Φ₅ splits into four factors, giving rank 4, not 1. At p=2,m=3, rank is 2. | Every factor preserved. |
| §2.6 separability guard | Φ₃(ζ₃+x)=(2ζ₃+1)x+x² and (2ζ₃+1)²=−3. For p=3 its linear term is nonunit; coefficient reduction has a nilpotent, unlike 𝔽₃[[x]]. | Necessary p∤m premise retained. |
| §2.6 p-chain mixed-adic equivalence | At p=2,m=1, modulo (4,q+1), q−1=−2≠0 but (q−1)²=0. The scalar 2 is not a multiple of arbitrary monic chain products. | Completed double-system argument, no false raw ideal cofinality. |
| §2.7 prime-to-p Taylor splitting | p=2 independent seeds 1,3 give two independent chain factors. p=11,m=5 contributes four ℤ₁₁[[x]] factors. | Correct CRT/splitting ranks. |
| §2.7 all-order image | q² at m=1 has coefficients (1,2,1,0); seed zero reconstructs zeros, seed chain indicator reconstructs only its p-chain. | Conditional inverse supplied by §2.5 reconstruction and chart. |
| §2.7 intersection characterization | 1/2 lies in ℤ[1/2] and all odd completions, but not in ℤ₂. A seed c∈ℤ_p∖ℚ is local and cannot be a rational global coefficient. In a rank-2 basis both coordinates must pass the same intersection test. | Moved after image theorem; finite-free extension explicit. |
| §2.8 coordinate conversion | m=1 linear coefficient a→−a; m=2 a→a; m=3 a→−ζ₃a, reversed by −ζ₃⁻¹. Quadratic coefficient at m=1 keeps its sign. | Coefficient formula and inverse agree. |
| §2.8 weighted jets | N=0,1: empty. N=2: {(1,0)}. N=4: {(1,0),(1,1),(1,2),(2,0),(3,0)}; equality-boundary indices are excluded. | Strict inequality preserved. |
| §2.9 rational-field comparison | Δ=1 recovers usual gluing; Δ=2 permits odd-order indicator e with e²=e, e≠0,1. Localization of the integral domain cannot contain such an idempotent. | Completion/localization order retained. |
| §2.9 KZ expansions | At order one, coefficients begin 1,−1,2,−5,15,−53,217; at order two first terms are 3,11,72. Constant computations at orders 3,4 give 5−ζ₃,8−3i. | Agree with GSWZ example, no scalar Frobenius change. |
| §2.10 component definition/product | Δ=6: invariant for 5,35 is 1; for 10 it is 2; for 18 it is 18. Indicator e has e²=e and e(1−e)=0. | Component product includes infinitely many factors. |
| §2.10 domain hypothesis | K=ℚ(i),d=4 shares ℚ(i) with ℚ(ζ₄), and e=(1−i⊗ζ₄)/2 is nontrivial. For d coprime to Δ its intersection field is ℚ and order-one target is a domain. | Sufficient disjointness cannot be deleted. |
| §2.11 abelian scalar map | K=ℚ(ζ₅),p=2: φ₂ζ=ζ², so inverse at order 2 is ζ³ and φ₂ζ³=ζ. Using ζ² instead gives ζ⁴. | Inverse Artin exponent fixed. |
| §2.11 scalar equivalence and constants | For ℚ all φ_m=id, so tensor map is the usual coefficient map. For ℚ(i), constant i fails at 3 but its twisted image glues. Rational constants a have φ_p(a)=a for every p. | Twisted R-algebra structure only in the stated abelian case. |
| §3.1 corrected section definition | ξ=0,f=1 gives shape (1,0,…) and defect 0. f=(1+x)^(1/p) has defect 0 but first coefficient 1/p, outside the integral shape. | Two independent conditions retained. |
| §3.1 polar defect | Taking scalar Frobenius=id,m=1,D=p² gives polar coefficient (p²−p⁴)/p=p(1−p²), nonzero; at D=0 it is 0. | Allowed simple pole p/x cannot be replaced by px. |
| §3.1 local span/module | Multiplying a generator s by p gives leading coefficient p, nonunit; 0·s=0 is a module element. Neither is an invertible section. | Span includes non-generators. |
| §3.1 rational-linear negative control | p=5,m=1,f=1+x/5: x² coefficient of log defect is 10/5−25/50+5/50=8/5. | Fails defect as well as integral first jet. |
| §3.2 Dwork criterion | f=1 gives quotient 1 and integral linear term 0. f=(1+x)^(1/p) gives quotient 1 with linear term 1/p. | Reverse implication needs first-jet premise. |
| §3.2 exponential corollary | p=5,g=0 gives exp g=1. At p=2,g=2, terms 2ⁿ/n! have valuation s₂(n), equal to 1 at n=2ʳ, so do not tend to 0. | p>2 and small-constant hypotheses are real convergence restrictions. |
| §3.3 depleted series definition | s=0 yields t/(1−t)−tᵖ/(1−tᵖ); coefficients at t,tᵖ are 1,0. For s=2 the same coefficients are 1,0. | Correct depletion factor p^(−s). |
| §3.3 Pochhammer defect | Coefficient of t is p/(1−q)=−p/x. At p=5,ζ³=1,ζ≠1, depleted value mod 5 is 1+2ζ≠0 in 𝔽₂₅. | Negative residue preserved throughout Layer 3. |
| §3.3 specialization domain | At ζ=1, 1−ζ=0 is not invertible. A primitive p-th root is ramified and not a nontrivial prime-to-p root in an unramified factor. | No singular root specialization. |
| §3.4 regularized local factor | Empty presentation gives U=1. Pole from Pochhammer is −pLi₂^(p)/(m²h), regularizer contributes +pLi₂^(p)/(m²h), sum 0. | Actual Laurent cancellation, not an analytic infinite product at a root. |
| §3.4 half shift and presentation | B₁(1/2)=0, B₂(1/2)=−1/12; at even m the formal half power has constant 1 while an ordinary q-power can have constant −1. A valid zero relation must give a local unit ratio, not necessarily equal sections. | Relation compatibility remains a theorem on supplied presentations. |
| §3.5 rational H definition | H(−1,1)=1/48,H(2,1)=1/12,H(−1,2)=1/96,H(−1,−1)=−1/48. At r=0,z=1 or characteristic 2,3 total field division gives 0. | Total function and asymptotic domain remain distinct. |
| §3.5 H scaling/field maps | H(−1,2)=H(−1,1)/2=1/96. Mapping rational coefficients into characteristic 5 gives H(−1,1)=1/48=2 mod 5. | Scaling needs nonzero scalar, and characteristic denominators retain their stated guards. |
| §3.5 normalized first jet | k=2 term gives (−1/12)Li₀(ζ)/2=−ζ/(24(1−ζ)); multiplying dh/dx=ζ_m⁻¹ gives H(ζ,ζ_m). At ζ=−1,m=1 this is 1/48. | Correct coordinate factor and sign. |
| §3.5 integral first jet | At p=5 all of 24,ζ_m,1−ζ are units for allowed tame roots, so integral coefficients stay integral. At p=2,3 the denominator 24 is nonunit; scaling by 1/p may lose integrality. | General unramified p>3 scope retained. |
| §3.6 local rank-one theorem | ξ=0,s=1 gives the scalar ring. Replacing s by unit 2s at p=5 rescales coordinates by 1/2; replacing by ps is not a unit rescaling. | Conditional construction plus Dwork proves freeness; zero need not generate. |
| §3.6 quotient/tensor laws | s/s=1; (2s)/s=2 is a local unit at p=5. Degree ξ plus degree −ξ gives scalar degree 0. | Equal-degree torsors and poles cancel; no global freeness inferred. |
| §3.7 phase cocycle | At p≥5 choose ω=2: ω−ω⁻¹=3/2 is a unit. Mod 3 all units have square 1; mod 2 only unit is 1. Zero cocycle gives β_m=0. | p≥5 phase theorem retains its boundary. |
| §3.7 all-order scalar extension | ξ=0,ℚ(i),p=3, seed i gives (i,−i,i) at orders 1,3,9; each step is φ⁻¹rex. | Scalar check, without asserting nonzero-degree phase theorem at 3. |
| §3.7 linear extension and independence | At p=5, generator 2s gives E(a/2)·2ŝ=E(a)ŝ. E(0)=0 and E((a+b)s)=(E(a)+E(b))ŝ. | No inversion of a nonunit series. |
| §3.8 global linear equalizer | Sign family f₂=−1, others 1 passes prime-to-p local tests but edge 2→10 reads −1=1, false. Zero and constant 1 pass every linear equation. | Full-order compatibility, not just local membership. |
| §3.8 derived nonlinear products | Same sign family has every required nonlinear product 1; adding 1 gives components 0,2, with γ=1 products 0,4, failing the edge. In degree 0,f=1−q,γ=2 gives (1−q²)²(1−q⁻¹). | Necessary consequence only, not an additive definition. |
| §3.9 zero-degree identification | E_(p,0)=φ⁻¹rex gives f_pm=φ⁻¹rex f_m iff rex f_m=φ f_pm. The sign family fails both directions at 2→10. | Exact same ring equations. |
| §3.9 graded multiplication | At degrees 0,0 it is ordinary multiplication: 0·f=0,1·f=f,e(1−e)=0. Degrees ξ,−ξ sum to 0. | Bilinear graded algebra need not have unit-valued section products. |
| §3.10 effective descent | In degree 0, chart equalizer is H_R. A module supported only on idempotent e has rank 1 on e, rank 0 on 1−e; it fails global rank one. | Conditional finite-presentation/projectivity target remains essential. |
| §3.10 detection and finite generation | Take local lattices p⁻¹ℤ_p for every prime p. Their rational intersection contains 1/2,1/3,1/5,… and consists of rationals with squarefree denominator; it has no finite generating set over ℤ although every lattice has local rank 1. | Tests do not assert a generic intersection theorem; actual chart conservativity is still required. |
| §3.11 tensor equivalence | M₀⊗M_ξ→M_ξ sends 1⊗s to s. A finite witness Σf_i g_i=1 gives the inverse image of 1; one pair fg=1 would impose a stronger generator assertion. | Conditional effective descent, not just graded multiplication. |
| §3.11 Picard character | [M₀]=0; [M_ξ]+[M_(−ξ)]=0; 0th tensor power is H_R. A unit rescaling 2s at p=5 changes no line class. | Object-level tensor maps retained in addition to class identities. |
| §3.12 power substitution | γ=2 at m=1 sends 1−q to −2x−x²; at m=3 to 1−ζ₃²−2ζ₃x−x². At m=2 it lowers root order to 1. | Full coefficient/order map, not an automorphism everywhere. |
| §3.12 involution | (ζ+x)⁻¹=ζ⁻¹−ζ⁻²x+…; at ζ=1, τx=−x/(1+x), and applying τ twice gives x. γ=0 would require evaluation at an unrelated center. | Involution degree −ξ and nonzero γ only. |
| §3.12 localized power consequence | ξ=0,f=1−q,γ=2 gives (1−q²)² over R[1/2] away from 2. At m=2 that component is absent. | No hypothetical divided K₃ degree. |
| §3.13 pairing/proportionality | g=0 gives a=b=0 and af=bg=0. f=g gives a=b=gτg. Orthogonal scalar idempotents can give b=0 without either section being a unit. | Multiplicative identity without division. |
| §3.14 vanishing propagation | Linear transition takes component 0 to 0. A component indicator may be 0 on prime-to-Δ orders and 1 on an inverted-prime component. Series x has constant 0 but is not the zero series. | No propagation across inverted primes or from constants alone. |
| §3.14 integral constant map | ξ=0 gives usual integral evaluation; ε with no m-th root in K(ζ_m) evaluates in the root line instead. Zero section evaluates to 0 and sums evaluate additively. | Conditional integral root-line lattice, not a scalar field assertion. |
| §3.15 freeness and multiplication | In integral H_ℤ, (1−q)f=1 would evaluate 0=1 at q=1. Multiplication by zero gives zero map; multiplication by 1 is identity. | Nonzero sections need not generate, even in degree zero. |
| §3.16 field pullback | Identity embedding gives identity; ℚ→ℚ(i) at 5 gives a↦(a,a). Two successive maps fix abstract ζ_m and compose on the coefficient factor. | Both split factors retained. |
| §3.16 scalar equivalence | At ξ=0, H_S⊗_(H_R)H_R→H_S sends s⊗r to sr and 1⊗1 to 1. S⊗_R M cannot be formed from a nonexistent general R-action on H_R. | Actual tensor base and conservative comparison required. |
| §3.17 coefficient Galois action | On ℚ(i), conjugation takes i→−i and fixes abstract ζ₄; applying twice gives identity. τ instead changes ζ₄ to ζ₄⁻¹ and the q-variable. | Coefficient action and involution distinct; target degree σ_*ξ retained. |
| §3.18 whole-series determinant norm | Split quadratic sample (1+2x,1+3x) has norm 1+5x+6x² and trace first coefficient 5; coefficientwise norms would miss the cross term 6. Base scalar 3 has norm 9, trace 6. | Full finite-free rank and series used. |
| §3.18 log-norm/trace and degree | For split u=(1+ax,1+bx), linear log coefficient is a+b on both sides. At ξ=0 polar terms are 0; for a base degree ξ, restriction then transfer has degree [E:F]ξ. | Transfer-to-trace law from PadicHodgeRegulators §5.7, coherent Chern norm still required. |
| §3.19 multiplicative transfer | E=F gives norm identity. For quadratic extension Norm(1+1)=4 versus Norm(1)+Norm(1)=2. Norm(0)=0 and Norm(1)=1; tower base scalars yield (aᵈ)ᵉ=a^(de). | Conditional descent/functoriality; not an additive module map. |

The finite-field checks exhaust all admissible nonzero triples for (n,ℓ)=(1,11),(2,11),(3,19),(4,17),(5,31),(6,37),(7,43),(9,73), then the two small-characteristic extensions above. Counts are respectively 72,32,108,128,500,864,1372,4374,108,480, totaling 8,038. KMS and shift both have zero failures. The quasi-periodicity count is 1,723, and all sixteen exact cyclotomic phase remainders are zero. These computations do not replace the analytic uniformity, integral descent or arithmetic compatibility proofs.

# Maintainer consequences

- The remaining supplier action is the exceptional positive old-Bloch/K₃ comparison and compatible reduction square in K3BlochGroups at 𝔽₂. It is recorded by the same gap slug in README and plan; the existing B_old(𝔽₂) computation is imported, not requested again. Review a F06 cannot be fully settled by this package alone.
- No source, dependency-order or supplier file was edited. PadicHodgeRegulators's own completed-Bloch supplier contract remains its responsibility; this roadmap consumes its exported normalized regulator with that stated contract.
- No Lean declaration name or signature changed. The prose-only picardEigenObstruction_vanishes target is retired in favor of ArithmeticKTheory §6.13; unramifiedFrobenius remains the name of the specialized supplied Frobenius, not a second construction. The intersection target is now in §2.7.
- No commits, pushes, pull-request edits or messages to other authors were made. An independent follow-up review remains necessary; this report's computations are not acceptance.
