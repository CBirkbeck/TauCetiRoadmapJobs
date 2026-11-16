<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13067#issuecomment-6914175680 -->
Red team round 1 pass b (claude) of 5ef803a

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) gap:hodge-tate-image-cocharacter does not deliver the similitude-group statement §7.2 consumes, and shares its slug with a different contract

   **Location.** `packages/MordellLawrenceVenkateshPartII/README.md:466` (and the entry of the same slug
   in `design/plan.json`, `gaps`): "preserving a family of tensors, the Zariski closure of `ρ(G_K)`
   contains a torus that is conjugate over `ℚ̄_p`, inside the group fixing those tensors, to the image of
   the Hodge cocharacter".

   **Claim.** §7.2 (README:2395–2399) needs conjugacy "inside the similitude group of the intersection
   pairing"; its `*Needs:*` line (README:2418) takes this from the gap.

   **Witness.** `V = H¹` of an elliptic curve over `ℚ_p` with good reduction, tensor `ω` = the Weil
   pairing. `det ρ = χ_cyc⁻¹`, so `ρ` does not fix `ω`; the group fixing `ω` is `SL₂`; the Hodge
   cocharacter `t ↦ diag(t, 1)` has determinant `t`, so its image is not in `SL₂`. The gap as worded is
   either inapplicable (hypothesis fails) or false (conclusion fails) on the very case §7.2's second
   Check computes, where the right group is `GSp₂ = GL₂`.

   Second defect of the same line: SheafConvolutionOnAbelianVarieties (earlier in the merge order)
   declares the same slug to the same supplier with a different statement (its README, supplier
   contracts "From TauCetiRoadmap.PadicHodgeTheory": for a Hodge–Tate representation, a cocharacter of
   the Zariski closure of the image over `C_p` with the Hodge–Tate weights; no conjugacy to the de Rham
   Hodge cocharacter, no crystalline hypothesis). One slug then names two contracts.

   **Repair.** Replace the `needs` sentence, in the README and in the `gaps` entry of `plan.json`, by:

   > for a crystalline representation `ρ : G_K → GL(V)` of a finite unramified `K/ℚ_p` whose image lies
   > in `G(ℚ_p)` for a closed subgroup `G ⊂ GL(V)` over `ℚ_p` (for instance the stabilizer of a family
   > of tensors up to scalars, such as the similitude group of a pairing `V ⊗ V → ℚ_p(−r)`), the
   > Zariski closure of `ρ(G_K)` contains a torus that is conjugate over `ℚ̄_p`, inside `G`, to the image
   > of the Hodge cocharacter of `D_dR(V)` transported to `V ⊗ ℚ̄_p` by a tensor isomorphism of the two
   > fibre functors (Sen; Wintenberger's tensor-compatible splitting). This is stronger than the
   > contract SheafConvolutionOnAbelianVarieties states under the same slug, which asks only for a
   > cocharacter of the Zariski closure over `C_p` with the Hodge–Tate weights.

   Tested on the witness: `G = GSp₂ = GL₂` contains `{diag(s, 1)}`, and the Zariski closure of the
   ordinary image contains a unipotent conjugate of `{diag(1, s)}`, which is `GL₂`-conjugate to it
   (README:2408–2413). If the intake cannot hold two statements under one slug, add the new statement
   under a new slug (`hodge-cocharacter-conjugacy-in-image-group`) in `plan.json` and in the three
   README places that name the slug (README:443, 466, 2418).

2. **F02** (P2) gap:eulerian-log-concavity-and-variance is compound, and gap:eulerian-central-limit asks again for part of it

   **Location.** `packages/MordellLawrenceVenkateshPartII/README.md:336–337` (and the two `gaps`
   entries of `design/plan.json`): "log-concavity of every row … preservation of log-concavity on
   contiguous support under convolution and reflection of finite sequences, and the variance
   `(n + 1)/12`"; "together with the uniform bound on its second moments".

   **Claim.** Each is one supplier contract.

   **Witness.** The first sentence is three independent theorems with different carriers: (a) a
   statement about Eulerian rows; (b) a statement about arbitrary finite nonnegative sequences, which
   does not mention Eulerian numbers and has no natural home in §2.56 (unimodality of Eulerian rows);
   (c) a second-moment identity. The second gap's last clause is already implied by (c):
   `E[((des − (n−1)/2)/√n)²] = (n + 1)/(12n)`, which is `1/8` at `n = 2`, `1/9` at `n = 3`, and
   `≤ 1/8` for all `n ≥ 2`; so it asks for what the other gap provides.

   **Repair.** In `plan.json` `gaps` and under "From TauCetiRoadmap.ClassicalArithmeticCompletion":

   - `gap:eulerian-row-log-concavity` (supplier §2.56): "log-concavity of every row `q ↦ A(n, q)` on
     its contiguous support, which is `0 ≤ q < n` for `n ≥ 1` and `{0}` for `n = 0`."
   - `gap:log-concave-convolution` (supplier §2.56): "for finitely supported nonnegative sequences that
     are log-concave on contiguous supports, their convolution and the reflection `j ↦ a_(−j)` are
     log-concave on contiguous supports."
   - `gap:eulerian-descent-variance` (supplier §2.56, as now): "the descent number of a uniformly random
     permutation of `Fin n` has variance `(n + 1)/12` for `n ≥ 2`."
   - `gap:eulerian-central-limit` (supplier §2.18), shortened to: "the central limit theorem for
     descents: for a uniformly random permutation of `Fin n`, `(des − (n − 1)/2)/√n` converges in law
     to the centred normal law of variance `1/12` as `n → ∞`."

   and in §8.8 replace "with uniform second moments" by "whose second moments `(n + 1)/(12n) ≤ 1/8` are
   uniformly bounded by §8.3" (§8.8 already needs §8.3). Update the two
   `*Needs:*` lines (README:2692, 2812) to the new slugs. Tested: `n = 2` gives `3/24 = 1/8`, the
   Bernoulli(1/2) variance `1/4` divided by `n = 2`.

3. **F03** (P3) the correction to Lawrence–Sawin Lemma 6.5 made in §4.1 is not in "Source corrections"

   **Location.** `packages/MordellLawrenceVenkateshPartII/README.md:1804–1805` ("`SO₂` and `SO₄` are
   excluded (LS, Lemma 6.5, pp. 67–68; LS line 3082)") against README:3319 ("The following corrections
   to the sources are used throughout").

   **Claim.** The list of corrections is the list of places where the roadmap departs from its sources.

   **Witness.** LS line 3082 states the lemma for `SO_N` with no restriction on `N`, and LS line 3095
   uses a finite centre and a simple adjoint quotient. For `H = SO₂ = 𝔾_m` and `G = {(a, b, ab)} ⊂ H³`
   all three pair projections are onto `H²`, so there are three singleton classes, but `G → H³` is not
   surjective (`dim G = 2 < 3`). For `H = SO₄` and `G ⊂ H²` the pairs with equal image in one `PGL₂`
   factor of `H^ad = PGL₂ × PGL₂`, there is one class and the kernel of the projection to one factor
   has dimension 3. §4.1's third Check has the `SO₄` reason but the corrections list has no entry.

   **Repair.** Add to "Source corrections":

   > - **LS, Lemma 6.5, p. 67.** The lemma needs `H` to have finite centre and simple adjoint quotient,
   >   so `SO_N` is allowed only for `N = 3` or `N ≥ 5` (LS line 3082 has no restriction). For
   >   `H = SO₂ = 𝔾_m` the subgroup `{(a, b, ab)} ⊂ H³` has three singleton classes and does not surject
   >   onto `H³`; for `H = SO₄` the subgroup of `H²` of pairs with equal image in one `PGL₂` factor of
   >   the adjoint group has one class and a three-dimensional kernel on a factor. §4.1 excludes both;
   >   the applications have `N = n!·d ≥ 6`.

Three findings: two P2 (both on the wording of declared supplier gaps) and one P3 (a source
correction the README applies but does not list). No statement of the README or of
`Suggested.lean` was refuted; no supplier citation was found missing; the dependency check is clean.

## Record of the pass

### Suggested.lean declarations (elaborated types read from the worker's signature transcript; no Lean was run in this pass)

| Declaration | Context | README place | Elaborated type versus README | Instances computed | Result |
|---|---|---|---|---|---|
| `eulerian` | no variables | §8 intro, §8.4 | `ℕ → ℕ → ℕ`; descents of `Equiv.Perm (Fin n)`, same convention as ClassicalArithmeticCompletion §2.18 | `eulerian 0 0 = 1` (empty permutation), rows `(1,1)`, `(1,4,1)`, `(1,11,11,1)` | agrees; real body, needed by the next theorem |
| `eulerian_central_mass_le_half` | `(n) (hn : 2 ≤ n)` explicit | §8.4 | `2 * Σ_{q<n} A(n,q)² ≤ (n!)²` | `n=2`: 4 ≤ 4; `n=3`: 36 ≤ 36; `n=4`: 488 ≤ 576; `n=5`: 11420 ≤ 14400; `n=6`: 377816 ≤ 518400; `n=7`: 17405640 ≤ 25401600; `n=1`: 2 ≤ 1 false, excluded; `n=0`: 0 ≤ 1 (outside the hypothesis) | true as typed; not one-tactic (all `n`) |
| `HypersurfaceMonomial` | no variables | §9.1 | subtype of `Fin (n+1) →₀ ℕ` with `degree = d` | count `binomial(n+d, d)`: plane quartics 15, cubics 10 | agrees |
| `IsSmoothHypersurface` | `{k} [Field k] {n}` in signature | §9.1 | Jacobian criterion with `F(x) = 0` kept | zero form: not smooth; `x₀^p+x₁^p+x₂^p` over `𝔽_p`: all partials 0, point `(1,−1,0)` on it, not smooth; `x₀²+x₁²+x₂²` mod odd `p`: smooth; `n = 0`, `F = c·x^d`, `c ≠ 0`: vacuously smooth (empty hypersurface) | agrees; no lost binder |
| `HasGoodReductionOutside` | `{n} (S : Finset ℕ)` | §9.1 | for primes `p ∉ S`, reduction smooth | `3(x₀²+x₁²+x₂²)`, `S={2}`: fails at 3; `F = 0`: fails at any prime outside the finite `S` | agrees |
| `integralHypersurfaces_not_zariskiDense` | none | §9.3 | `∃ n₀ ∀ n ≥ n₀ ∃ D₀ ∀ d ≥ D₀ ∀ S ∃ G ≠ 0 homogeneous …` | quantifier order: `D₀` depends on `n` only, `G` on `S`; `G` constant nonzero (`e = 0`) would assert no such `F`; README's `n₀ ≥ 4`, `D₀ ≥ 4` are implied by taking maxima | agrees with LV Theorem 10.1 with Proposition 10.2 (LV lines 2885–2917) |

Headline theorems of the README: coefficient non-density (§6.1), higher-dimensional
Lawrence–Venkatesh non-density and finiteness (§§7.6–7.7), integral hypersurface parameters (§9.3),
Shafarevich finiteness (§§10.6, 10.9, 10.10), with the point-count bound (§7.8) and the Eulerian
criterion (§8.4) listed among the end theorems in the scope section. §9.3 and §8.4 are stated; the
module docstring names the others with the missing carriers. Padding probe: none of the six
declarations follows from one tactic or one library lemma, restates a definition or mirrors a Check.

### Adversarial table (values computed in this pass)

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| §0.2 Check, monodromy ×2 on `𝔾_m` | lattice `L` with `2L = L` | none exists in `ℚ` | holds |
| §0.3 strictness Check | projection `ℚ(0)⊕ℚ(−1) → ℚ(−1)`; identity `ℚ(0) → ℚ(−1)` | `im∩F¹`, `f(F¹)`: 1, 1; `im∩W₀`, `f(W₀)`: 0, 0; identity: 1 against 0, and `W₀=ℚ ↦ W₀=0` | holds |
| §1.2 | `O(C₃)^∨` | `ℚ[C₃] ≅ ℚ × ℚ(ζ₃)`, not `ℚ³` | holds |
| §1.9 route | `Γ=C₃`, `FγF⁻¹=γ⁻¹` | `e² = e` for `e=(2−γ−γ²)/3`; `(γF)² = γγ⁻¹F² = F²` | holds |
| §2.2 | `σ = id`, `d` factors; swap on `E₀×E₀` | `dim Z = d·dim H`; `Z ≅ Z(ab)` | hypothesis needed, holds |
| §2.3 Check `O₂/ℚ₃` | `r_b` under `diag(a,a⁻¹)`, `r_c` | `r_(a²b)`, `r_(c²/b)`; classes `ℚ₃^×/□`, 4 | holds |
| §2.6 Check `PGL₂` | unramified `Frob ↦ [[0,1],[p,0]]` | Kottwitz class `v(det) = 1 mod 2`, nontrivial; `G′` anisotropic | holds |
| §2.7 | weights `2,0,−2` | `T(1/2)=1`, `T(1)=2`, `T(2)=2`, `T(3)=0`, `A=1`, `B=2` | holds |
| §2.10 | diagonal torus of `GL₃`; `H=1` in `GL₂` | 13 ordered set partitions; 2 classes | holds |
| §2.11 | `H¹(ℚ₃, T⋊C₂)`; `𝔾_a⋊μ₂`; `𝔽_p`, `ℤ/p` | 4 against `H¹(T)=1`; 4 ↔ 4; `p` elements | holds |
| §3.3 route and Check | `W = X×Z`; curve with varying plus constant elliptic `H¹` | `dim U ≤ d − codim Z ≤ 0`; `1 ≥ 0+1` in `X×D_mon`, `3 ≥ 2+3` false in `X×LG(2,4)` | holds |
| §3.4 route | ideal step | `H′ ∈ J·Ô ⊂ I_W·Ô`, so `H′ ∈ ∩ 𝔪^k` in `R/I_W`, a domain; Krull gives `H′ ∈ I_W` | holds |
| §4.1 | `SO₂`, `SO₄` | see R03 | exclusion needed; statement holds |
| §4.2 Check | classes `{1,2},{3,4},{5,6},{7,8}`, `σ=(13)(24)(57)(68)` | orbits `{1,3},{2,4},{5,7},{6,8}` meet 2 classes each | holds |
| §5.1 | Borel of `GL₂`, `μ = diag(t,1)` | `γ_P = a⁻¹b`, pairing `−1`; `pr(1,0) = 1/2` | holds |
| §5.3 | `GL₆`, `2+2+2`; `GL₁₂`, `4+4+4` | `det Ad|Lie P = det m₀⁴ det m₂⁻⁴`, so `⟨γ_P,F_M⟩ = 4(a₀−a₂)`; `8(a₀−a₂)`; generic `(2,1,0)`; `(1,4,1)`: averages `1/4,1,1/4` against `1/2` | holds |
| §5.6 | `𝔾_a`, `ψ=−1`; `𝔾_a²`, `ψ=(−1,2)` | `v = −u/2`; `ψ(v)−v = (2,0)` for `v=(−1,0)` | holds |
| §5.8 Checks | Kummer extension of `ℚ_p(−1)` by `ℚ_p` at 2; `y²=x³−x` over `ℚ(i)` | degrees `0, 1` against `1/2`; Hodge–Tate `0, −1` | holds |
| §5.9 | `SL₂`, `w=s`; general | `−s(−α) = −α`; first set is minus the inversion set, size `ℓ(w)` | holds |
| §5.10, §5.12, §6.1, §7.4, §7.5 | substitution of parameters | §6.1 = §5.12 at `e=d`; §5.12 = §5.10 at `e+dim H`; §7.5 ⇒ §7.4 with `z ≤ h⁰`, using `3h⁰/2+d ≤ A+h⁰` | consistent |
| §5.10 Check | `GL₂`, weights `(1,0)` | `h=(1,2,1)`, `T(1)+T(1) = 2 > B = 1` | holds |
| §7.8 | `M=1`; general `M` | `‖g₁‖² = 19`; `3(2M+1)/(8M²+8M+3) ≤ 3/(4M)`; tail `Σ(2M+1−j)x^j ≤ (16/9)x^(2M)` for `x ≥ 4`, total `≤ (2M+1)(b+3x^(2M)) < 2b(2M+1)`, so `dim Z ≤ 3b²/M` | holds with the corrected cutoff |
| §8.1 | `n=2,d=1` `GL₂`, `GSp₂`, `GO₂`; `n=3,d=1` `GO₆` | `4<6`, `4<6`, `4<4` false; `h⁰=8`, `16<20`; general reduction to `2ΣA² ≤ (n!)²` (and `m_mid>0` for `GO`) rederived | holds with the parity restriction |
| §8.2–8.3 | `n=2`, `n=3` | `β=(1/4,1/2,1/4)`; `(1/36,2/9,1/2,2/9,1/36)`; second moments `1/2`, `2/3` | holds |
| §8.4 route | geometric reference `1/(2·3^j)` | tail `1/4`; `Σ j²·3^(−j) = 3/2`; contradiction needs `(n+1)/6 ≥ 3/2`, `n ≥ 8`; `n=2..7` computed above | holds |
| §8.5 Check | `GL₂` profile, `c ≥ 5(e+4)` | `x ≤ 1/5`, `2x ≤ 2/5 < 1` | holds |
| §8.6 | cubic curve, quartic surface, `n=5,d=4`, quintic threefold | `(1,1)`; `(1,19,1)`; `(0,21,141,21,0)`; `(1,101,101,1)` | holds |
| §8.7 | plane quartics, cubics | 14 against 19; 9 and 9 | holds |
| §9.2 | cubic surfaces; `n` odd, `d ≥ 3` | `(0,6,0)`; `h^((n−3)/2) ≠ 0` iff `(n−1)d/2 ≥ n+1` | exception needed, holds |
| §10.3 Check | `ℚ(i)`, `S={(2+i)}` | `1/(2+i)` has `x² − (4/5)x + 1/5` | holds |
| §10.5 Check | `ζI ∈ SL₆` | `B = ζ²B`, `B=0` | holds |
| §10.7–10.9 | `[2]×id` pullback; `d = 2·8855` | `|T|=4`, `d(H)=4d(H′)`; quotient degree 8855 | holds |
| Conventions, Hodge–Tate signs | `ℚ_p(−1)`, `H¹(E)`, `V_pE` | weight 2, jump `+1`, HT `−1`; jumps `0,1`; HT `0,1` | consistent in §§5.4, 5.8, 7.2, 8.1 and with SheafConvolutionOnAbelianVarieties §3.3 |

### Dependency check

    depcheck: 259 roadmaps, 2487 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. All 79 `*Needs:*` lines read; the three same-layer forward edges
(§2.3 → §2.11, §2.9 → §2.11, §8.1 → §8.4) are the ones "How to read the build" declares, and none
closes a cycle.

## Verified sound

- **Declarations read:** 6 of 6, with the module docstring; imports are the single `import Mathlib`;
  no `set_option`, `lemma`, `#check`, sorry'd data or `True` placeholder. Every Lean name appears in
  the README and every backticked name of this roadmap in the README is declared.
- **Targets read:** all 79 numbered sections (Layers 0–10), the conventions, the supplier contracts,
  the worked examples and the source corrections; every line of both files.
- **Locators verified against the cached texts: 43.** LV: Theorem 10.1 and (10.1), (10.3)–(10.8),
  Proposition 10.2 (with the `n₀ ≈ 60` remark), Lemmas 10.3–10.5, Proposition 10.6, footnote 11,
  Corollary 9.2, Lemma 9.3, Lemmas 11.1–11.2, Example 4, Proposition 11.3, Lemma 11.4, Lemma 12.1 and
  proof (printed page = marker + 892 confirmed on eight of them). LS lines 1832, 2209, 2261, 2366,
  2645, 2813, 2979, 3082, 3205, 3259, 3391, 3572, 3605, 3661, 3668, 3722, 3812, 3881, 4013–4041,
  4076, 4245–4321. Beauville lines 84–89 and 129–136. BC line 1344 (Theorem 10.13, PDF p. 34).
- **Source corrections recomputed:** the parameter dimension, the Lemma 12.1 cutoff, the multiplier
  `ℓ^r`, the graded piece in Example 4, the inverse map in Lemma 11.4, the parabolic and reindexing
  remark, the purity hypothesis of Lemma 8.10, the tail inequality and the `3^i` denominator, the
  parity restriction of Lemma A.1. All correct.
- **Checks tested:** 72, listed by section in the table above; none false, vacuous or a restatement.
  Every definition has at least three.
- **Sibling citations checked:** the heading of every cited section in 33 roadmaps (on main, or at
  the open head read through `roadmaps show`), about 100 section ids; statements read and compared
  for SheafConvolutionOnAbelianVarieties §§3.1, 3.3, 4.8, 5.2–5.3, 6.7, 8.1–8.3 (§8.2 is a bold
  paragraph inside §8.1 there, with the cited title), MordellLawrenceVenkatesh §§1.2, 1.13,
  LanglandsParameterStacks §§2.3–2.4, ArithmeticGaloisRepresentations §1.11 (the named target is at
  its README:1496), LefschetzPencilsAndVanishingCycles §§5.8, 5.10 (sign `(−1)^(n/2)` there equals
  `(−1)^((n−1)/2)` here), HeightsRationalPointsAndObstructions §5.2,
  EndoscopicTransferAndUnitaryTraceComparison §1.13a, PadicHodgeTheory §§4.4, 5.5,
  ClassicalArithmeticCompletion §§2.18, 2.56, ReductiveGroupsPartII §RG2.0.2, JacobianChallenge
  Layer F, AbelianSchemesAndArithmeticModuliPartII §§B2.4, B2.6 and Layer B3, ArithmeticGaloisDuality
  §R02.3.1, and the named declarations `ruckert_nullstellensatz`, `hilbert_quot_schemes`,
  `finite_curves_goodReduction`, `VanishingCycles.lisseDirectImageTransport` (a target name of
  EtaleCohomologyFoundations §F.3, at its README:1135; the citations lead is not a defect).
- **Pinned declarations:** all 15 Tau Ceti names and the 3 Mathlib names of the supplier contracts
  exist at the pins, at the stated files and lines (Parabolic 154, Equivalence 188, Mixed/Basic 72,
  Morphism 77, Strictness 110/118/131, Abelian 33, Ample 71, CartierDivisor 127, Effective 45,
  IntersectionNumber 111, Degree 74/130; `Ideal.iInf_pow_eq_bot_of_isLocalRing` at Filtration 432,
  `RingTheory.Sequence.IsRegular`, `Finsupp.degree`). Neither pin has Eulerian numbers.
- **Ownership:** no other roadmap on main or at an open head states Hodge–Deligne systems, the
  coefficient normalizer, balanced filtrations, the Eulerian central mass, hypersurface monodromy,
  the Jacobian-ring Hodge numbers or local `H¹` finiteness for linear groups. No `Suggested.lean`
  shares a fully qualified name with this one. LogicAndDefinabilityInNumberTheory §7.6 (later in
  the merge order) restates §3.3 with Ax–Schanuel as a hypothesis; the README's "Downstream
  consumers" describes it accurately, and the citation is that roadmap's to add.
- **Declared gaps:** the seven slugs agree between the README and `plan.json`, each with a named
  supplier and section; minimality checked against the suppliers' current text (log-concavity is
  only a proof remark in ClassicalArithmeticCompletion §2.56; B2.4 is geometric-origin only). R01 and
  R02 are the wording defects found.
- **Policy:** the pull request changes only files of this package folder; no pull-request numbers or
  process narrative in the README or docstrings; every target has a locator.

## Not verifiable

- Ownership against `packages/LawrenceVenkateshMethod`: this checkout has only its `reports` folder,
  and the name matches no roadmap on main or at an open head, so it was not checked.
- Serre, *Galois cohomology* (the two locators of §2.11): settled as uncertified; not read.
- Lean elaboration: no Lean was run in this pass; the six types were read from the worker's
  signature transcript, whose one "elaboration error" is the word "structure," in the module
  docstring parsed as a declaration.
- LS page numbers were checked through the line locators and the contents page, not page by page.
- The inner steps of §3.1 (the product decomposition of the adjoint Mumford–Tate group) and of §5.8
  rest on the declared gaps and were checked for consistency only.

## Source issues

- **Gap** in LS at Lemma 6.5, p. 67: the source says the Goursat statement holds for every special orthogonal group, with a proof using a finite centre and automorphisms of the adjoint group; it should be restricted to rank 3 or at least 5; affects nothing.
- **Misprint** in LS at proof of Lemma A.5, p. 91: the source says the tail sums exceed the geometric reference and prints the last summand with the wrong index; it should be a strict upper bound with matching index; affects the proof.
- **Misprint** in LS at proof of Lemma A.4, p. 91: the source says the propagated bound has the fixed crossing index in the exponent; it should have the running index; affects the proof.
- **Error** in LS at Lemma A.1, pp. 89–90: the source says the strict inequality holds for all three group types when the dimension is at least 2; it should exclude the orthogonal type in dimension 2 with degree 1; affects a stated result.
- **Gap** in LS at Lemma 8.10, pp. 78–79: the source says balance of the reference filtration follows, without the purity assumption of its Lemma 8.1; it should assume that purity; affects a stated result.
- **Error** in LS at §5.8.2, p. 57: the source says a parabolic of a reductive group determines the filtration up to reindexing; it should say parabolic together with conjugacy of cocharacters in it; affects nothing.
- **Misprint** in LV at the display before (10.8), printed p. 971: the source says the parameter dimension is a binomial with lower entry one less than the degree; it should have lower entry the degree; affects nothing.
- **Error** in LV at Lemma 12.1, printed pp. 995–996: the source says the point-count bound is needed up to the kernel's half-width; it should be needed up to the full width, doubling the exponent in the cutoff; affects a stated result.
- **Misprint** in LV at proof of Lemma 10.4, printed p. 978: the source says Frobenius scales the form by the prime; it should be the prime to the power of the middle degree; affects nothing.
- **Misprint** in LV at Example 4, printed p. 988: the source says the induced filtration lives in a quotient by the next step of the flag; it should be the quotient by the previous step; affects nothing.
- **Misprint** in LV at the end of the proof of Lemma 11.4, printed p. 993: the source says the Weyl element and its inverse give the inverse bijections; it should be their negatives; affects nothing.

Source independence: 18 passages compared with 4 sources (LV Theorem 10.1, Proposition 10.2, Lemmas 10.4, 11.4, 12.1, Proposition 10.6, Corollary 9.2; LS Theorems 6.4, 8.17, 9.2, Corollary 9.3, Lemmas 6.5, 8.12, 8.13–8.14, A.4–A.6, Definition 9.1; Beauville Théorème 2; BC Theorem 10.13), none shared beyond formulas and hypothesis lists; largest share LS, 113 of 154 locators; contents compared with LS: independent (Layer 0 ↔ §5.2, Layer 1 ↔ §§5.3–5.5, Layer 2 ↔ §§5.6, 5.8–5.10 with §2.11 added, Layer 3 ↔ §6.1, Layer 4 ↔ §6.2 with §7, Layers 5–6 ↔ §8, Layer 10 ↔ §9 with §§10.7, 10.8, 10.10 expanded; Layers 7–9 come from LV, Beauville and BC and Layer 8 from Appendix A with LV §10.2; the mapping is not one to one, and the order 0 → 1 → 2 → 3 → 4 → 5 → 6 is forced by the `*Needs:*` lines of §§1.1, 2.1, 3.1, 4.4, 5.12 and 6.1).

## For the human reviewers

- **Licence.** The LV text was read from a publisher-formatted copy on an institutional host (`sources.toml`, source `LV`, `fetched_from`); whether that host may distribute it was not settled. The arXiv v3 has the same numbering.
- **Licence.** Source `Serre` is recorded as uncertified and was not read; §2.11 cites it by locator for a standard theorem.
- **Scope.** Two declared gaps ask ClassicalArithmeticCompletion, a roadmap on main, for probabilistic statements (a central limit theorem for descents); whether that roadmap takes them is its maintainers' decision (README:336–337).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5ef803a8f4d6d7a39d0935d947bc2fd8cead6c3a", "job": "RT-MordellLawrenceVenkateshPartII~1b", "model": "fable", "worker": "chris-x82"} -->
