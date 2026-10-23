<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/135#issuecomment-6372725496 -->
Red team round 2 pass a (codex) of b3316c7

Verdict: needs_changes

1. **F01** (P2) The new group-theoretic headlines are absent from the acceptance test

   **Location:** `packages/EllipticCurveModularityWild3Adic/README.md:519`: “For any field `K` … every continuous cocycle … has the form `c(g) = B⁻¹g(B)`”; `packages/EllipticCurveModularityWild3Adic/Suggested.lean:10`.

   **Claim:** The six retained theorems exhaust the headlines statable at the pins; the remaining headlines need unavailable carriers.

   **Witness:** Native GL, SL, PSL, PGL, separable closures and Krull topology exist. Explicit cocycle and projectivization equations require no new cohomology or modular-curve carrier. Neither matrix Hilbert 90 nor the unique icosahedral lift is stated.

   **Exact repair text:** “Add `matrixHilbert90` and `specialLinearHilbert90` as §1.15 headline signatures: for any field `K`, its discrete separable closure `Kˢ`, and `n ≥ 1`, a continuous matrix cocycle for the coefficient action is `g ↦ B⁻¹g(B)`; in the second theorem both the cocycle and `B` take values in `SLₙ(Kˢ)`.” Use native matrix groups and explicit cocycle equations, with only a real-bodied coefficient-action definition if needed. Also state the adjacent unique-lift theorem for a faithful `a : PSL₂(𝔽₅) → PGL₂(K̄)` over characteristic zero, with projectivization equation, faithfulness, `−I↦−I`, and the stated equivariance hypothesis/conclusion. This is the same projective-action datum used in the README, not an abstract replacement predicate. Register the names in §1.15 and update the module docstring. On `K=ℝ`, `n=2`, `B=diag(i,−i)`, both sides at conjugation are `−I` and `det B=1`; at `n=1` the special-linear assertion has the single value `1`.

2. **F02** (P1) Comparison maps are applied to mixed-characteristic self-extensions

   **Location:** `packages/EllipticCurveModularityWild3Adic/README.md:862`: “vanishes on all of `Ext¹_{S₋₁}(ρ̄, ρ̄)`”; also §§3.6, 4.4–4.5 and 5.7; §2.5 defines `S` using all 3-power exponents.

   **Claim:** Every Yoneda self-extension in the stated category is an adjoint cohomology class to which the maps of §2.8 apply.

   **Witness:** The §5.6 Check at line 1088 supplies `E[9]`: `0→E[3]→E[9]→E[3]→0` lies in the filtered category, but `3E[9]≠0`. A cocycle extension over `𝔽₃` is killed by 3. BCDT line 1601 restricts the middle object accordingly.

   **Exact repair text:** “For every deformation category `S`, put `S[3] = {M ∈ S : 3M = 0}`, with exact sequences inherited from `𝔽₃[G₃]`-modules. All occurrences of self-extension groups in the comparison-map and tangent statements mean `Ext¹_{S[3]}(ρ̄,ρ̄)`, not `Ext¹_S`.” Replace the affected subscripts, including the supplier summary at line 21, and qualify the two ‘all self-extensions’ claims in §5.7 by ‘killed by 3’. Keep the integral categories and higher torsion levels unchanged. This agrees with `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:4068` (§8.6). The `E[9]` example stays in `S` but is excluded from `S[3]`; the dual-number deformations of §5.9 remain included.

3. **F03** (P2) The general BCDT lifting theorems already have an earlier owner

   **Location:** `packages/EllipticCurveModularityWild3Adic/README.md:1230`: “The same holds for an extended `ℓ`-type”; scope line 15 claims ownership of §6.5.

   **Claim:** This package owns and reproves the two general BCDT modularity lifting theorems.

   **Witness:** `TauCetiRoadmap/GL2ModularityLifting/README.md:1457` and `:1474`, §§5.14–5.15, state the same type and extended-type theorems, with the same local scalar-centralizer and quadratic-restriction hypotheses. §§5.12–5.13 own their corrected BCDT proof.

   **Exact repair text:** “§6.5 is supplied by GL2ModularityLifting §§5.14–5.15. We apply those theorems with the types and local weak-acceptability results constructed here.” Replace §6.5's owned theorem/proof plan by that import, add the exact supplier sections to the contracts, and make §6.8 consume them. Remove §6.5 from the list of owned constructions. The test at `ℓ=3` still requires absolute irreducibility over `ℚ(√−3)` and at `ℓ=5` over `ℚ(√5)`; no hypothesis is lost. This supplier precedes the package in the supplied order.

4. **F04** (P2) Cubic Breuil base change is still written over the characteristic-zero ring

   **Location:** `packages/EllipticCurveModularityWild3Adic/README.md:798`: “extend uniquely to `M_c ⊗ 𝒪_{F′}`”; line 773 gives only `S₉ = 𝔽₃[u]/(u⁹)` as scalars.

   **Claim:** The displayed tensor product is the Breuil module on which the cubic descent operators act.

   **Witness:** For `δ=−1`, the residue field is `𝔽₉`, and `H_{γ₃}` contains `j`. There is no unital map `𝔽₃→𝒪_{F′}`. Tensoring over `ℤ` instead gives scalars `𝒪_{F′}/3`, not `𝔽₉[u]/(u⁹)`.

   **Exact repair text:** “The normal forms in Layer W3.3 are the descended modules `M` over `S₉`. Put `k′=𝔽₃` for `δ=1` and `k′=𝔽₉` for `δ=−1`; over `F′` use `M′=k′⊗_{𝔽₃}M`, with scalars `k′[u]/(u⁹)`. All descent operators act on `M′`.” Replace `M_c ⊗ 𝒪_{F′}` in §3.2 by `k′⊗_{𝔽₃}M_c`; reserve base change by `𝒪_{F′}` for group schemes. At `δ=−1`, `γ₂(je)=−je` now lies in the stated carrier; at `δ=1` the tensor product is just `M_c`.

5. **F05** (P2) The zero extension falls outside the stated peu-ramifié convention

   **Location:** `packages/EllipticCurveModularityWild3Adic/README.md:1028`: “For every parameter value, including zero … is peu ramifié iff `c₁ = 0`”; compare the nonsplit restriction at lines 43 and 255, and §§3.2–3.4.

   **Claim:** The zero member of each extension family is peu ramifié, although the roadmap defines that term only for nonsplit extensions.

   **Witness:** Set `(c,c₁)=(0,0)`, or `(c,c′)=(0,0)`. The generic extension splits, outside the declared nonsplit domain of the peu predicate; the displayed vanishing condition is true. The split-module Checks at lines 806 and 1018 confirm the same instance.

   **Exact repair text:** “For an extension `0→ω→V→1→0`, peu ramifié means that its Kummer class belongs to the unit line, including the zero class. Très ramifié means that its class is outside that line; such an extension is necessarily nonsplit. Apply the same convention after twisting by `ω`.” Use this definition consistently in Conventions and §1.1(2), removing the nonsplit restriction from the peu predicate. Then the zero class has `(peu,très)=(true,false)`, `[4]` has `(true,false)`, and `[3]` has `(false,true)`, and all the parameter equivalences agree. BCDT line 3727 uses the unit-line convention.

6. **F06** (P3) Weak acceptability is attributed to a supplier section that does not define it

   **Location:** `packages/EllipticCurveModularityWild3Adic/README.md:81`: “§3.12 … weak acceptability”; line 96 says this is “used as stated there”.

   **Claim:** LocalGaloisDeformationRings §3.12 supplies BCDT weak acceptability in addition to its type quotients.

   **Witness:** `TauCetiRoadmap/LocalGaloisDeformationRings/README.md`, §3.12, constructs intersections of characteristic-zero point kernels and compares weak and actual potentially Barsotti–Tate type. It contains no one-variable power-series-quotient definition. This package already gives that definition at README:48.

   **Exact repair text:** “LocalGaloisDeformationRings §3.12 supplies the type and extended-type quotients. Weak acceptability is the predicate defined in our Conventions: the corresponding quotient is zero or a quotient of `𝒪[[X]]` (BCDT §1.1, pp. 850–851).” Correct both supplier descriptions. No new gap is needed. The zero quotient and `𝒪[[X]]/(X)` satisfy the definition; `𝒪[[X,Y]]` has relative tangent dimension two and does not.

