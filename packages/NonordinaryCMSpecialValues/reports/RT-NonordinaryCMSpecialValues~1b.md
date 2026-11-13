<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13089#issuecomment-6856768006 -->
Red team round 1 pass b (claude) of 9301218

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) ComplexMultiplicationAndExplicitReciprocity §4.2 is cited for two statements it does not make

   **Location.** `packages/NonordinaryCMSpecialValues/README.md:69`: "§4.2 Full elliptic CM
   L-factorization, including bad primes (all-prime factorisation `L(E/H, s)` through `ψ` and `ψ̄`,
   ramified factors `1`) and CM induction and compatible-system comparison (the weight-two theta-series
   realisation)". Used at README.md:508 (§3.4 *Needs*), README.md:834 (§6.3 proof route) and in the
   Dependencies lines README.md:532 and README.md:870.

   **Claim.** The supplier provides the factorisation of `L(E/H, s)` for the CM curve over the Hilbert
   class field, and the weight-two newform `θ_η` with `L(θ_η, s) = L(η, s)` for every `η = φρ`.

   **Witness.** ComplexMultiplicationAndExplicitReciprocity at its open head, §4.2: the first target
   begins "Let `A/K` be an elliptic curve with CM by an order in `K` and every endomorphism defined
   over `K`" (base field equal to the CM field, so `h_K = 1`); the second begins "For a rational CM
   elliptic curve `A/ℚ`". Neither covers `E/H` with `h_K > 1` (the roadmap's own example
   `K = Q(√−23)`, `h_K = 3`, README.md:610), nor a twist `φρ` by a ring class character.

   **Repair.**

   - README.md:69, replace the bullet by: "§4.2 Full elliptic CM L-factorization, including bad primes
     (for an elliptic curve over `K` itself with all endomorphisms defined over `K`:
     `L(A/K, s) = L(ψ, s)L(ψ̄, s)`, ramified factors `1`). It is quoted as a consistency check only;
     nothing here needs it for `E/H`."
   - §3.4 (README.md:508): delete "§4.2 Full elliptic CM L-factorization, including bad primes" from
     *Needs*. The proof route already identifies Frobenius through §4.1 The algebraic Hecke character
     of a CM abelian variety (at a good `w`, `ψ_E(w)` is the Frobenius element), applied to `E/H` with
     `ψ_E = φ ∘ N_{H/K}`: `p` splits completely in `H` (§3.3), so `N_{H/K} w = pO_K` and
     `ψ_E(w) = φ((p)) = −p`. Tested on the instance: `K = Q(√−23)`, `p = 5` (inert, `−23 ≡ 2`
     nonsquare mod `5`), `E/H` not defined over `K`; §4.1 applies, §4.2 does not.
   - §6.3 (README.md:834): delete "ComplexMultiplicationAndExplicitReciprocity §4.2 CM induction and
     compatible-system comparison" and write: "let `θ_η` be the weight-two newform generating
     `AI_{K/Q}(η|·|^{1/2})` (GL2AutomorphicRepresentationsAndTransfer R17.4.16, `L_Q(s, AI θ) = L_K(s, θ)`,
     cuspidal because `η ≠ η ∘ c`; R16.6.1 Primitive newforms and holomorphic cuspidal classes for the
     passage to the classical newform)". Add R16.6.1 to the *Needs* of §6.3 and to the contract
     README.md:111; remove §4.2 from the Dependencies lines README.md:532 and README.md:870, and in
     README.md:20 keep only "Full elliptic CM L-factorization, including bad primes" under §4.2.

