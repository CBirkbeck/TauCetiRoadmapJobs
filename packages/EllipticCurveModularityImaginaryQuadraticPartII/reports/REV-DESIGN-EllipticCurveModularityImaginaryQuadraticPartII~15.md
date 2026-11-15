<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16328#issuecomment-6902543171 -->
Review (claude) of 3f36ffb

Verdict: accepted
Conditional on the announced gaps: `acc-torsion-inertial-comparison`

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

No finding. The single finding of round 14 is repaired, the repaired pattern does not recur, every
sampled locator is at its line and supports the statement, every statement recomputed below holds,
every supplier citation resolves at the supplier's current head, and the dependency check shows no
UPWARD or CYCLE line. The acceptance is conditional on the declared supplier gap
`acc-torsion-inertial-comparison` (AutomorphicGaloisRepresentationsPartII AG2.5), which is a contract
and no finding. This is a design: there is no `Suggested.lean`, and elaboration is not available
(this lane does not elaborate).

There are no maintainer notes for this roadmap.

## Verified sound

### The round-14 finding

- **F01 (P3, the record of the letter `F`): repaired.** `packages/EllipticCurveModularityImaginaryQuadraticPartII/design/README.md`
  lines 115–123 now read "The field `F = K(μ_n)` is meant in the Summary, Scope and ownership, How to
  read the build, Layers 2 and 8, §7.5 and Layer 1 outside §1.2 … in Downstream consumers it is the CM
  field of ModularityAndLanglandsExtensions §2.29 … The letter `F` never denotes a finite field". The
  four lines the finding named (27, 39, 344, 1446) are covered.

The repair also extended the records of `t`, `U`, `G_D` and `χ`, and renamed a finite field from `F`
to `k` in §3.1, in the ArithmeticGaloisRepresentations §7.7 contract and in one `plan.json` supplier
entry. I read the whole diff and checked each record against every section:

| Record (changed text) | Places read | What was found | Result |
|---|---|---|---|
| `F = K(μ_n)` in Summary, Scope, How to read the build, Layers 2, 8, §7.5, Layer 1 outside §1.2 | lines 10, 27, 39, 344, 367, 422, 439–449, 472–483, 1355, 1408 | each is `K(μ₃ₚ)`, and `n = 3p` | holds |
| own `F` in §1.2, Layers 4–6, §7.4 | §1.2 "Let `K ⊆ F`"; §4.1, §4.3, §5.1, §6.1, §6.2, §7.4 "Let `F` be …"; Layer 4 and 6 Examples | each bound by its own sentence | holds |
| Layer 3 has only `F_v`, `F'_w` | §§3.1–3.5 and Examples | finite fields are `k`, `𝔽₅`, `𝔽₃`, `𝔽₇`, `𝔽₂₅`; no bare `F` | holds |
| supplier contracts | Tau Ceti Euler characteristic; CrystallineLocalGlobalCompatibilityCM §8.7 `ζ_p ∈ F`, §9.10 `[F⁺:ℚ]`; Supplier obligations | finite extension of `ℚ_ℓ`; CM field; CM field of ACC23 line 2309 | holds |
| "`F` never a finite field" | every code span with `F` | `(F-ss)` is Frobenius semisimplification; `𝔽_p` is another letter | holds |
| `t` | Summary, Scope line 58, the parent's contract (`B_t ⊗ χ_(h(t))`), §§4.3, 5.2, 5.4 | curve parameter in the three named places; `t = \|T\|` in Layers 4–5 only; `t_p(σ)`, `t_{v,i}(σ)` are subscripted symbols | holds |
| matrix `U` / open `U` | Frobenius witness, §§3.1–3.4, 4.2, 6.1; `U(K)` in §§2.1, 2.2, 7.1, 7.2, 7.5 | no use outside the record | holds |
| `D`, `D_t`, `G_D` | Layer 3; §7.1; §7.5 and the parent's §7.4 contract | as recorded | holds |
| `χ = (χ_v)` | Layer 5; the `𝒮_χ` contract | as recorded | holds |