7. **F07** (P3) Two category definitions lack three discriminating Checks

   **Location:** `packages/EllipticCurveModularityWild3Adic/README.md:685–691` and `:704–708`: “the zero model satisfies the condition”; “the zero module is annihilated by `I_i`”.

   **Claim:** The Checks distinguish the operator-ideal definitions of §§2.6–2.7.

   **Witness:** Every operator ideal annihilates zero, including the unit ideal defining the zero-only category. In §2.7 the last Check repeats semilinearity from the defining ring. Thus §2.6 has only two discriminating tests, and §2.7 only one.

   **Exact repair text:** “Use `D=𝔽₉²`, `γ₂(x,y)=(x³,y³)`, `γ₄(x,y)=(jx,−jy)`. With `γ₃=1` and `F=V=0`, this nonzero module satisfies both ideals: all generators act by zero. This excludes the zero-only category.” Replace the zero-object Check by this positive operator-level Check in both sections. For §2.7 also add: “With `γ₃(x,y)=(x+y,y)`, set `F(x,y)=(−y³,0)` and `V=−F`. Then `FV=VF=0=3`, `F= (γ₃−γ₃⁻¹)γ₂`, and `F(0,1)=(−1,0)≠0`; replacing the right side by its negative fails.” These are actual Dieudonné modules with the required descent-group relations. Label these as operator-module tests, without asserting a particular integral finite-flat lift. Keep the existing negative test in §2.7; the three tests now distinguish the omitted generator, the unit ideal, and the wrong sign. The nonzero-F repair was evaluated on all 81 vectors: every group relation, commutation relation and ideal generator has the required value; at `(0,1)` the correct and wrong-sign values are `(2,0)` and `(1,0)` in `𝔽₃²`.

## Verification of the previous findings

The identifiers below belong to the previous reports, not to new findings. All 22 findings were accepted for repair; none was marked not actionable. Quotes are from the current package. The removed examples are assessed under the present acceptance-test contract, which requires deletion of padding.

| Earlier finding | Status | Repaired passage or deletion, and witness at this head |
|---|---|---|
| r1a F01, admitted examples | Repaired | `Suggested.lean` has no `example`; all six admitted declarations are substantive field or cube-class theorems. |
| r1a F02, obsolete pins | Repaired | README:54,63 gives Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; these equal the supplied manifest revisions. |
| r1a F03, absent source manifest | Repaired | `sources.toml` contains ten source records, including the settled BBM and Serre records. |
| r1a F04, infinite unramified extension inside a finite field | Repaired | README:449,464: “`K^{nr} = K ℚ₃^{nr}`”; line 483 puts the cubic subfield inside this compositum. A finite `K` still has finite residue degree; `K^{nr}` has unbounded residue degree. |
| r1a F05, single integer weight | Repaired | README:140 uses “allowed Serre weights”; the unit Kummer class admits nominal weights 2 and 4 at 3. It no longer equates both to one least integer. |
| r1a F06, noncommutative finite groups | Repaired | README:45: “Every finite flat group scheme in this roadmap is commutative.” The order-27 exponent-3 group `UT₃(𝔽₃)` has commutator `1+E₁₃≠1`, so is excluded. |
| r1a F07, missing matrix-Hilbert-90 and equivariant-lift prerequisites | Repaired | README:519 and 521 now state “Matrix Hilbert 90” and “The equivariant icosahedral lift” with hypotheses and proof inputs. The first has the additional acceptance-test defect S01. |
| r1a F08, incorrect unramified-character kernel | Repaired | README:263: “kernel `3^{3ℤ}ℤ₃^×`”; its valuation character sends `3↦1`, `4↦0`, `27↦0`, so the extra nonunit kernel elements are present. |
| r1a F09, narrow cross-prime comparison | Repaired | README:487: “`A/F` an abelian variety with potentially good reduction”; a number-field action is retained. CDT line 2125 supplies this generality; the elliptic case is explicitly a specialization. |
| r1a F10, missing cube basis | Repaired | `Suggested.lean:35` states `y = 3 ^ ab.1.val * 4 ^ ab.2.val * x ^ 3`; inputs 3,4,12 give coordinates `(1,0),(0,1),(1,1)`. |
| r1a F11, degree-twelve residue coefficients | Repaired | README:902,998: “`M′ = 𝔽₉ ⊗_{𝔽₃} M` over `S′₃₆`”; now `γ₂(je)=−je` and `γ₄(e)=je` are operations on the specified carrier. The cubic counterpart is S04. |
| r1a F12, zero-map comparison checks | Repaired | README:724: “entry-formula checks, not assertions that arbitrary constant matrices are cocycles”; `E₂₁↦(1,0,0)` and `diag(1,−1)↦(0,−1,1)` exclude three zero entry maps. |
| r1a F13, missing mirrors of README checks | Repaired by deletion | The arithmetic and truncation checks remain at README:296,387,655,1019,1121–1123; no admitted Lean examples remain. `T=0` in `A₁`, whereas `T≠0` in `A₂`, so the prose retains the discriminating cases without acceptance-test padding. |
| r1a F14, filtration check lacking a negative control | Repaired | README:1023 tests membership and nonmembership. In the `(6,6),c=1,c′=0` module, `(1,u⁶)` belongs to the filtration and `(0,1)` does not; replacing the cross term by `u²` loses the former vector. |
| r1a F15, API catalogue instead of headlines | Repaired | `Suggested.lean` is 85 lines, with five real-bodied definitions/abbreviations and six headline theorems; the former 561-line catalogue is absent. |
| r1a F16, unregistered Lean names | Repaired | README:40 registers “`Q3` and `Q3bar`”; all eleven retained declaration names occur in the README. Deleted auxiliary names impose no remaining signature obligation. |
| r1a F17, nonseparating simple-admittance control | Repaired | README:150 uses the peu-ramifié twist: both `σ₀,₁` and `σ₂,₁` admit it, whereas the très case selects only `σ₂,₁` with multiplicity one. |
| r1a F18, replanning instead of extension | Repaired | README:1,7 identifies this as “Part II” and says where EllipticCurveModularity stops. The base owns the final predicate and normalization. S03 concerns a separate duplicated supplier theorem. |
| r1b F01, invalid Lean imports/API uses | Repaired on supplied elaboration evidence | `Suggested.lean:1` is `import Mathlib`; the nonexistent imported module and offending auxiliary API uses are absent. The supplied eleven elaborated signatures match the current file. No independent Lean run was made. |
| r1b F02, norm congruence independent of B | Repaired | README:508 retains `1−2(B+3)/3`. For `B=−12,6`, the resulting factors modulo 9 are respectively `7−3s,4−3s`; the old `1−3s` works at `B=−3` only. |
| r1b F03, invented source misprint | Repaired | README:630 cites “Lemma 5.5.1” and “Theorem 5.6.1”; the allegation about a nonexistent theorem label is removed. BCDT line 2689 actually says Lemma 5.2.1. |
| r1b F04, elementary twelfth-power identity as a headline | Repaired | The identity remains at README:375,383; no corresponding Lean declaration remains. At `i=0,1,2`, its right side is `−3,−768,−7203`. |

## Lean declaration and context ledger

All names below have prefix `TauCetiRoadmap.EllipticCurveModularityWild3Adic`. There are no standing section variables, `include` commands, or hidden hypotheses to retain. The five definitions use native field/algebra instances on `Padic 3` and its algebraic closure. The six theorems have only the explicit binders listed below. The worker-supplied elaborated signatures were compared declaration by declaration with the current README; no lost binder was found. Read-only review forbids an independent elaboration run.

| Declaration, line; README section | Explicit context | Computed instance, both sides or defining value | Result/change |
|---|---|---|---|
| `Q3`,27; conventions | None; `abbrev := ℚ_[3]` | `3≠0`, characteristic `0`; residue characteristic `3`, not `0` | Native carrier; no change. |
| `Q3bar`,30; conventions | None; algebraic closure of `Q3` | `j²=−1` has a root here; `−1=2` is not a square in `𝔽₃` | Native carrier; no change. |
| `cubeClass_coordinates`,35; §1.1 | `y : Q3`, `hy : y≠0` | `3,4,12,27,64,1/3` have coordinates `(1,0),(0,1),(1,1),(0,0),(0,0),(2,0)`; `0` would admit all nine pairs | Uniqueness is of the pair, not the cube root; nonzero hypothesis essential. |
| `cyclicCubicField`,41; §1.3 | `π : Q3bar` | Adjoining `0` gives the bottom field, rank `1`; at an Eisenstein root rank `3` | The definition deliberately permits arbitrary generators; theorem restricts them. |
| `nonabelianCubicSplittingField`,44; §1.4 | `π,j : Q3bar` | At `(0,0)` rank `1`; for the stated roots rank `6=3·2` | Real body, no hidden root assumptions. |
| `degreeTwelveSplittingField`,48; §§1.5–1.7 | `s,j,α,β : Q3bar` | At all zero rank `1`; with `s=±β²`, adjoining `s` adds degree `1`, not another factor `2` | Real body, appropriate common carrier. |
| `cyclicCubic_galois`,52; §1.3 | `π`, `π³−3π²+3=0` | Discriminant `81=9²`; conjugates `π²−2π`, `3+π−π²`; substitution remainder `0`, third iterate `π` | Degree `3`, Galois, generator order `3`; no padding. |
| `nonabelianCubic_finrank`,60; §1.4 | `π,j`, cubic `π³−3π²+6=0`, `j²=−1` | Discriminant `−324=−18²`; `−1` nonsquare over `ℚ₃`; ranks `3,6`, Galois predicate on root field false | All three conclusions have their required hypotheses. |
| `positiveQuadratic_finrank`,68; §1.5 | `s,j,α,β`, all four displayed root equations | `v₃(α)=1/3`, `v₃(β)=1/4`; uniformizer valuation `1/12`; rank `12·2=24` | Characteristic zero excludes denominator and inseparability problems. |
| `negativeQuadratic_finrank`,74; §1.6 | Same four binders; `s²=−3`, `α³=4`, `β²=−s`, `j²=−1` | `v₃(α−1)=1/3`, `v₃(α)=0`; shifted uniformizer valuation `1/12`, unshifted `−1/4`; rank `24` | Correct shifted generator; no change. |
| `extendedTypeField_finrank`,80; §1.7 | `i : Fin 3`, four generators and root equations | `i=0,1,2`: `α³=3,12,21`; valuation `1/3` each, rank `24` each | `Fin 3` admits no out-of-range value; no missing index hypothesis. |