2. **F02** (P2) The sections of Layer 4 are the sections of FINIS06, in order and with the same scope

   **Location.** `packages/NonordinaryCMSpecialValues/README.md:534–691`; README.md:536: "Throughout
   this layer, following Finis, the *tower prime* is a prime split in `K`".

   **Claim.** The organisation is the roadmap's own.

   **Witness.** FINIS06 has the largest share of the README's locators (37 of 117). Its contents
   (FINIS06 lines 10, 166, 624 and the section opened before line 1221) against Layer 4:
   `§4.1 ↔ §1`, `§4.2 ↔ §2`, `§4.3 ↔ §3`, `§§4.4–4.5 ↔ §4`; §4.6 is the theorem of §1 with the
   end of §3. The order is forced by the *Needs* lines of §4.3 (§§4.1–4.2), §4.5 (§§4.2–4.4) and §4.6
   (§§4.1–4.5); the scope of §4.2 and §4.3 is not: each is exactly one section of the source (§4.2 runs
   from (3) to Proposition 2.4, §4.3 from Lemma 3.1 to Proposition 3.7).

   **Repair.** Regroup Layer 4 by object, keeping every target and locator:

   - 4.1 Local root numbers and the invariants `μ_ℓ`, `b_ℓ` (unchanged).
   - 4.2 Heisenberg theta spaces: `T_{r,a}`, `A_l`, the scalar product, traces `t_b`, primitive
     subspaces, the families `T_d`, `V_{d,C}` (the first half of the present §4.2), together with the
     arithmetic and integral structures `T^{ar}`, `T^{int}`, normalised elements and the standard-basis
     bounds (now in §4.3): one section for the spaces and their lattices.
   - 4.3 The Shintani representation and its spectrum: `E(b)`, `γ_d`, `F*`, the factorisation of
     `F*(z)⁻¹`, Proposition 2.2 and Corollary 2.3, preservation of integral elements.
   - 4.4 The central-value formula: the functional `l`, Yang's formula (10), the forms `b`, `b′`,
     `b_ar`, the arithmetic form (13) and the valuation identity (15): one section, whose primary
     source is Yang 1997, Theorem 2.6.
   - 4.5 Torsion points on subvarieties; 4.6 nonvanishing modulo `ℓ`; 4.7 the theorem.

   Replace README.md:536 by "In this layer the *tower prime* is a prime split in `K` and the
   *valuation prime* `ℓ` is an odd prime different from it (the roles of `p` and `ℓ` in Finis's
   Theorem 1.1)." Add as further sources for §§4.2–4.3 the two works Finis takes the theory from:
   G. Glauberman and J. Rogawski, On theta functions with complex multiplication, J. reine angew.
   Math. 395 (1989), 68–101 (primitive theta functions and Shintani operators; FINIS06 lines 237 and
   264–279 point to it), and A. Murase and T. Sugano, Local theory of primitive theta functions,
   Compositio Math. 123 (2000), 273–302, Proposition 3.7 (the local signs `W_q`; FINIS06 line 90).
   Both are to be fetched through the sources service and their locators fixed against the text;
   I did not read them.

3. **F03** (P3) The root number as a product of local constants is AL.1.6.1, not AL.1.6.2

   **Location.** `packages/NonordinaryCMSpecialValues/README.md:75`: "whose root number `W_H(ω)` is
   the product of the local constants (AL.1.6.2 takes it from ArithmeticGaloisRepresentations §2.7,
   Root-number product formula)"; *Needs* of §§1.1–1.3: "the root number `W_H(ω)` of AL.1.6.2".

   **Claim.** AL.1.6.2 identifies `W_H(ω)` with the product of the AL.1.3 local epsilon factors.

   **Witness.** AutomorphicLFunctionsAndLocalFactors at its open head: the heading is
   "AL.1.6.1 The normalized-distribution epsilon comparison", which states `ε(s,χ) = ∏_v ε_v(s,χ_v,ψ_v)`
   and `W_H(ω) = ε(1/2, ω)`; AL.1.6.2 is mapped there to AnalyticNumberTheoryPartI §2.3a (the functional
   equation only).

   **Repair.** README.md:75: "AL.1.6.1 The normalized-distribution epsilon comparison
   (`W_H(ω) = ε(1/2, ω) = ∏_v ε_v(1/2, ω_v, ψ_v)`, from ArithmeticGaloisRepresentations §2.7,
   Root-number product formula); AL.1.6.2 Hecke continuation and functional equation,
   `Λ_H(ω, s) = W_H(ω) Λ_H(ω⁻¹, 1 − s)`". In the *Needs* of §§1.1, 1.2 and 1.3 replace "the root
   number `W_H(ω)` of AL.1.6.2" by "AL.1.6.1 The normalized-distribution epsilon comparison". Tested on
   §1.1's instance `K = Q(√−7)`: the product `(i)(−i) = 1` of README.md:259 is an AL.1.6.1 product.