In §7.5 the name `F_avoid` is the datum of §7.4, taken there over the base `K`; it is a subscripted
name, as `F_v` is, and needs no change.

### Sources: the seeded sample

No locator is flagged unverified. All eight manifest texts are in the cache; nothing was fetched and
the manifest is unchanged. CaptainSude26 was read in full (lines 1–720), LeHung26 at lines 60–135 and
265–375.

| Target | Read at | Result |
|---|---|---|
| 1.1 | MilneCM lines 273–300 (page marker p. 10 at line 265): Proposition 1.4 at 273, Corollary 1.5 at 292, Remark 1.6 at 296; LeHung26 line 357 (p. 9) | as cited; (a) uses the composite, (b) the commutator criterion |
| 1.2 | LeHung26 lines 308–321, last sentences at 318–321 | the source asserts the two properties over `K`; the descent statement is the roadmap's own and is proved in the text |
| 2.1 | LeHung26 line 336 (§4.5(1)), lines 342–355 (§4.6 and Remark 4.2); CN23 line 4513 (Theorem 6.1: `ζ₅ ∉ F`, decomposed generic, irreducible on `G_{F(ζ₅)}`) | supported |
| 3.1 | CaptainSude26 lines 187–192, 224, 234 | basis and `Ad(U)` at 187–191, trace form at 224, `M^G = 0` at 234 |
| 3.3 | CaptainSude26 lines 177–183, 533–536 | supported; the source has `μ₅ ⊂ F_v`, `ρ̄(φ) = 1`, the roadmap the general form with its own proof |
| 3.4 | CaptainSude26 lines 184–220 | ring at 186, Cayley–Hamilton at 198, matrix of `N` at 199–203, Frobenius at 205–209 |
| 4.1 | CaptainSude26 lines 227–241 (Lemma 3.3 at 231) | supported |
| 4.2 | CaptainSude26 lines 242–263; AKT23 line 3979 (Lemma A.5, with the excluded `PSL₂(𝔽₅)` clause) | supported |
| 5.1 | CaptainSude26 lines 264–289; CN23 lines 4226–4260 (data (1)–(15), pp. 81–82) | conditions (i), (ii) are CN23 (5), (6); clause (15) at 4258 |
| 5.2 | CaptainSude26 lines 285–289; CN23 line 4361 | supported |
| 5.3 | CaptainSude26 lines 291–408, 299–314; CN23 lines 4334 and 4386–4390; ACC23 line 2346 | supported; `N` "depending only on `[F:ℚ]`" at CN23 line 4334 |
| 5.4 | CaptainSude26 lines 410–498 (dimensions at 480–481); CN23 line 4261 | supported |
| 6.1 | CN23 lines 4433–4509; CaptainSude26 lines 543–603, 582–588; ACC23 lines 7163–7187 | supported; ACC23's four conditions at 7165–7172, its example at 7173–7178 |
| 7.1 | CaptainSude26 lines 503–532 | supported; thicknesses at 512–516, order three of `1/j` at 526 |
| 8.1 | CaptainSude26 lines 26–33, 671–683; LeHung26 lines 125–128 | supported |

Also read: ACC23 lines 2309–2355 against the Supplier obligations (setting and conclusion agree,
`T = S − (R^c − R)` at line 2340); CN23 lines 3849–3872 (Theorem 5.2), 4545, 4562, 4574; CHT08 line
5723 (Lemma 4.1.2, p. 116).

### Adversarial table (values computed this round)

