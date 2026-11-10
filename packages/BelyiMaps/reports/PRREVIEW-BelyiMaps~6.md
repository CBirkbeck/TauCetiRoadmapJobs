# Review of BelyiMaps (pull request #767 at c19b421)

**Verdict:** needs changes

The gate passes and the dependency check reports no problem. One blocking finding remains: the merge of main moved the branch to Tau Ceti `2fd255d9`, at which Layer 13.5 is statable, and `Suggested.lean` still omits it and still says the pinned revision lacks its carrier (R01). Five P3 findings follow; four are one-line edits.

## Status of the previous review's findings (head `8521101`)

| Previous finding | Passage at this head | Status |
|---|---|---|
| R01 139 library names not at the branch's Tau Ceti pin | `lake-manifest.json` pins Tau Ceti `2fd255d997f4`, Mathlib `1b1ccf4b088b`; `README.md:593–595` declares the same revisions; `origin/main` is an ancestor of the head | repaired: all 617 dotted or underscored backticked names of the README were searched at this pin, and the only ones absent are the two exports of `Suggested.lean` and four non-identifiers (`A_D`, `K_D`, `m_N`, the two LMFDB collection names) |
| R02 docstring contradicts itself; 13.5 statable and absent | `Suggested.lean:47–51` "the revision this repository's `lake-manifest.json` pins for this file has neither" | not repaired; now false at this head (R01 below) |
| R03 thirteen own names declared nowhere | none of the thirteen occurs; `README.md:1164–1165, 1205, 1211, 1253` use the pinned `swap0Inf_σ0`, `rot_σ1`, `rotInv_σinf`, `isConnected_swap01_iff`, `swap1Inf_swap01_swap1Inf`, `swap1Inf_swap1Inf` | repaired |
| R04 5.1 "Tau Ceti has no instance" | sentence gone; `README.md:1899–1903` lists the instance, `:1961` names its route | repaired |
| R05 Ordering and import tables | `README.md:5638` "3.1 needs 1.1, 1.2 and 1.4"; `:5643–5650` five places with `Layer 9 ← 2.6`; `:307` lists `9.1` | repaired (one more row of the same kind: R03 below) |
| R06 description described an older head | rewritten; one paragraph is stale again after the merge (R06 below) | partly |

## R01 (P2) — Layer 13.5 is statable at the head's pin and is absent from `Suggested.lean`

**Location.** `TauCetiRoadmap/BelyiMaps/Suggested.lean:43–51` ("Tau Ceti has that module, and the carrier `TauCeti.AlgebraicBelyiPair`, from revision `2fd255d997f4`; the revision this repository's `lake-manifest.json` pins for this file has neither … so the statement cannot be written against it"), `:52–56` ("absent from the pinned revision as above"); `README.md:75–77` ("that revision has no algebraic Belyi pair, so none is"); `README.md:612–620`.

**Claim.** No remaining headline is statable at the pinned Tau Ceti.

**Witness.** `lake-manifest.json` at this head pins Tau Ceti `2fd255d997f47c0b…`. There: `TauCeti/FieldTheory/FunctionField/Belyi/Bundled.lean:55, 89` (`AlgebraicBelyiPair`, `IsoClass`), `GaloisAction.lean:239` (`instMulAction`). `README.md:612–616` says the file states each statable remaining headline and that 13.5 is one.

**Repair.** Add the import line `import TauCeti.FieldTheory.FunctionField.Belyi.GaloisAction` after `import Mathlib`, and before `end TauCetiRoadmap.BelyiMaps`:

    /-! ## Layer 13: the pro-`ℓ` peripheral theorem and faithfulness -/

    /-- **Layer 13.5, faithfulness of the Galois action on dessins.** The absolute Galois group of
    `ℚ` acts faithfully on the isomorphism classes of algebraic Belyi pairs over `ℚ̄`. -/
    theorem faithfulSMul_absoluteGaloisGroup_isoClass :
        FaithfulSMul (AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ)
          (TauCeti.AlgebraicBelyiPair.IsoClass (AlgebraicClosure ℚ)) := sorry