4. **F04** (P3) The odd-order hypothesis on `ν` is not needed in §§1.3, 1.4, 6.4, 6.5 nor in `centralValue_parity_dichotomy`

   **Location.** `packages/NonordinaryCMSpecialValues/Suggested.lean:170`:
   `(hν : ν.IsFiniteOrder) (hνodd : Odd (orderOf ν)) (hνac : IsAnticyclotomic ν)`; README.md:274,
   284, 845, 855 ("`ν` anticyclotomic of odd finite order").

   **Claim.** The statements need `ν` of odd order.

   **Witness.** For `ν` anticyclotomic of any finite order, `φν` again satisfies
   `IsEquivariantTypeOneZero ι`: `ν_∞ = 1`, and `(φν)(ā) = conj φ(a) · ν(a)⁻¹ = conj((φν)(a))`
   (README.md:141 states this). So the theorem for `(φ, ν)` is the theorem for `(φν, 1)`; Jia's family
   (JIA24 lines 33–39) contains every finite-order `ρ`.

   **Repair.** Delete `hνodd` from `centralValue_parity_dichotomy` and "odd" from its docstring and
   from §§1.3, 1.4, 6.4, 6.5; keep it in §1.2 and §0.6, where `W(φν) = W(φ)` uses it
   (README.md:270). In §1.3's proof route replace "`φ((p))ν((p))/p = −1` (§0.1, §0.2)" by
   "`(φν)((p))/p = κ_K(p) = −1`, the rational-principal law of §0.1 applied to `φν`, which is again
   equivariant of type `(1,0)` (§0.1, Twists)". Add the Check: "`K = Q(√−15)`, `p = 7` (inert:
   `(−15/7) = (6/7) = −1`), `ν` the genus character of order `2`: `(φν)((7)) = κ_K(7)·7 = −7`, and
   the conductor sign of §1.3 is `(−1)^c` as for odd `ν`; only §1.2's equality `W(φν) = W(φ)` can
   fail for this `ν`."

5. **F05** (P3) `factPrime` is declared in the Lean file and absent from the README

   **Location.** `packages/NonordinaryCMSpecialValues/Suggested.lean:117`:
   `local instance factPrime (p : Nat.Primes) : Fact (p : ℕ).Prime := ⟨p.prop⟩`.

   **Claim.** Every Lean name appears in the README.

   **Witness.** `grep -c factPrime packages/NonordinaryCMSpecialValues/README.md` gives `0`.

   **Repair.** Add to §6.1, after the definition of `rohrlichCount`: "The primes are indexed by
   Mathlib's `Nat.Primes`; the Lean file carries the local instance `factPrime`
   (`Fact (p : ℕ).Prime` for `p : Nat.Primes`) so that `ℤ_[p]` is defined."

6. **F06** (P3) The scope list omits ArithmeticDirichletSeries Layer 3

   **Location.** `packages/NonordinaryCMSpecialValues/README.md:30`: "EllipticCurves Layers 1–3,
   ArithmeticDirichletSeries Layer 5."

   **Claim.** The "It consumes, by section" list is the list of supplier sections used.

   **Witness.** README.md:175 (§0.3 *Needs*: "ArithmeticDirichletSeries Layer 3"), README.md:124 and
   README.md:246 cite Layer 3 (local factors and Euler products).

   **Repair.** README.md:30: "ArithmeticDirichletSeries Layers 3 and 5."

Two P2 findings (a supplier cited for statements it does not make; the sections of Layer 4 set
beside the sections of the source cited most) and four P3 findings. No statement of
`Suggested.lean` or bold README target was found false on the instances computed below.