The sampled targets, the three headlines and the changed text. Every row was computed from the
README's statement.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.1(a) | `K = ℚ(i)`, `L = ℚ(ζ₂₀)`; `S` infinite with `L/K` finite; `S = {1,2}`; `K = ℚ(2^(1/3))` | `L` finite forces `L = K(μ_m)` for one `m`; `m ≤ 2` gives `L = K`; in `S₃` two transpositions multiply to a 3-cycle moving `2^(1/3)` | true for CM `K`; control fails |
| §1.1(b) | `ℚ(i) ⊂ ℚ(i,√5) ⊂ ℚ(i,√3,√5)`; `ℚ(√5) ⊂ ℚ(ζ₂₀)` | `c₁c₂` trivial on `L` hence on `K'`; `K' ⊇ K` totally complex; `ℚ(√5)` totally real | true; `K' ⊇ K` needed |
| §1.2(a) and converse | `1 ⊕ 1` over `𝔽₃`, `ℚ ⊂ ℚ(ζ₃)` | over `ℚ`, `q = 2 ≠ 3`: ratio `1 ≠ 2`; over `ℚ(ζ₃)`: split `q ≡ 1 mod 3`, ratio `1 = q` | descent holds, converse fails |
| §2.1 | `K₆₀`; imaginary quadratic `K` | `{a mod 60 : a ≡ ±1 mod 15, a ≡ 1 mod 4} = {1, 29}`; `29 ≡ 4 mod 5`, `29 ≡ 2 mod 3`; the parent's §7.4(1) lists the pair `(3,5)` with genericity over `F`; §5.3 is over any CM `L` with `ζ₅ ∉ L` | seed over `K`, not over `F` |
| Theorem 2.5 (headline) | `ℚ(i)`, `K₆₀`, `ℚ(i,√5)`, `ℚ(ζ₅)` | `ζ₅ ∈ K`: no, no, no (group `(ℤ/2)²` has no cyclic quartic quotient), yes | applies ×3, excluded |
| §3.1 | `X = [[x,y],[z,−x]]`; `diag(2,3)`; characteristic 2 | `UX − XU = [[z,−2x],[0,−z]]`, `UᵀX − XUᵀ = [[−y,0],[2x,y]]`: zero iff `x = y = z = 0` when `2 ∈ k^×`; `2·3⁻¹ = 2·2 = 4 = 3·3 = 3·2⁻¹` in `𝔽₅`; `tr 1 = 0` in characteristic 2 | invariants vanish iff `2 ∈ k^×` |
| §3.3 definition and API | finite group of unipotents in characteristic `p`; `F'_w/F_v` with `e = 3`, `e = 5`; `M`, `Φ` over `𝔽₅` | image is a quotient of `ℤ_p(1)` of exponent `p`: order `p`; `ρ̄(φ) = [[a,b],[0,d]]` conjugates `U` to `[[1,a/d],[0,1]]`, so `a/d = q_v`; image of `I_w` in `ℤ_p(1)` is `p^(v_p(e))ℤ_p(1)`: onto `ℤ/p` iff `p ∤ e`; `M² = [[−1,1],[−1,0]]`, `M³ = 1`, `Φ² = 1`, `ΦMΦ = [[4,1],[4,0]] = M² = M¹¹` | protected iff nontrivial unipotent; both controls separate |
| §3.4 | `N = ρ(τ) − 1`; `q_v = 11`; first-order lifts | `(1,2)` entry of `tr(N)N = det N` gives `tr N = 0`, then `det N = 0`; `ΦE₁₂ = qE₁₂Φ` gives `c = 0`, `a = qd`; `q(q+1)²δ² = (1+q)²ψ(φ)`; `11·144 = 1584`; `(1+εf)U` has trace `2 + ε`; parameters `a`, `b − 1`, `z − [z̄]` | equivalences hold; dimension three |
| §3.5(d), used by 4.1 | `p = 5`, `q_v ≡ 1 mod 5` | `Σ_{j<q} D^j = q + C(q,2)N + C(q,3)N² = 1`; cocycles: `ξ(τ) ∈ M`, `ξ(φ) ∈ k e` (4), coboundaries 2, `H¹` of dimension 2 | holds; `p ≥ 5` used |
| §4.1 | `G = SL₂(𝔽₅)`, `A = Gal(C_N/F)`; `ρ̄(I_v)` of order 2; `SL₂(𝔽₇)` | `H¹(G × A, M)`: `Hom(A, M^G) = 0`, so it is `H¹(G, M)`; a `k̄`-conjugate absolutely irreducible image is `k`-conjugate; `I_v` maps onto a Sylow 5-subgroup, index `24`; order 2 is invertible; `H¹(SL₂(𝔽₇), ad⁰) = 0` | holds; a protected place is needed at five only |
| §4.2 | `g = diag(2,3)`; `κ(γσ₀)`; `H_∅ = 0` | `det g = 6 = 1`; `Ad(g)` on `e, h, f`: `2·3⁻¹ = 4`, `1`, `3·2⁻¹ = 4`; `(Ad g − 1)M = ⟨e, f⟩`, a hyperplane; `κ(γσ₀) = κ(γ) + κ(σ₀)` as `γ` acts trivially; a degree-one unramified place has `e = f = 1` in every quadratic subfield | `H_{Q_N} = 0` with exactly `r` places |
| §5.1 | five-adic degrees of `F⁺` | each a multiple of 4 and `≥ 8`; `d/2 > a + a' ≥ 16` gives `d > 32`; `d = 36` forces all degrees 8, `8 ∤ 36`; `(8,8,24)`: `24 > 20` and `8 < 20`; five eights: `24 > 20` | least `d = 40` |
| §5.2, §5.4 | `d = 40`, `t = 10`, `R = ∅` | `1 + 10·(3 + 8) = 111 = 1 + 30 + 80`; `g = r − 120 − 1 + 10 ≥ 0` iff `r ≥ 111`; `dim R_∞ = 111 + 40 − 40 = 111`; `dim S_∞ = 1 + 39 + 111 = 151` | deficit `40 = l₀` |
| §5.3 | `v ∈ P` with trivial coefficients; `w = v^c`, `q_w = 11` | units act by 1, `P_{v,σ} = (X − 1)²`; with `χ_v`: `(X − χ_v(u))(X − χ_v(u)⁻¹)`; Iwahori index `12`, with the diamond kernel `60`; `det diag(1+ε, 1−ε) = 1 − ε² = 1`, eleventh power `diag(1+11ε, 1−11ε)` equal to itself in `𝔽₅[ε]` | `Q ∩ S^c = ∅` needed |
| §5.3 against ACC23 §3.1 | `S_aux = (S∪Q) ∪ (S∪Q)^c`, `R_aux = R ∪ P ∪ Q` | primes below `S` or ramified split in an imaginary quadratic subfield by (i); primes below `Q` by §4.2; five-adic places of `F⁺` split by (i) at five | ACC23's field hypotheses hold |
| §6.1 | `p_b = 109`, `p_c = 2617`, `q = 11`; `E = ℚ(√31,√59,√71)`; Hilbert symbol | `2617 = 6·436 + 1`; `109 ≡ 2617 ≡ −1 mod 11`; `−109 ≡ 1 mod 11`, a square; `2617 ≡ 1 mod 109`; `−109 ≡ 3 mod 4`, so two ramifies in `E_b`; `(−d_b, −d_c)_l = 1` at odd `l` and at `2` if `−d_b` were a 2-adic square, `−1` at `∞`: product `−1`; `31, 59, 71 ≡ 1, 4, 1 mod 5` and `9, 4, 5 mod 11`, squares; `16 − 2 − 2 = 12 > 8` | holds |
| Theorem 6.2 (headline) | `ζ₅ ∈ F`, (4) false; imaginary quadratic `F` | scalars of determinant one are `±1`; an even-order subgroup of `SL₂(𝔽₅)` contains `−1`; `[ℚ(ζ₅):ℚ] = 4 > 2` | image `SL₂(𝔽₅)`; second alternative empty for imaginary quadratic `F` |
| §7.1 | involution on three nodes; `2(P₀ + rT') = c₀`; `p = 101` | fixes 1 or 3; three fixed gives two rational curves meeting in three points, genus `3 − 2 + 1 = 2 ≠ 1`; `2P₀ ∈ ker`, so `2rT' = c₀ − 2P₀` has one solution in `ℤ/3`; thicknesses `2 + 1 = 1 + 1 + 1 = 3`; order `606`, `303·R_* = a/2` | type `I₃`, `q_A = s³λ(s)` |
| §7.2, §7.3, §7.5 (inputs of 8.1) | `v(s) = 1, 5, 7`; coefficient `3` transvections; `q` split in the normal closure | `v(Δ_min) = 3, 15, 21`; powers of `[[1,3],[0,1]]` give all upper unipotents, with the lower ones order `120`; `v ≠ v^c`; the parent's `switch_five` has no `ζ₅ ∉ F` hypothesis | hypotheses of 6.2 met over `L` |
| Theorem 8.1 (headline) | `ℚ(ζ₅)`, `ℚ(ζ₁₅)`, `ℚ(ζ₂₀)`, `K₆₀`, `ℚ(i,√5)` | `ζ₅ ∈ K`: yes, yes, yes, no, no; `K₆₀(ζ₅)`: only `1 ∈ {1,29}` is `≡ 1 mod 5`, so `ℚ(ζ₆₀)` | the two branches are exhaustive |