Tested on a scratch copy of the file at this pin (after `lake build TauCeti.FieldTheory.FunctionField.Belyi.GaloisAction`): it elaborates with the `sorry` warning only; `infer_instance` fails, `simp` makes no progress, and `exact?` finds only the statement itself, so it is not padding. Then:

- `Suggested.lean`: delete the first bullet of "Headline theorems not stated here" (13.5 is now stated), and in the second bullet replace "Besides the carriers `TauCeti.AnalyticBelyiPair` and `TauCeti.AlgebraicBelyiPair`, absent from the pinned revision as above, each needs a construction of the roadmap that revision `2fd255d997f4` does not have either" by "Each needs a construction of the roadmap that the pinned Tau Ceti does not have". The rest of that bullet is correct at this pin: `Belyi/BaseChange.lean:124` assumes `[Algebra.IsAlgebraic k k']`, so base change along `ℚ̄ ⊂ ℂ` is absent, and no field-of-definition certificate or points-to-places bijection exists.
- `README.md:74–78`: replace "that revision has no algebraic Belyi pair, so none is, and the file's docstring names" by "Layer 13.5 is the one that is, and the file's docstring names".
- `README.md:615–620`: name the declaration (`faithfulSMul_absoluteGaloisGroup_isoClass`) and drop "it enters the file with the module … which Tau Ceti has from revision `2fd255d997f4`" in favour of "it imports `TauCeti.FieldTheory.FunctionField.Belyi.GaloisAction`".

## R02 (P3) — "Seven roadmaps supply material" against eleven named suppliers

**Location.** `README.md:128`: "Seven roadmaps supply material to this one. The boundaries are stated once here."

**Claim.** The section names seven suppliers.

**Witness.** `README.md:145–251` and the table at `:562–584` name eleven: CharacterTheory, UniversalCovers, AlgebraicTopology, ConformalMapping, ComplexManifolds, FuchsianOrbifolds, ModularForms, AlgebraicCurves, PolynomialGaloisGroups, ProfiniteProPGroups, ProfiniteArithmetic.

**Repair.** "Eleven roadmaps supply material to this one."

## R03 (P3) — Section C's import list omits 9.1C

**Location.** `README.md:333–334`: "from B   5.6, 6.1, 6.3, 7.1, 8.7, 9.1, 9.5–9.8, 10.2, 10.3, 10.7, 11.1, 11.3, 11.5, 11.7".

**Claim.** The list is the union of the prerequisite lines of Layers 12–14 (`:272–273`: "nothing crosses a boundary except through these lists").

**Witness.** `README.md:4714`: "*Prerequisites:* Layers 6.3, 9.1C, 9.5–9.8, 10.7" (milestone 12.4). 9.1C is its own milestone (`:3430`), with a prerequisite line different from 9.1's. Every other prerequisite of 12.4–14.6 is in the list.

**Repair.** Write "9.1, 9.1C, 9.5–9.8" in the row at `:333`.

## R04 (P3) — A field degree written with its two fields exchanged

**Location.** `README.md:3635–3636`: "**Proposition 1.89** is the first half exactly — `[ℂ(f) : M(S)] ≤ deg f` by the elementary symmetric functions of the fibre values".

**Claim.** The displayed quantity is a degree of field extensions.

**Witness.** `ℂ(f) ⊆ M(S)`, so `[ℂ(f) : M(S)]` is not a degree unless the two are equal; the next line (`:3637`) writes the same quantity as `[M(S) : ℂ(f)]`.

**Repair.** Write `[M(S) : ℂ(f)] ≤ deg f`. (The book is not readable here, so whether its Proposition 1.89 states the bound for the whole extension or element by element, which `:3629–3633` distinguishes, is under "Not verifiable".)

## R05 (P3) — The supplier table names a different declaration from the one the text and the supplier name

**Location.** `README.md:566`: "| 3.2 | CharacterTheory Layer 4 | central characters, and the conversion to class sizes | `TauCeti.centralCharacter`; …".

**Claim.** CharacterTheory Layer 4 supplies `TauCeti.centralCharacter`.