## The adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `conductorModulus` | against `HeckeCharacter.idealCharacter` at the pin | both are `⟨χ.finiteConductor, χ.finiteConductor_ne_bot, ∅⟩` (Ideal.lean, the definition of `idealCharacter`) | the coercions of the Lean file typecheck definitionally | none |
| `IsAnticyclotomic` | cyclotomic `χ = ψ ∘ N`; `χ` ramified at one prime over a split `l`; class-group character of `Q(√−31)` | `χ(ā) = χ(a)`, so the law forces `χ² = 1`; law on ideals prime to `f f̄` gives `χ^c = χ⁻¹` as idele characters (density), so `f̄ = f`: excluded; `a ā = (N a)` principal: satisfied | the pairs `(a, b)` with both prime to `f` still determine the object | none |
| `IsEquivariantTypeOneZero` | `y² = x³ − x`, `K = Q(i)`, `f = (1+i)³`; `φ⁻¹`; the norm | `7 ≡ −1`, `−7 ≡ 1 mod (2+2i)`, so `φ((7)) = −7 = κ(7)·7`; `−1+2i − 1 = i(2+2i)`, so `φ = −1+2i`; `φ⁻¹((x)) = ι(x)⁻¹`; `N((x)) = x x̄` | first two as claimed, last two excluded | none |
| rational-principal law (§0.1) | restriction `ω` of `φ/N` to `A_Q×` | `ω` real, odd at `∞` (`x⁻¹ = |x|⁻¹ sgn x`), trivial on norms (`φ(a ā) = N(a)`), so `ω ∈ {1, κ_K}` and odd gives `κ_K` | true | none |
| `IsPAnticyclotomic`, conductor formula (§0.2) | `Q(√−7)`, `p = 5`; `Q(i)`, `p = 3`; `Q(√−31)`, `p = 3`; `c = 1` | `#Pic(O_{5^m}) = 6·5^{m−1}`; `2·3^{m−1}`; `h = 3`, `c = 0` member of order `3`; `#Pic(O_p)/h = (p+1)/u` prime to `p`, so no member has `c = 1` | `c ∈ {0} ∪ [2, ∞)`, both parities infinitely often | none |
| `eulerFactor` | `φ` of `y² = x³ − x` at `7`, `s = 1`; ramified prime | `(1 + 7/49)⁻¹ = 7/8`; with `+7`: `7/6`; ramified: `1` | as README | none |
| `HasCentralValue` | uniqueness; a non-entire `F` | identity theorem on `Re s > 3/2`; `Σ_v N(v)^{1/2 − σ}` converges for `σ > 3/2` | determines `z` | none |
| `rohrlichCount_eq_zero` | `P = ∅`; `α = β = 1`; `α = 0, β = 1`; `α = 5, β = 0`, `c = 0`; `c < 0` | `Q = 2` leaves no admissible `q`; `0 < |u − v| ≤ 2q^c < q`: none; `q ∣ u`, `|u| ≤ q^c`: none; `q = 5`: six pairs, `q = 25`: none; box `{(0,0)}` | true; "sufficiently large" needed | none |
| `rohrlichCount_lt` | `α = β = 1`, `d = 11/20`, `s = 7/16` | `|u − v| ≤ 2q^{11/20} < q`: count `0 < q^{7/16}`; `5d/2 − 1 = 3/8 < 7/16 < 1/2` | true; ROHRLICH84 lines 896–900 | none |
| `centralValue_parity_dichotomy` | `Q(√−7)`, `p = 5`, `ν = 1`; `p ∣ h_K` (`Q(√−31)`, `p = 3`, `c = 0`); `ν` of order `2`; wrong `ε` | `ε = (2/7) = 1`; `c = 0, 2, 3, 4` give `+, +, −, +`; `c = 0` keeps the sign since `χ(f𝔡_K) = 1`; `(φν)((p)) = −p` for every anticyclotomic `ν`; with `−ε` both clauses fail (infinitely many of each parity) | true; `hνodd` not needed (R04) | R04 |
| §1.1 `W(φ) = (2/D)` | `D = 7, 11, 15`; general `m = #{q ≡ 3 mod 4}` | `(−i)(i) = 1`; `(−i)(−i) = −1`; `(−i)(i)(1) = 1`; `i^m (−i)(−1)^{m(m−1)/2} = 1` for `m = 1, 3, 5` | matches `(2/D)` | none |
| §1.3 `(−1)^c` | `χ_p(Δ)`, `Δ² ∈ Q_p×`; AL.1.3.5 (i) with `ν(ψ) = 0` | `χ_p(Δ)² = 1`, odd order: `1`; unramified twist by value `−1`: `(−1)^c` | true | none |
| §2.1 kernel condition | `h = [5]`, `a = (5)`; `h = [2]` | `h_*(25(0) − E[5]) = 0`; `[2]` permutes `E[5]` | condition needed, as README | none |
| §2.2 Kronecker sign | `Q(i)`, `f = (3)`, `a = (5)`, `χ = 1` | `ζ_K(0) = −1/4`, limit `−(log 3)/2`, `24·(−(log 3)/2) = −12 log 3`; `[K(3):K] = 8/4 = 2` | as README | none |
| §§2.3, 2.5 levels | `Q(i)`, `p = 2, 7` | `[K(4):K] = 8/4`; `[K(7):K] = 48/4 = 12`; `[K(49):K] = 2352/4 = 588` | as README | none |
| §2.6 split deletion | `p = 5`, `φ(𝔭) = −1+2i` | `((6+2i)/5)((6−2i)/5) = 8/5 = 1 + 2/5 + 1/5` | as README | none |
| §3.2 | `Q(√−7)`, `p = 47`, `l = 23` | `(40/47) = (2/47)(5/47) = 1·(−1)`; `47² − 1 = 2208 = 23·96` | as README | none |
| §4.2 dimensions, semi-character, `γ` | `Q(√−7)` | `25·7/25 = 7`; `Im H(1, l′) = 7`, norms `1, 2, 4`, `ψ = −1, 1, 1`; `γ(c)γ(c̄)N(c) = 1/2 = γ((2))` | as README | none |
| §4.3 (13) | (10) with `⟨ϑ,ϑ⟩ = (h/2^{ν−1})⟨ϑ_a,ϑ_a⟩`, `b_ar = (Ω/2π)b` | `Ω⁻¹L = 2^ν D^{−1/2} ∏ b_ar⁻¹ (l/w)²` | discriminant in the denominator, as README | none |
| §5.1 centre | `Q(√−7)`, `(5)` | `1 + 1/5`; `1 + 5/25`; `1 + 125/625`, all `6/5`; `1 + 125·25 = 3126` | as README | none |
| §5.7 | `U = F` ramified | `a ⊗ 1 − 1 ⊗ a ↦ 0` | hypothesis used | none |