§§2.2–2.4 were reread and recomputed without change: the lifting primes are `p, 3, p` with the pairs
`(3,p)`, `(p,3)` and `V₁`; `χ_(h(t))² = 1`; at `q_v = 4`, `a = 4`: `T² − 4T + 4 = (T − 2)²`, unitary
roots `1, 1`; quadratic subfields of `ℚ(ζ₈)` are `ℚ(i)`, `ℚ(√2)`, `ℚ(√−2)`.

### Library, suppliers, order

- Pins `1b1ccf4b…` (Mathlib) and `2fd255d9…` (Tau Ceti), read from `lake-manifest.json`. Opened at the
  pins: `NumberField.IsCMField` (`Mathlib/NumberTheory/NumberField/CMField.lean:70`),
  `IsCyclotomicExtension.Rat.isCMField` (:564, hypothesis `∃ n ∈ S, 2 < n`),
  `NumberField.isTotallyComplex_of_algebra` (`…/InfinitePlace/TotallyRealComplex.lean:229`),
  `IsCyclotomicExtension` (`Mathlib/NumberTheory/Cyclotomic/Basic.lean:74`),
  `Matrix.SpecialLinearGroup.toGL` (`…/GeneralLinearGroup/Defs.lean:369`),
  `Matrix.SL2.commutator_eq_top` (`…/SpecialLinearGroup.lean:804`, hypotheses `a ≠ 0`, `a² ≠ 1`, which
  need `#k ≥ 4`), `Rep.FiniteCyclicGroup.groupCohomologyIsoOdd` (`…/GroupCohomology/FiniteCyclic.lean:114`),
  `groupCohomology.map` (`…/GroupCohomology/Functoriality.lean:141`),
  `TauCeti.ClassFieldTheory.eulerCharacteristic_mixed` (`…/EulerCharacteristic/Theorem.lean:98`),
  `TauCeti.ClassFieldTheory.tateDualityPairing_perfect_mixed` (`…/Duality/Perfect.lean`). Neither
  library has `adZeroRep` or a decomposed-genericity predicate (search of both trees: no file).
