# Review of TemperleyLieb (pull request #58 at 6d5a5c7)

**Verdict:** accepted

No P1 or P2 finding. The gate passes at this head (every check, including the targeted build and
the dependency check). Four P3 notes follow; they are the author's to take or leave. The
adversarial table, the declarations opened at the pins and the citations resolved are under
"Verified sound".

## R01 (P3) — Executable milestones in a mathematics roadmap

Location: `TauCetiRoadmap/TemperleyLieb/README.md` Layer 0, bullet "A computable evaluator"
("Provide `qIntAux : R → ℕ → R` by the ℕ-recurrence … use it wherever a milestone below asks for
evaluation"); Layer 1 ("The Dyck encoding doubles as the efficient composition algorithm later (a
stack machine that also counts the circles it closes)"); Layer 6 ("Milestone: a `#eval`-able
computation of any single coefficient").

Claim: three milestones ask for executable procedures (an evaluator, a stack machine, an `#eval`
computation) rather than mathematical statements.

Witness: the house rule "Mathematics, not algorithms: no executable procedures, certificates,
implementations"; the mathematics these bullets stand on is already present as theorems (the
Chebyshev identities of Layer 0, the Dyck equivalence and circle count of Layers 1–2, Morrison's
Proposition 5.1 in Layer 6).

Repair: delete the `qIntAux` bullet (the values `[0] = 0`, `[1] = 1`, `[2] = δ`, `[3] = δ² − 1` are
Checks of `qInt`; I closed the first three by `simp` against the pin, the last reduces to
`δ ^ 2 = δ * δ`); replace the stack-machine sentence by the theorem it encodes (composition of
Dyck-encoded matchings, with the number of closed circles, agrees with gluing); restate the Layer 6
milestone as "the coefficient of every diagram in `f_n` is given by Morrison's formula", with
`f_2`, `f_3` and one diagram admitting two admissible removal sequences as its Checks. The
`DecidableEq` and `Fintype` instances of Layer 1 are mathematics and stay.

## R02 (P3) — Process narrative