**Witness.** `README.md:152` and `:1390` cite `TauCeti.Representation.centralCharacter` (CharacterTheory Layer 4.3), as does that roadmap (`TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md:195, 743`). At the pin, `TauCeti.centralCharacter` is the simple-module declaration of `TauCeti/RingTheory/Semisimple/CentralCharacter.lean:99`; the group-algebra one is `TauCeti/RepresentationTheory/CharacterTable/CentralCharacter.lean:89`.

**Repair.** Write `TauCeti.Representation.centralCharacter` in the row.

## R06 (P3) — The pull-request description's last paragraph describes the head before the merge

**Location.** Description, author's text (not a generated block), paragraph "**What a reviewer must know.**"

- "The branch's `lake-manifest.json` still pins Tau Ceti `a91d3aafa8cd`, which has no algebraic Belyi pair and lacks 139 of the library names the README cites". The head pins `2fd255d997f4`, and every cited name exists there.
- "Main must be merged into the branch before this merges." The head is that merge.
- "After that merge, Layer 13.5 becomes statable … and is to be added to `Suggested.lean` then"; and, under **Suggested.lean**, "It states no `sorry` theorem and elaborates without warnings." After R01 the file states one.

**Repair.** Replace the paragraph by: the branch pins the revisions main pins; `Suggested.lean` states Layer 13.5 with `sorry`, importing `TauCeti.FieldTheory.FunctionField.Belyi.GaloisAction`, and keeps the two proved exports.

## Verified sound

**Gate, build, dependency check.** Gate at `c19b421`: every counter `0`, `OK`. `lake env lean TauCetiRoadmap/BelyiMaps/Suggested.lean`: exit 0, no warning (the file has no `sorry`; that is R01). Dependency check: `depcheck: 234 roadmaps, 2266 edges, 0 problem(s)`, no UPWARD or CYCLE line. Changes outside the folder against `origin/main`: none. The folder differs from the previously reviewed repair only by main's `PROGRESS.md` and `STATUS.md`. Overlaps: #1187 is ordered after this pull request and #1791 falls under the stated "whichever merges second is rebased" rule in the generated merge-order block; no dropped or revision-only id.

**Signatures.** `#check @name` on a scratch copy for the two declarations and the R01 addition: `opposite_third_peripheral : ∀ {G} [Group G] (P T : G), (P * T)⁻¹ = P * (T * P)⁻¹ * P⁻¹`; `conjugation_transfer` with conjugator `q * c * (φ q)⁻¹`; both agree with `README.md:483–514` and lost no binder. They are free-variable group identities and are kept, not reported as padding, because `Completed/PeripheralActions/Suggested.lean:5, 475` imports this module and uses `opposite_third_peripheral` by name.

**Adversarial table** (statement; instances; values computed; result).