- Cross-roadmap citations, resolved now. The citation resolver lists no missing section; its three
  leads are source keys followed by a section, and its Lean-name lead `ResidualImage.adZeroRep` is a
  declaration of ArithmeticGaloisRepresentations §7.9 (line 5249 of that README). Statements read
  against their use, at the open heads:
  - EllipticCurveModularityImaginaryQuadratic: `switch_five`, `hilbert_local_selection`,
    `auxiliary_local_types`, `solvable_preparation`, `seed_modular` (§0.3); `cubic_character_elliptic`
    (4.2); `cyclotomic_switch_field` (§5.1); `potentiallySemistableCM` (§5.2, `L` CM); `cm_modularity`
    (5.3, any CM `L` with `ζ₅ ∉ L`); `local_type_opens` (§6.5); `simultaneous_specialization` (7.4, any
    number field, pairs `(3,p)`, `(3,5)`, `(p,3)`, the image of `G_D` containing the geometric
    monodromy, non-CM); `character_automorphy_change_prime` (§8.1); 8.2 "Now specialize to imaginary
    quadratic K"; the field `ℚ(ζ₁₅+ζ₁₅⁻¹, i)` in *Downstream consumers and boundaries*.
  - PotentialAutomorphyInfrastructure §2.1, §2.3 (base and extension CM or totally real, soluble
    Galois, parts (1) and (2) with irreducibility), §2.5 (cyclic of degree `N` over any number field,
    prescribed places split).
  - AutomorphicGaloisRepresentationsPartII AG2.7 (`IsDecomposedGenericPrime`,
    `decomposedGenericPrime_local`, `IsDecomposedGeneric`); AG2.0 and AG2.5 headings.
  - MordellLawrenceVenkatesh §1.3 (the criterion by products of complex conjugations).
  - ArithmeticGaloisRepresentations §§2.1, 4.3, 6.3, 7.2, 7.7 (Sylow injectivity, coefficient change,
    `H⁰ = H¹ = 0` for `#F ≠ 5`, `H¹(SL₂(𝔽₅), ad⁰)` one-dimensional), 7.9.
  - CrystallineLocalGlobalCompatibilityCM §7.5, §§8.2–8.7, 9.1, 9.3–9.12; GlobalGaloisDeformations
    §§3.4, 3.6, 3.7, 5.1, 5.5, 5.6; LocalGaloisDeformationRings §§1.10, 2.3, 2.5, 2.6, 2.8, 2.15, 2.16,
    2.21; ModularityAndLanglandsExtensions §§2.29, 2.30.
  - On main: EllipticCurves, ClassFieldTheory, SchemeAndStackFoundations; Chebotarev Layer 10 under
    `Completed/`.
  All 17 open suppliers are in the merge order (lines 43–197), each before the parent's successor
  position. No roadmap of the never-cite list is cited.