Location: `README.md` lines 49–50 ("That roadmap is on `main`, but its API is not yet in Tau
Ceti. Treat the pivotal/spherical API as a declared dependency on a roadmap, not as material
already available."); line 145 ("(a grep of the pinned toolchain finds nothing usable for any of
these)"); lines 14–18 ("attempted and abandoned more than once … none of it survives as usable
material").

Claim: these sentences describe the state of the repository at the time of writing, which the
roadmap rules forbid ("Roadmaps are timeless"; "Don't call an item blocked because an earlier
roadmap is still being implemented; point at that roadmap instead").

Witness: `README.md` of the repository, section "Writing a roadmap", bullet "Roadmaps are
timeless".

Repair: replace lines 49–50 by "The pivotal, spherical, balanced and ribbon API is supplied by the
pivotal and spherical categories roadmap (its Layers 0–2 and 10) and consumed here"; delete the
grep parenthetical (the preceding sentence already states what Mathlib lacks); shorten the Zulip
sentence to a pointer ("earlier Lean discussions of the Temperley–Lieb algebra and the Jones
polynomial: Zulip, new members > knot theory, 2022-05").

## R03 (P3) — Three locator wordings

Location: `README.md` Layer 1, bullet "The shared noncrossing-partition carrier"; Layer 6, bullet
"The coefficient formula"; References, the Chen entry.

Claim and witness, one each:

- The RandomMatrices section is cited as "Finite combinatorial prerequisite for Milestones 3, 4,
  and 6"; on main it is titled "Finite combinatorial prerequisite for Layers 3, 4 and 6"
  (`TauCetiRoadmap/RandomMatrices/README.md` line 750). The FreeProbability citation resolves:
  §F2 is at `TauCetiRoadmap/FreeProbability/README.md` line 184 and
  `FreeProbability.NoncrossingPartition` is the subtype of `Finpartition (Finset.univ : Finset (Fin n))`
  at `TauCetiRoadmap/FreeProbability/Suggested.lean` line 71, as the README says.
- Morrison's Proposition 5.1 is described as "a sum over the admissible removal sequences of a
  product of quantum-integer ratios, divided by a quantum factorial". The source states the
  coefficient as the sum over the index set of products of quantum integers, divided by the
  quantum factorial `[n]!` (morrison-jw-formula line 355–360, printed page 9); the ratios
  `[i]/[n+1]` are in Proposition 4.1 (line 287–299, pages 7–8). The sign convention (loops are
  `−[2]`) is as the README says (line 52–56).
- Chen's thesis is annotated "a careful, self-contained diagrammatic development of exactly
  Layers 1 through 7". Its chapters are generic Temperley–Lieb and Jones–Wenzl idempotents,
  Temperley–Lieb–Jones categories, skein theory, semisimplicity, the root-of-unity quotient and
  Turaev–Viro (chen-tl-categories lines 42–101); it has no cellular algebras, Gram determinants or
  monoidal presentations.

Repair: "Layers 3, 4 and 6"; "a sum over the admissible removal sequences of products of quantum
integers, divided by the quantum factorial `[n]!`"; "a self-contained diagrammatic development of
the category, the Jones–Wenzl projections, the Karoubi envelope and the root-of-unity quotient
(Layers 2, 3, 6 and 7)".

## R04 (P3) — Checks not attached to every definition

Location: `README.md` Layers 2, 3, 4, 6 and 7.

Claim: the roadmap's tests are concentrated in "Worked examples" and in ⚠ notes; several
definitions have fewer than three discriminating Checks of their own: the corner-dragging
equivalence `TLDiagram (n+1) m ≃ TLDiagram n (m+1)` (none), the Kauffman braiding and twist (one:
`θ₁ = −A³`), `condExp` (two identities), `CellModule`/`cellForm` (the rank and `G_{3,1}`),
`negligibleIdeal` (one), the lifted `MonoidalCategory (Mat_ C)` and `MonoidalCategory (Karoubi C)`
instances (none), `MonoidalIdeal`/`MonoidalQuotient` (the non-additive negative test and the
`ℤ/6` non-example), `TLCat.lift` (none beyond its universal property).

Witness: the house shape ("every definition keeps its API list and at least three discriminating
Checks"); the sibling roadmaps on main share the older shape, so this is a note, not a defect of
the mathematics.

Repair: add a `**Checks.**` list to each, for instance: corner-dragging sends `e₁ : 2 → 2` to
`cup ⊗ 𝟙 … `, i.e. to the diagram `3 → 1` with one cap, and is inverse to its reverse drag; the
braiding satisfies `σ ≫ σ⁻¹ = 1` with `σ⁻¹ = A⁻¹·1 + A·e` and is not an involution unless
`A⁴ = 1`; `condExp e_n = 1_n` and `condExp 1_{n+1} = δ·1_n`; the negligible ideal is `0` when every
`[k] ≠ 0`, contains `1_1` at `δ = 0`, and contains `f_2 = 1 − e₁` at `δ = 1`; the lifted tensor
on `Mat_` of the one-object category `K` is the Kronecker product with the rank-one object as
unit, `(X, p) ⊗ (Y, q) = (X ⊗ Y, p ⊗ q)` is again an idempotent, and the embedding sends
`of 1 ⊗ of 1` to `of 2`.

## Verified sound

**Gate and tooling.** `gate.md` at 6d5a5c7: every check passes (`build=0`, `depcheck=0`,
`set_option=0`, `sorry-data=0`, `stray-files=0`, `outside-folder=0`). `git diff --stat
origin/main...HEAD` outside the folder: empty. Dependency check (`--movable`):

    depcheck: 162 roadmaps, 1171 edges, 0 problem(s)

No UPWARD or CYCLE line; no `moved:` line.

**Elaboration.** The worker's targeted build passed. I elaborated a scratch copy of the three
definitions with the eight headline statements under one-tactic probes (`rfl`, `simp`, `simp_all`,
`infer_instance`, `decide`, or `exact` with `Module.Free.chooseBasis`): every probe fails with the
goal unchanged, so no headline is padding. The same file `#check`ed the library declarations
below; the roadmap's own declarations carry every binder explicitly (the file has no `variable`
line), so no hypothesis can drop silently. The two proved `example`s (nested versus crossing
pairing on four points; Tau Ceti's spin-model trace is an `IsMarkovTrace`) test the definitions
against the pin and are the only proved declarations.

**Library declarations opened at the pins** (Mathlib `6b7abb3c76`, Tau Ceti `a91d3aafa8`):

- `Polynomial.Chebyshev.S : ℤ → R[X]` with `S_neg_one = 0`, `S_zero = 1`, `S_one = X`,
  `S_add_two` (`Mathlib/RingTheory/Polynomial/Chebyshev.lean` lines 627–658): `qInt R δ n` is
  `[n]` with `[0] = 0`, as the README says.
- `catalan` (`Mathlib/Combinatorics/Enumerative/Catalan/Basic.lean` line 52);
  `DyckWord.card_dyckWord_semilength_eq_catalan : Fintype.card {p // p.semilength = n} = catalan n`
  (`…/DyckWord.lean` line 545).
- No `MonoidalCategory` or `Linear` instance on `Mat_` or `Karoubi` anywhere under
  `Mathlib/CategoryTheory/Monoidal/`, `…/Idempotents/`, `…/Preadditive/Mat.lean`: the README's
  "bare categories only" claim holds at the pin. `FreeMonoidalCategory.project : (C → D) →
  FreeMonoidalCategory C ⥤ D` (`…/Monoidal/Free/Basic.lean` line 361). `ExactPairing`,
  `RigidCategory` (`…/Monoidal/Rigid/Basic.lean` lines 77, 732); `Functor.Monoidal`
  (`…/Monoidal/Functor.lean` line 389); `NatTrans.IsMonoidal`
  (`…/Monoidal/NaturalTransformation.lean` line 46). `End` multiplication "agrees with
  `Function.comp`, not with `CategoryStruct.comp`" (`…/Endomorphism.lean` lines 30, 44–45).
  `IsSemisimpleRing` (`Mathlib/RingTheory/SimpleModule/Basic.lean` line 73).
- `TauCeti.TemperleyLieb R δ n := RingQuot (Rel R δ n)` over `CommSemiring R`, with `Rel` the three
  relations on `FreeAlgebra R (Fin (n - 1))` (`TauCeti/Algebra/TemperleyLieb/Basic.lean` lines
  106–131); `e`, `lift`, `lift_e`, `hom_ext`, `strandIncl` (sends `e i` to `e i.castSucc`, lines
  233–240), `aug` with `aug_e` (lines 246–252), `algEquivOfLeOne` (line 270).
- `markovTrace q hδ` with `hδ : δ = -(q + q⁻¹)`, `markovTrace_one`, `markovTrace_mul_comm`,
  `markovTrace_strandIncl`, `markovTrace_strandIncl_mul_e_last` with exactly the four shapes of
  `IsMarkovTrace` (`…/MarkovTrace.lean` lines 452–496; the sign is `sum_markovWeight`, line 125).
- `TauCeti.PerfectMatching α = {f : Equiv.Perm α // IsPerfectMatching f}`, `congr`, `fiberEquiv`
  (`TauCeti/Combinatorics/Enumerative/PerfectMatching.lean` lines 71, 98, 244, 282).
- `BrauerDiagram k := PerfectMatching (Fin k ⊕ Fin k)` with `inl` the bottom and `inr` the top
  points, caps joining bottom points (`…/Brauer/Diagram.lean` lines 15, 23, 60);
  `composeDiagram D₁ D₂` places `D₁` above `D₂` (`…/Compose.lean` line 288–294);
  `composeDiagram_assoc` (`…/Associativity.lean` line 361); `middleLoopCount`
  (`…/LoopCount.lean` line 139). The README's relabelling and its order reversal for `f ≫ g`
  agree with these conventions.
- `TauCeti.MorphismIdeal` with `comp_mem_left`/`comp_mem_right`, `smul_mem`, `Quotient`,
  `quotientFunctor`, `quotientFunctor_map_eq_zero_iff`, `lift`, `Linear R` instance
  (`TauCeti/CategoryTheory/Preadditive/MorphismIdeal/Basic.lean` lines 85–345); zero objects and
  finite biproducts of the quotient (`…/Additive.lean` lines 43–52).
- `TauCeti.BraidGroup` (`TauCeti/GroupTheory/SpecificGroups/Braid/Basic.lean`),
  `TauCeti.TemperleyLieb.jones` (`TauCeti/KnotTheory/TemperleyLieb.lean` line 135),
  `TauCeti.MarkovEquiv.jonesTrace_eq` (named there, lines 31, 62, 222).

**Cross-roadmap citations resolved on main (c994070).**

- PivotalSpherical: `IsFiniteSemisimpleCategory` on a `k`-linear abelian category and
  `SimpleClasses` (Layer 3, `TauCetiRoadmap/PivotalSpherical/README.md` lines 352–385); the fusion
  hypotheses exactly as this README lists them, including `MonoidalPreadditive`, `MonoidalLinear`,
  `Simple (𝟙_ C)` and Hom-finiteness (Layer 4, lines 389–398); balanced and ribbon definitions
  (Layer 10, lines 568–576). The README's "fusion hypotheses of that roadmap's Layer 4" is exact.
- SchurWeyl (seeded target "Boundary with Schur–Weyl"): Layer 9 builds `brauerDiagram`,
  `brauerAlgebra δ k`, `composeDiagram`, `middleLoopCount`, `compose_assoc`
  (`TauCetiRoadmap/RepresentationTheory/SchurWeyl/README.md` lines 399–415) and refers its cell
  theory to "TemperleyLieb Layer 5" (lines 474–475), so "the cellular-algebra infrastructure of
  Layer 5 is built here and consumed there, as that roadmap says" is what that roadmap says.
  (Seeded target "Brauer diagram combinatorics"): the fixed-size part is at the pin as listed
  above; what the README keeps (gluing `n → m → p`, the cyclic encoding, the Dyck model,
  associativity of the total circle count) is absent from `TauCeti/Combinatorics/Brauer/`, whose
  files are all for `BrauerDiagram k` of one size.
- RandomMatrices section (title drift, R03) at line 750; FreeProbability §F2 at line 184 and
  `NoncrossingPartition` at `Suggested.lean` line 71; CombinatorialHeegaardFloer grid diagrams and
  Cromwell moves at lines 99–101 and 167 (cited in Non-goals only).

**Ownership.** Searched main and the open roadmap pull requests for Jones–Wenzl projections,
cellular algebras, monoidal structure on `Karoubi`/`Mat_`, tensor-ideal quotients, presented
monoidal categories and planar matchings. Consumers, not owners: TemperleyLiebOperatorAlgebras
(A1 consumes `presentedTLEquiv`), Subfactors (consumes `existsUnique_jonesWenzl` and
`IsMarkovTrace.apply_jonesWenzl`), QuantumGroups on main. MotivesAndAlgebraicCycles builds the
Karoubi envelope of twisted correspondences and the numerical-ideal quotient for motives only, not
a general monoidal envelope. No other roadmap states presented monoidal categories, cellular
algebras, or the monoidal structure on the envelope or on a morphism-ideal quotient, so this
roadmap is their owner. Note for the board, not a finding here: the merge order currently lists
TemperleyLiebOperatorAlgebras and Subfactors before TemperleyLieb although both consume it; those
edges are theirs.

**Sources verified at the text.** goodman-wenzl-ideals (arXiv math/0206301v1): Proposition 1.1 on
page 4 (line 125), §2.4 on page 7 (line 337), Theorem 3.3 on pages 10–11 (lines 778–806), the
embeddings and their left inverses dividing by `d` on page 3 (lines 76–87). ridout-saint-aubin
(arXiv 1204.4505v4): Theorem 4.7 on page 20 (line 1120), `det G_{n,p} = Π_{j=1}^{p}
([n − 2p + 1 + j]/[j])^{d_{n,p−j}}`, which is the README's formula with `k = n − 2p` and
`m_j = halfCount n (k + 2j)`; the semisimplicity remarks after Corollary 4.8 on page 21 (lines
1157–1161: `β = ±2` and `β = 0` with `n` odd). morrison-jw-formula: see R03. chen-tl-categories:
see R03.

**Adversarial table.**

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| `qInt` convention | n = 0, 1, 2, 3 | `S_{-1} = 0`, `S_0 = 1`, `S_1(δ) = δ`, `S_2(δ) = δ² − 1`; first three closed by `simp` at the pin | sound | none |
| `exists_qInt_eq_zero_iff` | δ = 2, −2, 0, 1; `𝔽̄_p` | δ = 2: `[n] = n ≠ 0`, RHS needs ζ ≠ 1: both false; δ = −2: `[n] = (−1)^{n−1} n`, both false; δ = 0: `[2] = 0`, ζ = i, `i + i⁻¹ = 0`, both true; δ = 1: `[3] = 0`, ζ = e^{2πi/6}, `ζ + ζ⁻¹ = 1`, both true; `𝔽̄_p`, δ = 2: `[p] = 0` with no admissible ζ, excluded by `CharZero` | sound | none |
| `PlanarMatching` predicate | nested {0,3},{1,2}; crossing {0,2},{1,3} | nested: (a,b) = (0,1): σ1 = 2 ∈ (0,3); (0,2): σ2 = 1 ∈ (0,3); (1,2): vacuous; crossing: (0,1): σ1 = 3 ∉ (0,2) | admits/excludes as claimed (both by `decide` in the file) | none |
| `card_planarMatching` | k = 0, 1, 2, 3 | 1 = catalan 0; 1 = catalan 1; 2 of 3 = catalan 2; 5 of 15 = catalan 3 | sound | none |
| `exists_basis_planarMatching` | n = 0, 1, 2; zero ring; δ = 0 | TL_0 = R and TL_1 = R (`algEquivOfLeOne`) with one matching; TL_2 = R ⊕ R e, catalan 2 = 2; zero ring: both sides trivial, a basis exists; δ = 0: the ℤ[X]-form is free on diagrams and base-changes | sound | none |
| `IsMarkovTrace` vs Tau Ceti | proved example; sign | four fields match the four Tau Ceti lemmas; `sum_markovWeight = −(q + q⁻¹)` so δ = −(q + q⁻¹) is `q ↦ −q` | sound | none |
| `existsUnique_isMarkovTrace` | n = 0, 1; n + 2 | tr 0 1 = 1, tr 1 1 = δ fix the rank-one algebras; on n + 2: tr(incl a) = δ tr a; tr(incl a · e_last · incl b) = tr(incl(ba) · e_last) = tr_{n+1}(ba); normal form uses `e_last` at most once; right closure satisfies all four at every δ | existence and uniqueness sound | none |
| `isSemisimpleRing_of_qInt_ne_zero` | n = 2, 3, 5; char 2 | n = 2: `K[e]/(e² − δe) ≅ K × K` iff δ ≠ 0; n = 3: dets `[3]`, 1; n = 5: dets `[3]⁴(δ² − 2)`, `[5]`, 1 with `[4] = δ(δ² − 2)`, all nonzero under the hypothesis in any characteristic (the identity is in ℤ[X]) | sound; `[2] ≠ 0` is unused at n = 3, as the docstring says | none |
| `isSemisimpleRing_iff_of_charZero` | δ = 0 with n = 2, 3, 4, 5, 7; `𝔽̄₂`; δ = 1, n = 3; δ = 2 | n=2: `K[e]/(e²)` not semisimple, RHS false; n=3: dets −1, 1, RHS `δ = 0 ∧ Odd 3`; n=4: `det G_{4,0} = [2]²[3] = 0`, RHS false; n=5: dets −2, 1, 1, RHS true; n=7: `gramPoly 7 1 = ±2^{m₂}`, `gramPoly 7 3 = ±3`, `[7] = −1`, RHS true; over `𝔽̄₂`, n = 5: −2 = 0 so LHS false while RHS true, excluded by `[CharZero K]`; δ = 1, n = 3: `[3] = 0`, both false; δ = 2: `[n] = n`, both true | sound | none |
| `existsUnique_jonesWenzl` | n = 0, 1, 2; R = ℤ, δ = 2 | n ≤ 1: f = 1; n = 2: f = 1 − δ⁻¹e, `e f = e − e = 0`, `aug f = 1`; uniqueness: `f − 1 ∈ ker aug = (e_i)` gives `f f' = f = f'`; ℤ, δ = 2: `(1 + ae) e = (1 + 2a) e ≠ 0`, no f, and `[2] = 2` is not a unit, hypothesis real | sound | none |
| `IsMarkovTrace.apply_jonesWenzl` | n = 0, 1, 2; general | tr 0 1 = 1 = `[1]`; tr 1 1 = δ = `[2]`; tr(1 − δ⁻¹e) = δ² − δ⁻¹·δ = `[3]`; Wenzl recursion gives δ`[n+1]` − `[n]` = `[n+2]` | sound | none |
| Gram anchors (Layer 5) | (2,0), (3,1), (4,0), (4,2), (5,1) | `[2]`; `[[δ,1],[1,δ]]` has det δ² − 1 = `[3]`; `[2]²[3] = δ²(δ² − 1)` (both README forms agree); `[4]`; `[3]⁴[4]/[2] = [3]⁴(δ² − 2)`; all match RSA (4.20) | sound | none |
| `halfCount` | (4,2); Σ_k at n = 4; (4,1) | `C(4,1) − C(4,0) = 3`; `2² + 3² + 1² = 14 = catalan 4`; off-parity formula gives 3 while the count is 0 | sound, negative control real | none |
| Layer 2 bimodule negative test | A = ℚ³, path 1–2–3; A = ℚ² | d = (1,2,1): on `M₁₂` left 1, right 2, both snakes hold; A = ℚ²: d = e₁ acts by 1 on both sides of `V = A e₁`, by 1 and 0 on `M₁₂` | both examples correct | none |
| Layer 3 evaluation and monos | B = [[0,q],[1,0]]; δ = 0; ℤ/6 | `B B⁻¹ = I`, `Σ (B⁻¹)_{ij} B_{ij} = q + q⁻¹`; `e_i ≫ D = δ D`, `D ≫ D̄ = δ^{arcs + 2·circles}·1`; the circled empty diagram is δ·1: zero at δ = 0, the zero-divisor 2 over ℤ/6 at δ = 2 | sound | none |
| Layer 5 cell action | `End` product | `(a * b)* ≫ u = (a* ≫ b*) ≫ u = a* ≫ (b* ≫ u)`: star-twisted precomposition is a left action, plain precomposition a right one | sound | none |
| Goodman–Wenzl, Prop 1.1 critique | TL₃, δ(τ) = 1 | `p = e₁/δ`, `x = e₁e₂/δ − e₁/δ²`: `px = x = xr`, `xp = x² = 0`, so `E = p + (t − τ)x` is idempotent; `EAF = span((t − τ)x)` has dimension 1, `p(τ) r(τ) = 0` has dimension 0 | the README's counterexample is correct | none |
| Goodman–Wenzl at δ = 0 (sub-target) | single diagrams; `f = 1₃ − e₁e₂ − e₂e₁` | `(cup ⊗ 1) ≫ (1 ⊗ e₁) ≫ (cap ⊗ 1) = 1₁` with no circle; `f` is killed by all four un-whiskered functionals on three strands but `a ≫ (1 ⊗ f ⊗ 1) ≫ b` with `a = b = (12)(45)` gives `−2·1₁` | the case is plausible and needs its own argument, as the README says | none |
| Layer 7 negative tests | `f ⊗ g = f^{2^m} g^{2^n}`; ℤ/6; `K(• → •)`; `K[ε]` | both bracketings give `f^{2^{m+p}} g^{2^{n+p}} h^{2^{n+m}}`; `I(n) = 3^{2^n}ℤ` closed under whiskering; `1 ≡ 4 (mod 3)` but `1 ≢ 16 (mod 9)`; idempotent 3 has ranks (1,0) against (n,n); the radical inclusion `P₂ → P₁` is mono and epi in projectives; ε has no kernel | all four correct | none |
| Karoubi worked examples | δ = 1; δ = φ | `[3](1) = 0`, `X₁ ⊗ X₁ = X₀ ⊕ X₂` with `X₂` negligible; `[2] = [3] = φ`, `[4] = 1`, `[5] = 0`, even part `X₂ ⊗ X₂ = X₀ ⊕ X₂` | sound | none |
| Conventions | cup/cap; `End`; Brauer | `cup ≫ cap = δ·1₀`, `cap ≫ cup = e₁`; `x * y = y ≫ x` at the pin; `inl` bottom, `inr` top, `D₁` above `D₂`, so `f ≫ g ↦ composeDiagram (im g) (im f)` | sound | none |

## Not verifiable

- Graham–Lehrer, *Cellular algebras*, Invent. Math. 123 (1996), §3 (the semisimplicity criterion
  over a field): paywalled at the publisher; no open copy found. Cited by locator only
  (uncertified). The statement used is standard.
- Westbury, Math. Z. 219 (1995): paywalled; cited for the Gram determinants, which I verified in
  Ridout–Saint-Aubin instead.
- Wenzl, *On sequences of projections*, C. R. Math. Rep. Acad. Sci. Canada 9 (1987): not online;
  the quadratic recursion was checked by computation (table rows on Jones–Wenzl).
- Kauffman–Lins, Princeton 1994: a book, not online.
- Goodman–Wenzl is cited by the Comm. Math. Phys. appendix pagination ("pp. 10–11", "p. 4"); I
  verified those page numbers against the arXiv version math/0206301v1, where they hold. The
  published appendix (paywalled) may be paginated differently.

## Source issues

- **Error** in goodman-wenzl-ideals at Proposition 1.1, printed page 4: the source says the
  dimension of `eAf` is unchanged by specialization for the span `A` of an arbitrary set of
  diagrams; it should require `eA ⊆ A` and `Af ⊆ A`, which its four-corner sum uses; affects the
  proof (of Theorem 3.3, page 11, through the displayed dimension chain).
- **Gap** in goodman-wenzl-ideals at Theorem 3.3, printed page 11: the source says the first
  equality of its dimension chain follows from constancy of dimension; it should show that
  multiplication by `z_α` carries the lattice `e T_n f ⊗ 1_m` to a saturated lattice, which the
  stated principle does not give; affects the proof.
- **Gap** in goodman-wenzl-ideals at Section 1.1, printed page 3, and Theorem 3.3: the source
  says the embeddings have left inverses, which divide by `d`, and never defines "proper root of
  unity"; it should exclude or treat `τ = i` (`d = 0`, `ℓ = 2`), which Theorem 0.1 excludes and
  §2.4's setup admits; affects the proof.