## README adversarial instance ledger

There are 85 bold target blocks, counted separately when a section has multiple blocks. Each has a row below. These are computations and hypothesis tests, not substitutes for proofs of the general theorems. A numerical consequence of a deep assertion is distinguished from a proof of that assertion. `S₉=𝔽₃[u]/u⁹`, `S₃₆=𝔽₃[u]/u³⁶`. The field, matrix and Weierstrass calculations were recomputed; no Lean build was run.

| Target (README line) | Instances and computed values | Result/change |
|---|---|---|
| 0.1 definition (104) | At `ℓ=3`, scalar-type Steinberg has dimension `3`; tame principal-series induction has dimension `4`; `U₀(9)` has index `12` in `GL₂(ℤ₃)`. | The three choices of compact carrier are distinct. |
| 0.1 theorem (111) | At trivial inertial type, an unramified infinite-dimensional principal series contains the inflated finite Steinberg once: `dim Hom=1`; a one-dimensional unramified character has `dim Hom=0`. | Infinite-dimensional hypothesis excludes the latter counterexample. |
| 0.2 definition/classification (128) | `ℓ=3`: dimensions `1,2,3` for `n=0,1,2`; two determinant twists. Très `(1,ω)` selects `(2,1)`, peu twist selects `(0,1),(2,1)`. Quotient Frobenius `+1` selects extended scalar `a=−1`, not `+1`. | Complete ranges, multiplicity and Frobenius sign are material; split boundary needs S05's convention. |
| 0.3 definition (154) | `τ₁(4)=ζ≠1`; inducing `τ₋₁` has values `1` on `4`, `ζ` on `1+3j`; `ζ²` gives conjugate rather than trivial type. | Distinguishes the cubic types and the trivial representation. |
| 0.4 definition (171) | Both inducing characters send `−1↦−1`, `1+s↦ζ`; for negative `s²=−3`, `1+3s↦1`. Orders are `6`, not `3`. | Central sign excludes the cubic characters. |
| 0.5 definition (188) | `i=0,1,2` gives `1,ζ,ζ²` at `1+s`; `(ζ−ζ⁻¹)²=−3`. Negating the uniformizer value preserves inertia and reverses its sign. | Infinite Weil image and finite inertia image correctly separated. |
| 0.6 theorem (207) | Très `(1,ω)` admits the single constituent `σ₂,₁` with multiplicity `1`; peu twist admits `σ₀,₁` as well, giving `2` constituents. | Très hypothesis discriminates simple admittance. |
| 0.7 theorem (218) | Reduction has characters `(0,0),(1,1)`, each once; très `(ω,1)` selects `(0,0)`. | Equal multiplicities alone do not establish admission; the stated character test does. |
| 0.8 theorem (229) | Four scalar constituents have `(m,a)=(0,1),(1,1),(0,−1),(1,−1)`; quotient Frobenius `1` selects `(0,−1)` once. | Testing only `a²=1` would leave two signs; full `G₃` hypothesis is necessary. |
| 1.1 theorem (255) | `[1]=(0,0)`, `[3]=(1,0)`, `[4]=(0,1)`, `[12]=(1,1)`; unit cubes modulo 9 are `1,8`. Valuation character gives `χ(3)=1`, `χ(4)=χ(27)=0`; annihilator pairing with `[3]` is nonzero. Pure cubic extension kills `[3]`, has degree `3`, contains no quadratic field and is not Galois. | Basis, kernel and Galois restriction hypothesis pass; S05 clarifies zero. |
| 1.2 definition (277) | `E=u³−3(u²−δ)` gives `G(0)=−δ`, `cπ=δ−u⁶`; `δ=1,−1` gives constants `1,−1`. Fixed uniformizer: `H=1,t=f=0`; extended wild generator: `H=1−u⁶`, `t=−1−u⁶ mod u¹²`. | Wild correction cannot be replaced by ordinary commuting descent. |
| 1.3 construction (302) | Cubic discriminant `81`; iterates of `π↦π²−2π` are `π²−2π`, `3+π−π²`, `π`; all roots give polynomial remainder `0`. Adjoining `0` would give degree `1` but polynomial value `3`. | Degree `3`, order `3`, Galois statement and uniformizer hypotheses pass. |
| 1.4 construction (321) | Discriminant `−324`; proposed conjugate has remainder `0` modulo cubic and `j²+1`; conjugation on `j` reverses the order-three generator. Root field degree `3`; splitting field `6`. | Nonabelian `S₃`, not cyclic `C₆`; coefficients require `𝔽₉`. |
| 1.5 construction (340) | `v₃(α/β)=1/3−1/4=1/12`; `e·f=12·2=24`; `γ₄²β=−β`, `γ₄⁴β=β`. `q²=−5≡1 mod3`, permitting the chosen unit square root. | The source's order-three square is correctly repaired. |
| 1.6 construction (359) | `v₃(α)=0`, `v₃(α−1)=1/3`; shifted quotient valuation `1/12`, unshifted quotient `−1/4`; norm of shifted quotient `3⁴/s⁶=−3`. | Shift and norm sign pass. |
| 1.7 construction (375) | At `i=0,1,2`, `α³=3,12,21` and `π¹²=−3,−768,−7203`; `cπ=1` in all three residue rings, `H(0)=1`, `t(0)=−1`. | No total-division junk; `β≠0` follows from `β⁴=−3`. |
| 1.8 theorem (396) | `|GL₂(𝔽₃)|=48`, `|SL₂(𝔽₃)|=24`, Borel order `12`; nonsplit Cartan normalizer at 5 has order `48`, determinant-one part `12`. For `β=ζ−ζ⁻¹`, `β²=−3=2`, norm `3`. | Tests both primes, cyclic Cartan and nonabelian normalizer; trivial normal 3-subgroup is excluded. |
| 1.9 definition (410) | Tame inertia has wild order `1`; cubic cases wild order `3`; quadratic cases total inertia order `12`; case 6 also has order `12` but conductor exponent `5`, versus `3` in cases 4–5. | Inertia order alone cannot merge the last three tags; extended sign remains needed. |
| 1.10 theorem (438) | Prime-to-3 image falls into case 1; nontrivial normal 3-subgroup forces the order-48 normalizer; its order-12 determinant-one subgroup gives the wild branches. | The exhaustion uses normality and cyclotomic determinant, not an irreducibility assumption. |
| 1.11 theorem (449) | `b=4,13,22` gives the three stated residue classes modulo 27; finite splitting field has finite residue degree, while its unramified compositum has arbitrarily large residue degrees. Très Kummer lines represented by `[3],[6],[12]` are three distinct nonunit lines. | Correct finite/infinite distinction; nonabelian case permits all three très classes. |
| 1.12 theorem (464) | `y²=x³+3x+2`: `Δ=−3456=3·(24)²·(−2)`, square class `3` over `ℚ₃` since `−2≡1 mod3`. `y²=x³+3x+6`: `Δ=−17280`, square class `−3` since quotient by `−3` is `5760=24²·10`, `10≡1 mod3`. | Quadratic field signs and the `1+4` representation count pass. |
| 1.13 general comparison (487) | Dimension-zero abelian variety: all realizations zero, characteristic polynomial `1`; elliptic good reduction: both realizations have degree `2`. For `y²=x³−x` at 3, polynomial `X²+3` on both sides. | Rank zero is harmless; general number-field action is explicit. |
| 1.13 elliptic specialization (489) | At the same good-reduction curve inertia is trivial on both prime-to-3 Tate and WD realizations; trace `0`, determinant `3`. Potential multiplicative reduction has `N≠0`, unlike the required potentially good case. | The bad-reduction exclusion is material. |
| 1.14 theorem (506) | Reduced `y²=x³−x−1` has `1` point over `𝔽₃`, trace `3`; opposite sign gives `−3`, distinct modulo 5. Norm factors for `B=−3,−12,6` are `1−3s,7−3s,4−3s mod9`. | Corrected norm congruence preserves the positive Frobenius sign. |
| 1.15 matrix Hilbert 90 (519) | Over `ℝ`, `B=diag(i,−i)` has determinant `1` and `B⁻¹B̄=−I`; cocycle product `(-I)²=I`. For `n=1`, `SL₁={1}`; trivial Galois group forces value `I`. | True and statable; S01. |
| 1.15 equivariant lift (521) | `b(−I)=−I` projects to identity; the zero/central-factor lift would kill this order-two element. Negating every value gives `b(1)=−I≠I`. Ratio of two lifts is a character into a group of order `2`, hence trivial on the perfect source. | Equivariance follows from uniqueness; the lift is not merely an unspecified embedding. |
| 1.15 rationality theorem (523) | Untwisted `μ₅×ℤ/5` has determinant `χ₅`; cocycle determinant `χ₅χ₅⁻¹=1`. For trivial cocycle the twist is `ℙ¹`; removing finitely many cusps from infinite `K` leaves infinitely many points. | Characteristic zero implies infinite field; no finite-field point-count overclaim. |
| 1.16 construction (545) | Six displayed curves have discriminants `64,−25920,−5184,−3456,−17280,−50544` and 3-valuations `0,4,4,3,3,5`. Three très lines minus the one splitting over the specified field leaves `2` choices. | The local shapes and exceptional indecomposability are separate conditions; pairing is transported, not assumed in advance. |
| 2.1 definition (581) | Rank-zero triple has image span `0=M`; nonzero `φ₁=0` has span `0≠M` and fails. `N(ue)=ue≠0` even when `N(e)=0`; multiplicative `F=0`, étale `F=1` modulo `u`. | Generation and sign are material; prime 2 excluded. |
| 2.1 theorem (583) | Trivial group has order `1=3⁰` and module rank `0`; `μ₃` has order `3` and rank `1`, special-fibre `F=0`. `UT₃(𝔽₃)` has order `27`, exponent `3`, nontrivial commutator `1+E₁₃`. | Noncommutative negative control is excluded. Contravariance reverses extension arrows. |
| 2.2 definition (603) | At `e=3,(s,r)=(1,2)`, required exponent is `max(0,0)=0`; at `(2,2)` it is `1`, so `f=1` fails and `f=u` qualifies. At `r=0,e`, multiplicative/étale endpoints are different. | Natural subtraction is expressed through max; no silent negative exponent. |
| 2.2 theorem (605) | `r=1→3` has exponent `3(3−1)/2=3`; `1→2` fails parity, reverse `3→1` fails order. Gauge `h=0` changes `f` by `0`; nonzero `h` gives `uˢh−(b/a)uʳh³`. | Unit coefficient hypotheses exclude division by zero; marked extensions, not unmarked isomorphisms, are classified. |
| 2.3 definition (622) | Fixed uniformizer yields `H=1,t=f=0`; wild conductor-243 case gives `H=1−u⁶,t=−1−u⁶`. Thus `H−t=2≠0` modulo `u¹²`. | The correction operators are necessary. |
| 2.3 theorem (624) | Unramified quadratic twist of `μ₃`: `H=1` but `γ̂(e)=−e`; wild rank-one formula at `r=0` gives `e`. | Restriction to wild inertia, not all `Γ`, excludes the counterexample. |
| 2.4 definition (641) | Over `𝔽₉`, `F=0,V(j)=j³=−j` on `D(μ₃)`; `FV=VF=0=3`. Singleton constant model: zero object length `0`, square length `2`; `μ₃` has no such filtration. | Semilinear coefficients and graded-piece restriction both used. |
| 2.4 theorem (643) | Constant generic `ℤ/3` has models of weights `1,3`, so unqualified model uniqueness is false. Under a compatible generic marking any endomorphism inducing identity is identity; changing marking by `−1` changes that condition. | The stated uniqueness hypotheses and marking prevent false uniqueness. |
| 2.5 definition (661) | `0∈Sδ`; split `1⊕ω` has dimension `2` but is not the nonsplit residual object, so has no length-one residual filtration. A Tate lattice modulo 9 has exponent `9`, modulo 3 exponent `3`. | Integral category correctly retains both exponents; tangent extraction must use S02. |
| 2.6 definition (679) | `V=−F` gives `F²=−3`; involution `+1` gives generator `2`, which is invertible; zero module gives both operators `0`. | Sign and involution pass; zero alone is not a discriminating check. |
| 2.7 definition (695) | On the displayed `𝔽₉²` model, first two ideal generators are `0`, third sends `(0,1)↦(−1,0)`. If instead `γ₃=1,F=V=0`, third generator is `0`. Coefficient `j` changes to `−j` under `γ₂`. | Concrete negative and positive operator tests; no falsely linear Frobenius. |
| 2.8 construction (712) | Entry maps: `E₂₁↦(1,0,0)`, `diag(1,−1)↦(0,−1,1)`, `E₁₂↦(0,0,0)`; diagonal sum `0`. A split extension gives three zero cohomology classes. | Entry tests are not asserted cocycles; S02 qualifies category restrictions. |
| 2.9 theorem (731) | In `𝔽₃`, `−1/2=1`, `1/2=−1`; injection sends `(x,y)` to `((y,x),(0,−y))`, a 2-dimensional subspace of the 3-dimensional trace-zero space. Kernel bound `2−1=1`. Peu class `[4]` pairs `0` with unramified valuation character, while `[3]` pairs nonzero. | Exact-sequence dimensions and très hypothesis pass. |
| 2.10 theorem (742) | For a compatible Tate lattice, reductions modulo `3ⁿ`, `n=1,2`, have exponents `3,9` and lie in the integral finite-flat category. Type-point existence implies quotient ring `≠0`. | No killed-by-3 restriction on integral models. |
| 2.11 theorem (753) | `F+V=0` and `FV=3` give `F²=−3`; applying twice to a characteristic-zero isocrystal gives determinant constraint different from `F²=+3`. Involution scalar `−1` makes `[γ₄²]+1=0`. | Correct operator signs and direction of quotient. |
| 3.1 theorem (779) | Weights for constant character `1,3`, for cyclotomic `0,2`; morphism `1→3` is `u³`, reverse absent. Dual weights sum to `e=3`. | Endpoints and direction agree with contravariance. |
| 3.2 theorem (791) | `c=0`: split, `N=0`; `c=1`: `N(eω)=u⁶e₁≠0` in `S₉`; `c=2`: coefficient `−1`. There are `3` parameters. | S04 fixes the scalar extension; S05 fixes use of peu at zero. |
| 3.3 theorem (810) | Auxiliary cyclic group has order `3`, whereas `Aut(𝔽₃)` as a 1-dimensional vector space has order `2`; its action is trivial. At zero class descended fibre is `ℤ/3×μ₃`. | Generic descent, not an integral `ℤ₃` model; nonabelian degree-six case excluded. |
| 3.4 theorem (821) | Nine parameter pairs: `3` have `c=0`, `6` have `c≠0`. `c=1` gives a unit filtration cross term and nonzero special-fibre Frobenius; `(0,0)` is split. | Frobenius criterion passes; S05 for the peu iff. |
| 3.5 theorem (839) | At `(b,b′)=(0,1)` the Artin–Schreier equation `x³−x=1` has no solution in `𝔽₃` but has one in `𝔽₂₇`; first parameter `0` means unramified splitting. `H′(0)=−j`, so `−bH′(0)=bj` for both weights. | Same sign at both weights verified; source's wrong filtration generator is not copied. |
| 3.6 theorem (851) | Filtration containment forces constant coefficient `bc=0`; très parameter `c=1` or `2` implies `b=0`. At `c=0` this implication would fail. | Très hypothesis essential; Ext notation needs S02. |
| 3.7 theorem (862) | Nonabelian comparison gives `(−a+b)H′(0)=bH′(0)`, with `H′(0)=−j≠0`, hence `a=0`. Wrong sign would permit `a=b=1` in `𝔽₃`. | Correct sign; “all Ext” needs S02. |
| 3.8 theorem (873) | Fixed determinant diagonal sum `0`; after the two vanishings, allowed space has dimension at most `2−1=1`. The zero subspace also qualifies. | It asserts `≤1`, not equality. |
| 3.9 theorem (881) | Quotients `𝒪[[X]]/(X)` and `𝒪[[X]]` have relative tangent dimensions `0,1`; zero type ring is permitted. Two-variable power series has tangent dimension `2`. | General local algebra bound used with correct direction; S06 corrects attribution. |
| 4.1 theorem (908) | `r=2,6,10` gives `[γ₄²]=−1`; `r=0,4,8,12` gives `+1`. Constant model `r=12` has `γ₄` scalar `−(−j)⁶=1`. | Involution test selects exactly three weights, not all even weights. |
| 4.2 theorem (920) | Empty filtration gives rank `0`; two allowed rank-one pieces give diagonal involution `diag(−1,−1)`. Eigenvalue `j` exists over `𝔽₉`, not `𝔽₃`. | Correct primed versus descended carrier. |
| 4.3 theorem (932) | Required weights `(rω,r₁)=(2,10)`; special-fibre Frobenius `≠0`. Replacing the unit cross term by a polynomial divisible by `u⁴` gives `F=0`, excluded. | Generic identification is retained in uniqueness. |
| 4.4 theorem (944) | In the rank-three quotient calculation, containment by `u¹²` forces constant extension coefficient `a=0`; then Frobenius modulo `u` is `0`, contradicting the required nonzero Frobenius unless the reversed extension vanishes. | Source argument is at exponent 3; S02 for integral Ext notation. |
| 4.5 theorem (955) | Unramified character `χ(3)=1,χ(4)=0` lies in a 1-dimensional line; restriction to inertia is `0`. A ramified character nonzero on `4` restricts nontrivially. | Correct vanishing after restriction; S02. |
| 4.6 theorem (966) | Ambient Kummer dimension `2`, connecting line dimension `1`; intersection bound `1`, permitting zero. | Correct inequality and corrected source cross-reference. |
| 4.7 theorem (972) | Nonzero quotient example `𝒪[[X]]/(X)` has one fewer tangent generator; existence of a characteristic-zero point rules out the zero quotient. | Weak versus actual acceptability not conflated. |
| 5.1 construction (998) | Cross powers for `(2,6),(6,10),(2,10)` are `u²,u⁶,u⁸`, satisfying minimal powers `0,4,0`; at `(6,6),c′=1`, `N(e′ω)=u³⁰e₁≠0`. `(1,u⁶)` is in the correct filtration; `(0,1)` is not. | Gauge, truncation and coefficient corrections pass. |
| 5.2 theorem (1028) | Nonexceptional split-over-`F_i` line `c=0`, peu line `c₁=0`, intersection `(0,0)`. Exceptional corresponding lines `c+c′=0`, `c=0`; map `(1,0)↦(1,1)`, `(0,1)↦(1,0)`. | Distinct lines; zero-class terminology is S05. |
| 5.3 theorem (1040) | Reversed nonexceptional Ext dimension `0`, exceptional dimension `2` with `9` parameters. At `(c,c′)=(0,1)`, forward and inverse descent both have `−u³⁰`; naive negation changes this to `+u³⁰≠−u³⁰`. | Exceptional family cannot be discarded or identified with the forward family without changing eigenvalues. |
| 5.4 theorem (1051) | At weights `2,10`, image dimension `1`; at weight `6`, dimension `2`. At `c=1`, `N(e′)=−u²⁴e≠0`; `c=0,c′=1` gives unramified nonsplit class. | Full versus unramified self-Ext spaces separated. |
| 5.5 theorem (1062) | `k=𝔽₃`: scalar ring over `F′` is `𝔽₉`; `k=𝔽₉`: `k⊗𝔽₉≅𝔽₉×𝔽₉`, with zero divisors and dimension `4` over `𝔽₃`. | Does not falsely treat the tensor product as a field or impose disjointness. |
| 5.6 definition (1073) | Zero object has filtration length `0`; `G×G` has length `2`; a suitable `E[9]` has two residual quotients but `3E[9]≠0`. | Strong/weak filtration condition retained; this supplies S02's counterexample. |
| 5.7 theorem (1092) | Split self-extension maps to `(0,0,0)`; in fixed determinant, `Θ₁=−Θω` leaves one independent diagonal condition. `E[9]` is not an `𝔽₃` self-extension. | S02; index-dependent assertions checked against BCDT §9.6. |
| 5.8 theorem (1103) | Four pairs times three indices gives `12` inequalities, each `dim≤1`, not twelve independent tangent directions of one ring. | No quantifier swap or exact-dimension overclaim. |
| 5.9 construction (1109) | `A₁`: `T=0`; `A₂`: `T≠0,T²=T³=0`, but coefficient Frobenius sends `T↦T`, not `T³`. Minimal cross exponents are `2,6,8`. | Nonconstancy correctly restricted to `N≥2`; coefficient action is linear. |
| 5.10 theorem (1128) | `𝔽₃[[T]]` has relative tangent dimension `1`, `3=0`; no unital map to a characteristic-zero ring. If `F(D[3])=0` and `F²=−3`, then for `9x=0`, `3Fx=0`, `F²x=0`, hence `3x=0`. | Corrected kernel argument avoids unjustified division of an endomorphism by 3. |
| 5.11 theorem (1140) | The three nonexceptional rings satisfy `3=0`; a characteristic-zero type point has `3≠0`, so none can receive it. Exactly the fourth pair `(6,6)` remains. | Selection does not claim absence of nonexceptional characteristic-three deformations. |
| 5.12 theorem (1151) | Exceptional tangent bound `≤1` yields zero ring or a one-variable quotient; an actual lift excludes zero. | Full `G₃` très shape and extended uniformizer value remain in scope. |
| 6.1 theorem (1177) | At `x=x₀`, torsion representation is identical; finite étale 3-torsion has `9` geometric points in characteristic zero, with the same permutation action on a sufficiently small Krasner neighbourhood. | Cusps excluded by `Y`; smooth finite-étale specialization, not arbitrary families. |
| 6.2 theorem (1188) | Ordered bases of `𝔽₃²`: `48`; quotient by `(a,b)↦(−a,b)` is free of order `2`, giving `24`. Pairing is inverted and exchanges its two nontrivial values. Simultaneously negating both vectors would preserve pairing and leave two geometric components. | Correct involution; determinant-surjective image of order ≥24 is 48. |
| 6.3 construction (1200) | Pullback pairing gives `α*e₅` exactly; companion's mod-3 image has order `48`; degree-24 orbit plus determinant `2` forces that full image. | No absolute-irreducibility assumption on input mod-5 representation needed. |
| 6.4 theorem (1219) | Case-1 conductor exponent at 3 is `<3`; cases 4–5 have exponent `3`, case 6 exponent `5`. Extended uniformizer square is `−3`; its positive sign yields residue trace `3`, negative gives `−3`. | Conductor cutoff and full extended sign differ from merely inertial data. |
| 6.5 theorem (1230) | `ℓ*=−3` at 3 and `5` at 5; nonsplit local triangular residual has scalar centralizer dimension `1`, split distinct characters give dimension `2`. | Hypotheses sound; earlier ownership is S03. |
| 6.6 theorem (1242) | Weight-one Langlands–Tunnell form times a weight-one Eisenstein series has weight `2`; Hasse multiplication at 3 gives weight `3`. Odd conjugation determinant is `−1=2≠1` in `𝔽₃`. | Uses the correct weight-raising input and oddness. |
| 6.7 theorem (1254) | For `E:y²=x³−x`, good-prime traces at `3,5` are `0,−2`; quadratic twisting multiplies them by `χ(3),χ(5)`, determinant by `χ²=1`. Irreducible residual semisimplification equals itself. | Twisting and reduction require the stated qualifications. |
| 6.8 theorem (1266) | Surjective mod-3 image has determinant kernel `SL₂(𝔽₃)` of order `24`; its natural representation remains absolutely irreducible, unlike a Borel of order `12`. | Quadratic restriction hypothesis follows for the companion, not every residual representation. |
| 6.9 theorem (1277) | `27∤N` permits 3-adic conductor exponents `0,1,2`, excludes `3,5`; the displayed wild curves with exponents `3,5` therefore cannot enter this branch. | No good-primes-only restriction; this is one branch of the complete theorem. |
| 6.10 theorem (1288) | Cyclotomic determinant at complex conjugation is `−1=4` in `𝔽₅`; even determinant `1` fails. Surjective image has order `480`, while a rational 5-torsion line puts image in a Borel of order at most `80`. | Absolute irreducibility and coefficient field `𝔽₅` are retained. |
| 6.11 theorem (1300) | Elkies function values at finite points are `0,17,8,−15,5/4,185/4`; at `(1,−1)` normalized pole value `−44`; only the simple zero gives the finite rational point upstairs. CM `j=0` is included. | Isogeny qualification and negative exceptional j-sign pass. |
| 6.11 finite modularity targets (1306) | `E₅₀`: `(Δ,c₄,j)=(-800,145,-121945/32)`; `E₃₃₈`: `(-17576,-143,1331/8)`. Constant maps have degree `0` and fail required nonconstancy. | Named source/target and extension over poles are explicit; mere Euler-factor agreement is insufficient. |
| 6.12 theorem (1324) | Bad mod-5 images in the proof have order dividing `80` or `16`, both prime to `3`; hence their wild 3-inertia image has order `1`. | The switch needs this finite-group exclusion, not an assumption of good reduction. |
| 6.13 theorem (1336) | For `y²=x³−x`, `N=32`, traces `a₃=0,a₅=−2` equal `p+1−#E(𝔽_p)` (`#=4,8`). A singular cubic has discriminant `0` and fails `IsElliptic`. | Exact conductor and cusp-to-origin normalization are preserved; general modularity carrier absent at pins. |