- Gap `acc-torsion-inertial-comparison`: the same slug in `plan.json` (`gaps`: supplier
  AutomorphicGaloisRepresentationsPartII, section AG2.5, needed by 5.3) and in the README (Supplier
  obligations, §5.3 *Needs*, Layer 5 Dependencies). Its setting and conclusion agree with ACC23 lines
  2309–2355. AG2.5 at its head does not state the theorem (the only matches for "3.1.1" in that README
  are other papers). Precise, minimal, declared.
- Dependency check:

```text
candidate: EllipticCurveModularityImaginaryQuadraticPartII is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 239 roadmaps, 2271 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

### Duplication and overlap

`scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id and no id
defined only by a revision; main has no folder of this name, so there is no second copy. The board
index lists AnalyticNumberTheory and LawrenceVenkateshMethod, both unrelated. Searches of main and
every open head, by object: "protected place", "unipotent-inertia" and the cited manuscript (no
match outside this roadmap); a width-three degeneration (one unrelated match in
AlgebraicModularFormsAndSerreWeights); ACC Theorem 3.1.1 (cited by PotentialAutomorphyInfrastructure
as AG2.5, stated nowhere: the gap); cyclotomic extensions of CM fields
(EllipticCurveModularityTotallyReal §1.1 owns `realCyclotomic_isCMField` over a totally real base
and names this roadmap for CM bases; its §1.1 has no statement over a CM base or about intermediate
fields).

Overlap check: read EllipticCurveModularityImaginaryQuadratic, EllipticCurveModularityTotallyReal, PotentialAutomorphyInfrastructurePartII, CrystallineLocalGlobalCompatibilityCM, OrdinaryAutomorphicFormsAndModularityLiftingPartII (the lists on main and by results are empty); nothing shared.