| Statement | Instances | Values | Result |
|---|---|---|---|
| §Pinned, product relation and the LMFDB display (`:359–387`) | `3T2-3_2.1_2.1-a`: `finRotate 3`, `swap 1 2`, `swap 0 1`; degree 5, `a = (1 2)(3 4)`, `b = (0 1 2 3)` | `σ0·σ1·σinf`: `0→1→2→0`, `1→0→0→1`, identity; `σinf·σ1·σ0`: `0→1→2→2`; `b·a = (0 1 3 4)`, types `[2,2,1],[4,1],[4,1]`; a `τ` fixing `a` and inverting `b` must be `i ↦ 2 − i` on `{0,…,3}`, which sends `2 ↦ 0` and breaks `(1 2)` | as stated |
| §Pinned, peripheral elements and transfer (`:472–514`) | any group | `P·C·P⁻¹ = P·P⁻¹T⁻¹·P⁻¹ = (P·T)⁻¹`; `d⁻¹·pow y·d = φq·c⁻¹·pow x·c·(φq)⁻¹ = φ y` | correct; equal to the two Lean statements |
| 0.5–0.8 cycle count, parity, examples | `cyclicTriple n`, `4z(1−z)`, `torusTriple`, `s3Triple`, `n = 0` | `χ = 1+n+1−n = 2`; `2+1+1−2 = 2`; `1+1+2−4 = 0`, `1/4+1/4+1/2 = 1`; `σ1σ0 = (1 2)`, `1+2+2−3 = 2`; on `Fin 0` pretransitive and `χ = 0` | `n ≠ 0` clause needed and present |
| 1.6 counts, `6T6` | degrees 1–5; generators | `1+1+2+5+5 = 14`; blocks `{0,3},{1,4},{2,5}` preserved, order `8·3 = 24` | consistent |
| 2.6 the six operations (sample) | general `(a,b,c)`, `c = a⁻¹b⁻¹`; `s3Triple` | `swap01`: `b⁻¹cb·a·b = 1`; `swap1Inf`: `b·b⁻¹cb·a = 1`; `s∘t∘s = (c, b, bab⁻¹)`; `t∘s = (b,c,a)`; `s∘t = (b⁻¹cb, a, aba⁻¹)`; `t² = a • t`; `rotInv (rot t) = b • t`; `t∘s∘t = b⁻¹ • swap0Inf t`; naive swap sends `0 ↦ 2` | all as stated; pinned `BranchPoints.lean:97–122, 175, 200, 518` agree |
| 2.6 / 5.1 / 9.1 the three actions agree (sample) | `mob01 ∘ mob1Inf`; `(t−1)/t`; basepoint orbit | `1 − z/(z−1) = 1/(1−z)`, punctures `0→1→∞→0`; `(t−1)/t`: `0→∞→1→0 = ρ⁻¹` for `rot`; `m⁻¹(0) = 1` so new `σ0 ~ σ1`; `b ↦ 1/2, −1, 2, 2, −1`; pinned `RatFunc.branchPointAut ρ` sends point `ρ i` to point `i` | one convention in all three places |
| 6.3 compatibility with the branch-point action (sample) | `h = mob01` | `h_*(periphInf) = (periph0·periph1)⁻¹ = periph1⁻¹·periphInf·periph1`; pinned `BranchPointAction/Basic.lean:151, 187` | third entry of `swap01` |
| 3.2 Frobenius formula | `S₃`: (3-cycles, transp., transp.); all transpositions | count `2·3 = 6`, formula `(2·3·3/6)(1+1+0) = 6`; count `0`, formula `(27/6)(1−1+0) = 0` | correct |
| 3.3 regrouping | `S₃`, `C0 = C1` transpositions, `Cinf = {1}` | three triples `(t,t,1)`, `1·[S₃:N(⟨t⟩)] = 3` | correct |
| 3.4 passport size | `C₅`, `([5],[5],[5])`; `n = 0` | `12` generating triples, `12·5/20 = 3`; `1·1/1 = 1` against size `0` | formula and its `n ≠ 0` hypothesis correct |
| 3.5 / 6.3 tables | enumeration of transitive pairs in `S_n`, `n ≤ 5` | classes `1, 3, 7, 26`; ordered passports `1, 3, 7, 26`; pairs `3, 26, 426, 11064`; `/(n−1)!` gives `3, 13, 71, 461`; degree 5: `74` passports with the group up to conjugacy, `139` with literal subgroups; `26/2·3 = 39` | every number in `:1507–1509, 1350, 2546, 2553–2556` confirmed |
| 4.4 spherical and Euclidean | `(1,2,3)`; rows `(2,3,3),(2,3,4),(2,3,5)`; affine model | `ZMod (gcd 2 3)` trivial, `2/χ = 12/5`; `y·x = (0 2 3), (0 2 3 1), (0 1 4 2 3)`; commutator translation `(η−1)(1−ω)` | correct |
| 4.5 hyperbolic | `tr(YX)`; `(2,3,7)` | `2c₁c₂ − 2κs₁s₂ = −2c₃`; `4(1/4 + cos²(π/7)) − 2 ≈ 2.247`; product-to-sum gives the factorization in 2 | correct |
| 5.8 loop at infinity | `p± = 1/2 ± i√35/2` | `1/4 + 35/4 = 9`; `[ℓ_A·ℓ_B] = periph1 * periph0` in the pin's order | `periphInf⁻¹` |
| 7.7 `TopBranchedCover` | `π = id`; `z ↦ zⁿ`; degree 0 | `e = 1`; `n, 1ⁿ, n`; fibres nonempty by surjectivity | Checks correct |
| 8.5 superelliptic example | `y⁴ = t(t−1)` | `e = 4, 4`; order `−2`, `gcd(4,2) = 2`; `2g−2 = −8+8 = 0` | `torusTriple` |
| 9.1 `AlgebraicBelyiPair` (sample) | `k = ℚ`, `t ↦ u³`; pinned structure | `{(1,1),(1,2)}`, `1+2 = 3`; `Belyi/Basic.lean:184` carries `[CharZero k]`, `IsIntegrallyClosedIn k F`, the three-place condition, and no separability field | carrier as §Pinned says |
| 9.3, 9.7 | `N ≥ 2g+n`; `t = u²`, `y = u/(t−2)` | `deg(Nq − Σxᵢ) ≥ 2g`, kernel codimension `n`; `w = u`, `W² − t`, `disc(m_N) = s^{N·n(n−1)} disc(m)` | correct |
| 10.2, 10.3 | `S = {±√2}`; `B_{m,n}(m/(m+n))`; `N ≥ 3` | `ν: 2 → 0`; `1`; `g(a) = g(c) = 0`, `g(b) = 1`, `#(T′∖∞) ≤ N−1` | terminates; kock2004 lines 425–451 |
| 10.5 the group-theoretic input (sample) | kock2004 (1.4), (1.5), (1.6) | lines 115–117, 139–140, 146–149: extension and fixed field; finite `K/ℂ^U` with `Aut(ℂ/K) ⊆ U` gives closed; finiteness, `≤` under normal or closed, `=` for `V` closed | the three statements as written, hypotheses included |
| 10.7 steps 2–3 | `ℓ((g+1)P) ≥ 2`; minimal `m` | one place over `p`, `e = f = 1`, `[F:E] = 1`; `L(mP) = ℂ ⊕ ℂz` | kock2004 line 277 |
| 11.1 the conjugation action (sample) | pinned `Belyi/Conjugation.lean`, `GaloisAction.lean:214–262` | structure maps precomposed with `σ⁻¹`, same `t`; `conj_refl`, `conj_conj`, `degree_smul` | as the milestone says; genus and partitions correctly listed as remaining |
| 11.4, 11.7 | `z ↦ z²`; `k = ℚ(√2)` | discontinuous character of `∏_ℕ C₂`; `[G:H] = 2`, `[G:S] = 1` | hypotheses right |
| 12.11 Kummer identity; §Pinned cyclotomic character (sample) | `σ̃(t^{1/n}) = ζ^b t^{1/n}` | `σ̃γσ̃⁻¹(t^{1/n}) = ζ^{−b}·ζ^{χ}·ζ^{b}·t^{1/n}`; pin `CyclotomicCharacter.lean:133`: `g t = t ^ (χ₀ n g).val` | exponent `χ(σ)`, not inverted |
| 12.12 image comparison and passport invariance (sample) | `S₃`, `u = 5`; `S₅`: `a`, `b` | fifth powers give `0 ↦ 1`; `b·a = (0 3 2 4 1)`, two Sylow 5-subgroups, `A₅`; `range(r ∘ θ⁻¹) = range r`; `θ_σ⁻¹` gives `v = χ(σ)⁻¹` | both forms consistent with 12.11 |
| 13.5 (headline; R01) | `p_α`; affine matching; char `p`; statement at the pin | degree 7, multiplicities `2,3,4`; `b = 0`, `a = 1`, `σα = α`; `(xᵖ−x)∘xᵖ = xᵖ∘(xᵖ−x)`; `FaithfulSMul` elaborates, not closed by `infer_instance`, `simp`, `exact?` | true and statable |
| 14.1 | degree 5 and degree 4 witnesses | `χ = 3+2+2−5 = 2`, `1/2+1/4+1/4 = 1`; `χ = 2+1+1−4 = 0`, `5/6 < 1` | correct |
| Hall's numbers | recursion `M_d = d·d! − Σ (d−i)!·M_i` (kock2004 lines 457–463) | `1, 3, 13, 71` | agrees with `:2560` |