Additional conventions: every local denominator `2,4,q,β,cπ` is nonzero in its stated characteristic-zero field or is a unit in its odd-characteristic ring. `ℓ=2` is excluded exactly where used by Breuil and sign arguments; §2.4 alone permits it. Equal-characteristic DVRs, zero rings, nonperfect residue fields and inseparable characteristic-zero extensions are outside the specified categories. Rank zero and empty filtrations are included where meaningful. The absolute Galois group in matrix Hilbert 90 is profinite; replacing it by an arbitrary noncompact topological group is not an allowed instance. No arbitrary-topology representation is used by the eleven Lean declarations.

## Supplier and ownership ledger

Main roadmaps were read from the supplied content tree. The fourteen larger arithmetic suppliers inspected through the roadmap service are new folders absent from that main tree, so their open versions are admissible suppliers. No revised version of an existing main roadmap was substituted for main. The direct ownership search also covered the README and Lean file in each of the 26 specified sibling folders (52 files), the four board packages, and active/completed main roadmaps. The search service was used for object searches and for all six retained theorem names; it found no competing declaration with those names.

| Supplier | Resolved interface and result |
|---|---|
| ClassFieldTheory | §2.6 explicitly sends uniformizers to arithmetic Frobenius and units to inverse cyclotomic norm. Layers 5,7,8,11,12 supply Kummer/duality, local existence and global reciprocity. `kummerEquiv_mixed` includes `n=p` in mixed characteristic, since `p` is invertible in the fraction field. |
| LocalGaloisGroups | Layer 1, README:299, gives finite-dimensional trivial-coefficient cohomology and dimensions `1+dim H²+[K:ℚ_p]`; at `ℚ₃`, `μ₃` is absent and `dim H¹=2`. The twisted Kummer coefficient is supplied by ClassFieldTheory, not confused with a trivial module. |
| LocalFieldsRamification | Layers 0,2,3 contain the mixed-characteristic local fields, unramified/Frobenius, ramification and Eisenstein interfaces. The particular degree-3 and degree-24 fields are new calculations here. |
| EllipticCurves | Layers 2 and 4 contain torsion, pairing, Tate modules and reduction. No source-independent use of its algorithmic conductor as the Artin conductor was needed; the final equality is imported from EllipticCurveModularity. |
| ModularCurves | §5C, README:1357, constructs the paired twist for `N≥3`; geometric connectedness remains conditional there. |
| ModularCurvesPartII | §§4.10,6.5 supply fixed-pairing geometric connectedness and the twist; §5.14 supplies compactification/frame descent; §§5.1–5.5 and §5.15 supply the coarse modular curves and relevant models. These do not already assert the level-five rationality proof owned here. |
| ModularForms | Layer 0 supplies forms with character and Eisenstein interfaces; Layer 4 primitive associates; Layer 9, README:997, explicitly supplies twisting, cuspidality, level bounds and good-prime coefficient multiplication. |
| Chebotarev | Density is used through ArithmeticGaloisRepresentations §5.1, not as an unproved equality of representations from finitely many traces. |
| RepresentationTheory/InductionRestriction | Layer 7, README:721, supplies factor sets and central lifting extensions; the abstract universal central extension has a specified perfectness hypothesis. It does not supply the exact cyclotomic-equivariant level-five lift. |
| LocalGaloisDeformationRings | §§1.4,1.12 and 3.12 supply tangent/coefficient/type quotients. §8.6 explicitly uses `S_k`, including the `𝒪/9` counterexample to integral Ext. S02 and S06 record the two mismatches. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | R07.1.20 supplies schematic closure over a Dedekind base; R07.1.22 extends morphisms, while R07.1.25 extends compatible finite-flat levels to a divisible group. R07.2.5–2.8 supply contravariant Dieudonné theory; R07.4.18 supplies the integral Breuil frame; R07.4.27 gives `r(g)=g_D φ^{-a(g)}`; R07.4.30–4.35 supply descent and tame modules. The wild correction operators are not supplied there. |
| GL2AutomorphicRepresentationsAndTransfer | R16.2–R16.3 contain compact types, local parameters and multiplicity; R17.5.17, README:2556, gives the order-48 section over `ℤ[√−2]` and weight-one mod-3 application. It explicitly leaves the weight-two step separate. |
| GL2ModularityLifting | §§5.6,5.9,5.11 exist with the component and potentially Barsotti–Tate qualifications. §§5.14–5.15 already own precisely §6.5's BCDT theorems: S03. |
| ClassicalSerreModularity | §I.1 owns the ordinary theorem including the imaginary-quadratic branch. |
| OrdinaryAutomorphicFormsAndModularityLifting | §5.7 explicitly refers ordinary ownership to ClassicalSerreModularity §I.1 and retains p-distinguishedness and the noninduction restriction on its own specialization. |
| InverseGaloisAndArithmeticFundamentalGroups | §IG.2.7 supplies Hilbert points with local conditions for number fields and varieties with weak approximation for all finite place sets. Its general theorem specializes to `ℙ¹_ℚ`; it does not require geometric irreducibility of an arbitrary untwisted determinant union. |
| ArithmeticGaloisRepresentations | §1.8 and Layers 4–6 supply Brauer–Nesbitt, oddness and small images, Frobenius density/recognition, torsion and reduction. Absolute irreducibility is retained where needed. |
| AlgebraicModularFormsAndSerreWeights | R15.3, R15.5, R15.6 distinguish weight operations, eigencharacter lifting and residual modularity. Eigenvalue lifting requires an actual integral reduction witness, not a formal eigenvalue list. |
| EllipticCurveModularity | R29.3–R29.6 supply the conditional equivalence of newform, Tate and parametrization formulations, with conductor normalization. They are not used as an unconditional proof of modularity in this route. |
| PadicHodgeTheory | §§8.3,9.3 give the general abelian good-reduction/crystalline results. Its covariant crystalline polynomial is `X²−(a/q)X+1/q`; the inverse Frobenius in R07.4.27 converts it to the arithmetic WD polynomial `X²−aX+q`. The two polynomials must not be identified before that inversion. |
| ComplexMultiplicationAndExplicitReciprocity | The target “CM induction and compatible-system comparison”, README:771, gives the induced Tate representation and theta-series comparison for rational CM elliptic curves, including the `j=0` branch. |