### Shape, headlines and policy

Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, eight
layers each ending in Examples and Dependencies, Downstream consumers, References. `plan.json`
parses: 28 targets (3 definitions with 4, 4, 3 tests; 24 theorems with 3 to 6; one example with 2),
21 suppliers, one gap. Every theorem has its hypotheses, a locator and a *Needs* line. Headlines:
Theorems 2.5, 6.2, 8.1; none is statable at the pins, and the *Lean* paragraph names the missing
carriers. The README attributes no backticked Lean name to this roadmap. A pattern search for LaTeX
delimiters, pull-request numbers, machine paths, process words, `set_option`, `lemma`, "optional",
"deferred" and HTML anchors found nothing. Layers are named by their mathematics; Layers 1–2 are
independent of 3–7, and the order 3 → 8 is forced (4.1 needs 3.2 and 3.5; 5.4 needs 4.2 and 4.3; 6.1
needs 5.1; 7.5 needs 6.2; 8.1 needs 7.5).

### Copyright and arrangement

Wording: 17 passages were put beside their sources (the fifteen sampled targets, the Supplier
obligations and Theorem 6.2). The shared runs are statements that can be written one way (clause (4)
of CN23 Theorem 5.2, the conclusion of ACC23 Theorem 3.1.1, the degree inequality of CN23 (6)); the
proofs in §§3.3, 3.4, 4.2, 6.1 and 7.2 are the roadmap's own derivations, longer than and differently
ordered from the source's. Arrangement: CaptainSude26 has Sections 2–6. Its Section 2 is the
parent's and is imported; its Section 6 is Layer 2, placed first and merged with LeHung26 §4; its
Section 3 is split across Layers 3 and 4; Layer 6 states a lifting theorem for an arbitrary
representation that no section of the source states; Layer 1 is added. No one-to-one run. Reuse: no
table, figure or data taken over.

Source independence: 17 passages compared with 6 sources, none shared; largest share CaptainSude26, 24 of 58 locators in the layers; contents compared with CaptainSude26: independent.

## Not verifiable

- Lean elaboration, the one-tactic probe and the `#check` comparison: not available in this lane, and
  a design has no Lean file.
- The global patching argument of CaptainSude26 (lines 315–408, 445–498) beyond its hypotheses, counts
  and local computations: no refereed source states it, and it was not re-proved here.
- The geometric inputs of the parent, on which LeHung26 Theorem 1.1 is conditional (line 86): read as
  supplier statements only.

## Source issues

- **Error** in CaptainSude26 at Notation, printed p. 2 (lines 63–66): the source says its condition, ratio outside `{1, q, q⁻¹}`, agrees with CN Definition 2.1.27; it should say it is stronger, since only the ratio `q` is excluded there (LeHung26 line 282); affects nothing.
- **Misprint** in CaptainSude26 at Lemma 5.1, printed p. 11 (line 528): the source writes the unit series as `h(s)`, the letter of the cubic `y² = h(x)` (line 71); it should use another letter; affects nothing.

## For the human reviewers

- **Scope.** Theorems 6.2 and 8.1 rest on CaptainSude26 (pseudonymous, unrefereed) and Theorem 2.5 on LeHung26 (discussion draft, conditional on the parent's geometric inputs, line 86); the parent rests on OpenAI26. No refereed source states these theorems.
- **Licence.** CaptainSude26: the repository has no licence file (`sources.toml`, `version_note`); it is cited by locator only. OpenAI26: `licence_class = "author-page"` for a company repository, no licence recorded.
- **Licence.** MilneCM is recorded as `open-repository`; the host is the author's own page. LeHung26 is recorded as `open-repository` on a host named Hexagon, with CC BY 4.0 in its `version_note`.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3f36ffb6b3ab79d0f133986375b2e5417ea09d41", "job": "REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~15", "model": "fable", "worker": "chris-x83"} -->