**Library declarations opened at the pin** (`2fd255d9`): `Combinatorics/PermutationTriple/Basic.lean:76`, `BranchPoints.lean:97–122, 175, 188, 200, 518, 708, 772`; `Combinatorics/RibbonGraph/Basic.lean:49`; `RepresentationTheory/CharacterTable/ClassSum/Basic.lean:31`, `ClassSum/StructureConstants.lean:64, 84`, `Table.lean:337, 459`, `CentralCharacter.lean:89`, `ProductOne.lean:90, 136, 194`; `Topology/Algebra/Group/Profinite/Free/Basic.lean:60`, `Free/ProP.lean:72`, `MaximalProP.lean:101, 206, 216, 383`, `ZHat/Basic.lean:66`, `ZHat/PadicInt.lean:67`, `ZHat/Pow.lean:83, 261`, `ZHat/Units.lean:146`, `ZHat/Decomposition.lean:164`, `ProP/PadicPow.lean:135`, `ContinuousAut/ClosedQuotient.lean:166`, `ContinuousAut/OuterAction.lean:66`; `FieldTheory/FunctionField/Belyi/Basic.lean:91, 184, 258`, `Bundled.lean:55, 89, 138`, `GaloisAction.lean:239, 249, 262, 275`, `FieldOfModuli.lean:94, 127`, `BaseChange.lean:124, 132`, `Radical.lean:143`; `FieldTheory/FunctionField/Place/Extension/LocalData.lean:50, 109, 120`; `FieldTheory/RatFunc/Mobius.lean:591`; `AlgebraicTopology/ThricePuncturedSphere/BranchPointAction/Basic.lean:151, 187`. Mathlib: `NumberTheory/Cyclotomic/CyclotomicCharacter.lean:124, 133`; `FieldTheory/AbsoluteGaloisGroup.lean`. No `FaithfulSMul` statement about `AlgebraicBelyiPair.IsoClass` exists at the pin.