Ownership of the remaining additions: explicit wild types, explicit local splitting fields, Breuil calculations with noncommuting wild descent, and the seven concrete local tangent computations are not generic tame theory already owned by the supplier. The broad potentially-good abelian cross-prime comparison and the equivariant level-five lift are explicitly owned targets here. The finite maps at levels 50 and 338 have named domains, codomains and nonconstancy obligations; they do not invoke the final modularity theorem circularly. The six retained Lean theorems neither duplicate a located fully qualified name nor reduce to a single pinned lemma; no new padding finding is raised.

The mechanical order check returned:

```text
depcheck: 27 roadmaps, 244 edges, 0 problem(s)
```

There was no `UPWARD`, `CYCLE` or `moved:` line. No declared supplier gap or readable design plan was supplied. The fresh citation resolver found no unresolved cross-roadmap citation; its library scan was unavailable on the service host, so pinned-library claims were checked locally. The earlier resolver's `BarsottiTate.extend_genericFibre` lead is resolved by the actual future target in R07.1.22, not by pretending it exists at the pin.

Pinned witnesses used in this audit include:

| Pinned object | Location and hypothesis/content checked |
|---|---|
| Matrix groups and projectivization | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`, `Matrix.GeneralLinearGroup.map`; `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:70`; `Mathlib/LinearAlgebra/Matrix/ProjectiveSpecialLinearGroup.lean:33`; `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Projective.lean:113`. the native PSL body is `SpecialLinearGroup n R ⧸ Subgroup.center (SpecialLinearGroup n R)`; these are actual native carriers for S01. |
| Absolute Galois topology | `Mathlib/FieldTheory/KrullTopology.lean:133` defines the topology on algebra automorphisms and supplies a topological group. `TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean:312` is `Gal(SeparableClosure K/K)`. |
| Scalar Hilbert 90 | `TauCeti/FieldTheory/GaloisCohomology/Hilbert90.lean:245`, `hilbert90`, is for `(Kˢ)ˣ`, not matrix coefficients. |
| Explicit continuous cohomology | `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:469,712,717`: the native body is `Z1 := C1 G M ⊓ (d1 G M).ker`; continuity is therefore included; `H1` is the quotient and `H1pi` its projection. |
| Cohomology functoriality | `TauCeti/RepresentationTheory/Homological/ContCohomology/Functoriality.lean:161,222`: `coeffMap` uses a morphism of topological representations; `res` uses the subgroup restriction interface. They do not identify integral Yoneda extensions with characteristic-three tangent classes. |
| Kummer and duality | `TauCeti/NumberTheory/ClassFieldTheory/MuNRep.lean:270` requires `IsUnit (n:F)`; `TauCeti/NumberTheory/ClassFieldTheory/Local/Duality/FiniteModule.lean:260` supplies the named Kummer-coefficient duality bijection. At `F=ℚ₃,n=3`, invertibility holds. |
| Reciprocity | `TauCeti/NumberTheory/ClassFieldTheory/Local/Reciprocity.lean:116`, `Local/Unramified.lean:440`, `LocalExistence/AbelianLayer.lean:114`: chosen embedding/finite-layer hypotheses and arithmetic-Frobenius normalization are present. |
| Weil pairing and Tate determinant | `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/WeilPairing/Basic.lean:230`, `Galois.lean:104`; `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Galois.lean:71`, `Determinant.lean:52`. Ellipticity, geometric coefficient field and invertibility of the torsion prime are required. |
| Eisenstein criterion | `TauCeti/NumberTheory/LocalField/Eisenstein/TotallyRamified.lean:162` supplies the general totally-ramified/Eisenstein-generator equivalence; it does not compute these six explicit polynomial fields or their automorphisms. |

## Source locator ledger

The following 27 locator groups were checked in the legal cached texts, including the surrounding hypothesis paragraphs. A group can contain several adjacent numbered assertions. Source line numbers below refer to the supplied numbered extractions, not to copied passages. The differing printed and author-copy pagination is retained where relevant.

| Group | Locator and source witness | Outcome |
|---|---|---|
| 1 | BCDT §1.2, Lemma 1.2.1, pp. 852–854; BCDT line 459 | Compact-type multiplicity and infinite-dimensional hypothesis match. |
| 2 | BCDT §1.3, pp. 854–856; BCDT lines 595,609,688 | Explicit admission rules match; the singular Serre-weight parenthesis has the error below. |
| 3 | BCDT §2.1, Lemmas 2.1.1,2.1.3,2.1.5 and Theorems 2.1.2,2.1.4,2.1.6, pp. 860–862; BCDT line 900 | Seven types and the separate simple/weak assertions match. |
| 4 | BCDT Theorem 2.2.1 and proof, pp. 862–865; BCDT lines 987–1115 | Six cases, local companion and global switch route match. |
| 5 | BCDT Lemma 2.3.1 and Corollary 2.3.2, pp. 865–866; BCDT lines 1120,1141,1160 | Correct Frobenius conclusion; norm congruence and printed matrix dimension require the documented corrections. |
| 6 | BCDT §§3.1–3.4, pp. 866–868; BCDT line 1190 | Reduction constituents supply §§0.6–0.8. |
| 7 | BCDT §§4.1–4.2, pp. 868–874; BCDT line 1270 | Model lattice, closures, weak/strong filtrations and exactness hypotheses support §2.4. |
| 8 | BCDT §4.3, pp. 874–875; BCDT line 1601 | Tangent Ext is explicitly over coefficient modules; supports S02. |
| 9 | BCDT §§4.4–4.6, pp. 875–880; BCDT lines 1660,1726,1741 | Type conditions and three characteristic-three rings match after the printed proof repair. |
| 10 | BCDT §4.7, Lemma 4.7.1, Corollary 4.7.2, pp. 880–882; BCDT line 1860 | Comparison-map directions, trace-zero relation and très kernel dimension match. |
| 11 | BCDT §§5.1–5.2, pp. 883–888; BCDT lines 1954,2146,2165 | General perfect-residue-field Breuil definitions and gauges match; coefficient-rank misprint recorded below. |
| 12 | BCDT §§5.4–5.7, pp. 890–899; BCDT lines 2297,2454,2467,2555,2615,2664,2689 | Residue-field base change, corrected commutation and composition, and rank-one wild descent support the stated formulas. |
| 13 | BCDT §§6.1–6.2, pp. 899–900; cubic construction preceding BCDT line 2770 | Cubic equations and conjugates agree with independent polynomial reductions. |
| 14 | BCDT §§6.3–6.5, pp. 900–904; BCDT lines 2777,2841,2865,2877 | Order and negative-field uniformizer misprints are corrected by the roadmap. |
| 15 | BCDT §§7.1–7.4, pp. 904–910; BCDT lines 3111,3149,3173,3207 | Cubic normal forms and diagonal sign argument match; printed generator/index slips are not valid formulas to copy. |
| 16 | BCDT §§8.1–8.3, pp. 911–919; BCDT lines 3270,3565,3584,3589 | Weight/involution classification, nonzero Frobenius, and diagonal unramified image match. |
| 17 | BCDT §§9.1–9.2, pp. 919–927; BCDT lines 3661,3669,3678,3716 | Four families, coefficient field and the split/très distinction checked. The initial nonsplit context is necessary for the exhaustiveness assertion. |
| 18 | BCDT §§9.3–9.5, pp. 927–935; BCDT lines 4089,4134,4197,4236 | Reversed and diagonal extensions, coefficient descent and `A_N`-linearity agree. |
| 19 | BCDT §9.6, pp. 935–937; BCDT lines 4330,4409,4419 | Vanishing arguments and the exceptional `a₂c=0` step match the very-ramified condition `c≠0`. |
| 20 | BCDT Theorems 1.4.1–1.4.2 and §10, pp. 857–860,937–938; BCDT lines 719,767,4423 | Exact lifting hypotheses match; proof ownership is S03; relevant CDT corrections retained. |
| 21 | CDT Theorems 7.2.1,7.2.2,7.2.4 and Lemma 7.2.3, pp. 553–556; CDT lines 1608,1631,1658,1763 | Tame and 5-switch assertions supported; exceptional statement uses the published corrections. |
| 22 | CDT Lemma B.4.1 and Proposition B.4.2, pp. 563–565; CDT line 2125 | General abelian-variety/number-field-action cross-prime comparison supported. |
| 23 | SBT Lemma 1.1 and Theorem 1.2, published pp. 285–286, author-copy pp. 3–4; SBT lines 102,118,123,132 | Matrix lifting, rational twist and degree-24 cover supported. OCR limitations stated below. |
| 24 | DDT Remark 3.6, Theorem 3.9, Definition 3.12, Theorem 3.14(a), pp. 88–90; DDT lines 3265,3292,3302,3316 | Weight-one to weight-two reduction and mod-3 modularity supported. |
| 25 | Breuil §2.1.1, Proposition 2.1.2.2, Theorems 3.3.7 and 4.2.1.6; Breuil lines 197,351,1621,2199 | Truncated-module comparison and anti-equivalence retain `p≠2`. |
| 26 | Manoharmayum §§5.3–5.4, Lemmas 5.3.1,5.4.1 and Theorems 5.3.2,5.4.2, pp. 750–753; Manoharmayum lines 780,883,892 | Local representation families and quadratic-twist qualifications match; uses `K^{nr}` in the repaired notation. |
| 27 | Elkies Appendix, equations (150)–(153), author pp. 54–55, Elkies lines 2477–2502; Cremona lines 131,1384 | Eight rational base points, zero/pole analysis, nonsquare values and both fixed curve equations match. |

## Verified sound

Read all 1,370 README lines and all 85 Lean lines. Counts: **11 declarations**, **85 bold target blocks**, **235 Checks inspected for truth, domain and discrimination**, **27 source-locator groups checked across eight accessible works**, **21 supplier-contract groups checked**, and **26 specified sibling folders searched (52 files)**. The tables record concrete instance tests for every target block and declaration; these counts do not assert 235 independent formal proofs. All 22 earlier findings are accounted for individually above.

The headline list is: simple admittance (§§0.6–0.8); explicit cube classes and splitting fields (§§1.1,1.3–1.7); cross-prime comparison (§1.13); matrix Hilbert 90, the equivariant lift and rationality (§1.15); Breuil classification and wild descent (§§2.1–2.4); three families of tangent/weak-acceptability theorems, including the characteristic-three rings (§§3.8–3.9,4.6–4.7,5.8–5.12); global companions (§§6.1–6.3); lifting, cyclotomic mod-five modularity and elliptic modularity (§§6.5–6.13). The six retained Lean theorems cover the explicit local arithmetic. The module docstring records the missing arithmetic-geometric carriers for the other main endpoints. The two newly owned group-theoretic statements are the statable omissions S01.

No retained theorem is a restated definition, a small-value computation or a one-library-lemma wrapper. The definitions have real bodies; all hypotheses of the six theorems appear in the supplied elaborated signatures. There are no admitted data definitions, placeholders, `lemma` declarations, `set_option` commands, extra imports, or admitted examples. The namespace and declaration registrations agree with the README. The source computations retain both small primes where relevant, nonabelian groups, mixed characteristic, residue-degree two, all torsion exponents, finite-flatness and generic-fibre markings. The computations do not narrow the roadmap to good reduction or tame types.

The read-only diff-stat check at `b3316c7` showed six changed files, all under `packages/EllipticCurveModularityWild3Adic/`; no outside-folder edit was present. No package source was edited during this review. No Lean build, Git write, posting action, or external message was performed. No instruction embedded in reviewed text was followed. No additional source request is necessary.

## Not verifiable

- BBM 4.2.14 remains **uncertified**, as settled in the brief and manifest. Its text was not available; the report does not certify its exact formulation independently of BCDT's use.
- Serre, *Corps locaux*, Ch. XIV §1 Proposition 3 remains **waived**. Its exact text was not requested again; the Kummer and duality instance calculations above do not purport to certify that printed locator.
- No independent elaboration was run: the read-only prohibition takes precedence over the generic scratch-`#check` instruction. The current worker-provided signature audit was used. The proposed S01 signatures still require elaboration by the repair worker.
- SBT's cached text is OCR. Its mathematical proof and locators were readable; this review did not visually certify every typographical glyph in the scan. The two obvious inconsistent labels are reported below with their author-copy locator.
- The enormous polynomial descent classifications were checked at the cited assertions, at their displayed operators and at the recorded boundary/sign instances. A complete independent reproduction of every elimination in BCDT §§8–9 was not performed. In particular, the assignment of diagonal labels in §5.7 was matched to BCDT §9.6; this is source verification, not an independent calculation of every four-dimensional self-extension.
- Ownership searches directly inspected the 26 supplied sibling heads and resolved the named suppliers. They are not a claim to have read every unrelated open roadmap in full. The service's broader search found no duplicate retained Lean theorem name.