Dependency check (command of the brief): `depcheck: 223 roadmaps, 1983 edges, 0 problem(s)`; no
UPWARD or CYCLE line.

## Verified sound

- Declarations read: all of `Suggested.lean` (6 definitions, 1 local instance, 3 theorems), against
  the elaborated signatures the worker supplied; I ran no Lean in this read-only pass, so the
  `#check @name` comparison is the worker's transcript, in which no section binder is lost. The
  carriers were read at the pin: `HeckeCharacter` is a character of the full idele class group
  (`IdeleGroup R K ⧸ principalSubgroup`, Mathlib `NumberTheory/NumberField/AdeleRing.lean`), so
  type `(1,0)` characters exist and no statement is vacuous; `idealCharacter_apply_prime`,
  `idealCharacter_apply_toPrincipalIdeal`, `conductorExponent`, `finiteComponent`, `Modulus`,
  `IsCongrOne`, the five `ringClassField` declarations, `Subalgebra.linearDisjoint_iff_injective`,
  `MonoidAlgebra.lift_single` and `DirichletCharacter.LFunction_apply_one_ne_zero` exist where cited.
- Headline theorems: the parity dichotomy (stated; the existential sign is not a stand-in, both
  parities occur infinitely often so `ε` is forced), Rohrlich's two counts (stated), the unit
  theorem, Finis's theorem, Kato's reciprocity law, the Lubin–Tate comparison, the root-number
  formulas and Jia's average (named in the module docstring with the missing carrier). No
  declaration is padding: none follows from one library lemma or restates a definition.
- Targets read: every section of Layers 0–6 (43 sections). Checks tested by computation: 44; all
  correct.
- Locators verified against the cached texts: 17 (ROHRLICH84 lines 763–775, 779–793, 896–900;
  FINIS06 lines 61–99, 101–122, 559–567, 862–868, 1221–1224; KATO04 lines 238, 5242–5255,
  5263–5275, 5286–5290; BKO21 lines 388–395, 475–488, 490–507; JIA24 lines 18–27, 42–66, 96–100,
  122–129).