**Cross-roadmap citations resolved on main.** CharacterTheory Layers 1, 3.5, 4.3 (`:302, 497, 741`); ProfiniteProPGroups Layers 3, 4 (`Completed/…:437, 706`); ProfiniteArithmetic Layers 0, 1.1, 1.3, 2 (`Completed/…:223, 336, 407, 441`). The citations the previous review resolved (AlgebraicCurves Layer 8 item 2 and 12B.0a, 12B.0b, 12B.0d; FuchsianOrbifolds Layer 5; ModularForms §10B; ComplexManifolds; PolynomialGaloisGroups Layers 0, 6) are unchanged and the worker's citation check lists none missing. The declared gap `gap:transitive-groups-degree-six-to-eleven` is precise and minimal.

**Ownership against open work.** Searched the open heads and main for triangle groups, bipartite ribbon graphs, the three Belyi carriers and the branch-cycle theorem: GroupActionsOnRiemannSurfaces, InverseGaloisAndArithmeticFundamentalGroups, ProfiniteArithmetic and AnabelianGeometryAndNonabelianChabauty cite BelyiMaps or Tau Ceti's implementation of it; none states a second owner. ArithmeticFuchsianGroups uses triangle groups only as examples.

**Seeded sample.** All fifteen targets appear in the table or the lists above, except "Lemma 4.50", which is under "Not verifiable"; its statement in 13.5 (two parts, nonconstant outer polynomials, characteristic zero) was checked by the computations in the 13.5 row.

## Not verifiable

- Girondo–González-Diez, including **Lemma 4.50**, Theorems 4.48 and 4.49, and Propositions 1.89, 1.93 (R04): CUP, paywalled; no legal copy found. The numbering and the book's own hypotheses were not checked.
- Forster; Szamuely; Lando–Zvonkin; Fried; Weil; Deligne; Serre; Dixon–Mortimer; Cori–Machì; Sijsling–Voight; the published numbering of Stix's Definition 37(i); Couveignes: not in the sample and not fetched this round.
- The LMFDB pages (`3T2-3_2.1_2.1-a`, `5T1-5_5_5`, `4T1-4_4_2.2-a`, the thirteen records of degree at most 4) were read by the previous review and not fetched again.

## Source issues

- none