## Source issues

- **Error** in BCDT at §1.3, p. 855, BCDT line 609: the source says admission by `σₙ,₀` is equivalent to one minimal integer Serre weight; it should be membership in the allowed weight set, retaining both endpoint weights; affects a stated result.
- **Error** in BCDT at Lemma 2.3.1 proof, p. 866, BCDT line 1151: the source says the uniformizer norm has a residue factor independent of `B`; it should be `1−2(B+3)/3−3√−3` modulo 9; affects the proof.
- **Misprint** in BCDT at Corollary 2.3.2, p. 866, BCDT line 1160: the source says the two-dimensional mod-three representation lands in `GL₃`; it should be `GL₂`; affects a stated result.
- **Misprint** in BCDT at Lemma 5.2.3(1), p. 887, BCDT line 2166: the source says the underlying rank is `[k′:k]` despite disjoint extensions of `𝔽_ℓ`; it should be `[k′:𝔽_ℓ]`; affects a stated result.
- **Misprint** in BCDT at the setup for Corollary 5.6.2, p. 898, BCDT line 2650: the source says `H_γ=u(1+f_γ)` for a relation word; it should be `γ̂(u)=u(1+f_γ)`, equivalently `H_γ=1+f_γ`; affects the proof.
- **Misprint** in BCDT at §§6.3–6.4, pp. 900–901, BCDT lines 2785,2840: the source says `γ₄²` has order three; it should be order two, as its action on `β` also proves; affects a stated result.
- **Misprint** in BCDT at §6.4, p. 902, BCDT line 2865: the source says `α/β` is a uniformizer when `α³=4`; it should be `(α−1)/β`; affects the proof.
- **Misprint** in BCDT at Lemma 7.2.6 proof, p. 908, BCDT lines 3133,3146: the source says to evaluate on a vector missing one factor of `u`, and later drops that factor in the module parameter; it should be the filtration generator `u²e′+(b+b′u)ue` and its matching parameter; affects the proof.
- **Misprint** in BCDT at §7.4, p. 910, BCDT lines 3215,3217: the source says the first off-diagonal term uses `e′_ω` and gives two formulas for `γ̂₃(e′_ω)`; it should be `e_ω` in the first term and `γ̂₃(e′₁)` in the last formula; affects the proof.
- **Misprint** in BCDT at the conclusion of §8.3, p. 918, BCDT line 3587: the source says the quadratic calculation proves Theorem 4.4.1; it should be Theorem 4.5.1; affects nothing.
- **Error** in BCDT at Theorem 4.6.3, p. 878, BCDT lines 1728,1737: the source says the nonconstant modulo-`T²` conclusion holds for every `N≥1`; it should be required only for `N≥2`, since `A₁=𝔽₃`; affects a stated result.
- **Misprint** in BCDT at Theorem 4.6.3, p. 878, BCDT line 1737: the source says the residual representation rather than `ρ_N` is reduced modulo `T²`; it should be `ρ_N mod T²` over `𝔽₃[T]/T²`; affects a stated result.
- **Gap** in BCDT at Corollary 4.6.4 proof, p. 879, BCDT line 1777: the source says factorization through `3D` permits division by 3 inside `End(D)`; it should be justified or replaced by the `D[9]⊆D[3]` argument using `F(D[3])=0` and `F²=−3`; affects the proof.
- **Misprint** in SBT at Lemma 1.1, author-copy p. 3, SBT line 102: the source says the twist for an arbitrary characteristic-zero field is a projective line over `ℚ`; it should be over that field `K`; affects a stated result.
- **Misprint** in SBT at Lemma 1.1 proof, author-copy p. 3, SBT line 118: the source says the lifted homomorphism has source `SL₅(𝔽₅)`; it should be `SL₂(𝔽₅)`; affects the proof.
- **Misprint** in Elkies at the paragraph after equation (153), author p. 55, Elkies line 2505: the source says the upper double-cover curve has seven finite rational points; it should be the lower elliptic quotient `X₀⁺⁺(75)`; affects nothing.
- **Misprint** in CDT at p. 523, line −10, as corrected in BCDT line 4425: the source says to use each point without its field-of-definition qualification; it should be each `K`-rational point; affects the proof; corrected in print at BCDT §10, p. 937.
- **Error** in CDT at p. 532, line −6, as corrected in BCDT line 4426: the source says semisimplicity of `σ₁` implies semisimplicity of `σ_n`; it should be deleted, as the implication is false and unused; affects nothing; corrected in print at BCDT §10, p. 937.
- **Misprint** in CDT at p. 536, line 7, as corrected in BCDT line 4429: the source says the real-group argument uses `GL₂(ℂ)`; it should be `GL₂(ℝ)`; affects the proof; corrected in print at BCDT §10, p. 937.
- **Misprint** in CDT at p. 538, line −10, as corrected in BCDT line 4430: the source says only that the global representation has type `(S,τ)`; it should be supplemented by the local restriction having type `τ`; affects a stated result; corrected in print at BCDT §10, p. 937.
- **Misprint** in CDT at p. 539, lines 18–20, as corrected in BCDT line 4432: the source says the character labels are `ω₁,ω₂`; it should be `η₁,η₂`; affects the proof; corrected in print at BCDT §10, p. 937.
- **Misprint** in CDT at p. 541, line 14, as corrected in BCDT line 4433: the source says three patched-algebra occurrences are `A`; it should be `A∞`; affects the proof; corrected in print at BCDT §10, p. 937.
- **Misprint** in CDT at p. 544, line −6, as corrected in BCDT line 4434: the source says to use the discrete topology on `V_p`; it should be the `ℓ`-adic topology on `M_p`; affects the proof; corrected in print at BCDT §10, p. 937.
- **Error** in CDT at Lemma 6.1.2(4), p. 545, as corrected in BCDT line 4436: the source says the subgroup comparison needs no normality qualification; it should be stated with `V′` normal in `V`; affects a stated result; corrected in print at BCDT §10, p. 937.
- **Error** in CDT at §6.2, p. 546, as corrected in BCDT lines 4440–4455: the source says the original arithmetic group meets Theorem 6.1.1 and uses dual coefficient modules; it should be replaced by the modified levels and `L_n⊗k` with the corrected Hom module; affects the proof; corrected in print at BCDT §10, pp. 937–938.
- **Misprint** in CDT at p. 549, lines −15 and −11, as corrected in BCDT lines 4456–4457: the source says the level factors are `U_{r,r′,p}` and `U′_S/U′_{0,S}`; it should be `U_{r,p}` and `V₀/V₁`; affects the proof; corrected in print at BCDT §10, p. 937.
- **Error** in CDT at p. 552, line 4, as corrected in BCDT lines 4458–4460: the source says the assertion applies for every `ℓ≥5`; it should be restricted further by `j(E)≢1728 mod ℓ`; affects a stated result; corrected in print at BCDT §10, p. 937.
- **Error** in CDT at Lemma 7.2.3, p. 554, CDT line 1659: the source says the original curve's `j` belongs to the displayed set; it should be a curve rationally isogenous to it whose `j` belongs to that set; affects a stated result; corrected in print at BCDT §10, pp. 937–938.
- **Misprint** in CDT at Lemma 7.2.3 and proof, p. 554, CDT lines 1659,1665: the source says the conductor-50 exceptional invariant is positive `5·29³/2⁵`; it should be negative `−5·29³/2⁵`; affects a stated result; corrected in print at BCDT §10, p. 938.
- **Misprint** in CDT at Lemma 7.2.3 proof, p. 554, CDT line 1692: the source says the congruence moduli for the cyclic subgroup and unordered pair are `p` and `q`; it should be `q` and `p`, respectively; affects the proof; corrected in print at BCDT §10, p. 938.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "b3316c7272f743c7c76702d3aa510d757c0c8a3c", "job": "RT-EllipticCurveModularityWild3Adic~2a", "model": "gpt-6-astra", "worker": "chris-6"} -->