- Sibling citations checked at the cited heads or on main: 46 sections and targets. All exist:
  ComplexMultiplicationAndExplicitReciprocity §§1.2, 2.2, 3.2, 4.1–4.3 with the eleven named
  targets (two cited beyond their statements, R01); AL.1.1.1, AL.1.3.1, AL.1.3.4, AL.1.3.5 (case
  (iv) gives `i` for `(a, b) = (1, 0)`, as §1.1 uses), AL.5.1.1, AL.5.3.2; AL.1.5.2 and AL.1.6.2
  resolve through that roadmap's own mapping to AnalyticNumberTheoryPartI §2.3a, on main;
  LubinTateFormalModulesAndQuasiCanonicalLifts §§2.1–2.4, 4.3, 4.4 (read in the board's package;
  it is not on main nor an open pull request, and is earlier in the merge order);
  FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.8, R07.1.9, R07.1.12–R07.1.14;
  SelmerIwasawaCohomology §§0.8–0.11, 3.6, 3.7; PadicHodgeRegulators §§1.4, 1.7, 1.11;
  ModularSymbolsPadicLFunctions §§1.2, 4.3; GL2AutomorphicRepresentationsAndTransfer R17.4.16;
  PadicFamilies §4.0.1; NeronModelsAndSemistableAbelianVarieties §5.1;
  ArithmeticGaloisRepresentations §2.7; NoncommutativeAndEquivariantIwasawa §4.3;
  DiophantineApproximationAndTranscendence §§2.1, 2.3 and the cited layers of GlobalNumberFields,
  ClassFieldTheory, Chebotarev, LocalFieldsRamification, EllipticCurves and
  ArithmeticDirichletSeries on main.
- The two declared gaps have the same slugs in `design/plan.json` and in the README, a named
  supplier and section each, and one precise sentence each; neither asks for something already
  provided (the AL head has no Fröhlich–Queyrut statement).
- Ownership: no declaration of `Suggested.lean` has a name found elsewhere (the worker's resolve
  and overlap lists are empty apart from the Lubin–Tate lead, resolved above). The finding the
  repair report of round 4 marked not actionable (duplicate targets in
  ModularIwasawaMainConjecturesPartII) is not re-raised.
- Policy: the pull request changes only the package folder; no process words, pull-request numbers,
  `lemma` or `set_option`; the manifest has no local path.

Source independence: 8 passages compared with 5 sources (BKO21, KATO04, FINIS06, JIA24,
ROHRLICH84), none shared beyond formulas and statements the mathematics forces; largest share
FINIS06, 37 of 117 locators; contents compared with FINIS06: Layer 4 follows its sections
(R02), the other layers are independent.

## Not verifiable

- KATO99 (uncertified) and BOXALL92 (waived): cited by locator only; §2.5's use of Theorem 4.3.1
  for `p`-divisible groups that are not formal, and §4.4's statement of Boxall's theorem, were not
  checked against the texts.
- The corrections the README makes to its sources that I did not recompute against the text: the
  sign `(−1)^{r−1}` and the translation by `−ν_n` in the proof of Kato's Proposition 15.9 (§§2.5–2.6),
  Jia's (2.43) and the display before (2.1) (§6.2), Finis's use of "adjoint" for the trace (§4.2).
- QUEYRUT74, GREENBERG83, RUBIN87, AH05, YANG97 and ROHRLICH-NOTES locators: not opened in this
  pass.
- The further sources named in R02 (Glauberman–Rogawski, Murase–Sugano) were not read.
- Elaboration: no Lean was run; the signatures are the worker's transcript.

## Source issues

- **Error** in KATO04 at (15.4.2), p.252: the source says the norm along any isogeny of curves with complex multiplication by the full ring of integers carries the refined theta function to that of the target; it should be required that the kernel meets the `a`-torsion trivially (for multiplication by `c` and `a = (c)` the pushed divisor is zero); affects a stated result.

## For the human reviewers

- **Licence.** The cached text of BKO21 carries a JSTOR download notice (BKO21 lines 496–498), while `sources.toml` records the Caltech repository URL; whether that copy is the repository's is for a human to confirm.
- **Scope.** JIA24, the source of §§6.2–6.4 and of the nonvanishing half of the Lean headline, was read as arXiv v1; README.md:888 gives a 2026 journal reference that I could not confirm.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9301218ac9e99d3458d283288a23948760d9568b", "job": "RT-NonordinaryCMSpecialValues~1b", "model": "fable", "worker": "chris-x29"} -->
