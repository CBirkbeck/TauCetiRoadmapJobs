<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13172#issuecomment-6899451953 -->
Review (claude) of bbd8bc6

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §3.15: cuspidality of the global lift of a split generic Π with only a Steinberg place is supplied by nobody

   **Location:** `packages/LocalLanglandsCorrespondenceForG2/README.md:640`, §3.15: "*Route:* the global generic lift to PGSp₆ (ExceptionalThetaCorrespondencesForG2, Layer 10) and its rank-seven transfer, cuspidal because of the Steinberg place".

   **Claim:** The route transfers the restriction of the lift Σ to GL₇, which needs Σ cuspidal (or at least discrete). For Π on split G₂ with a Steinberg component and no supercuspidal component, no cited section gives that.

   **Witness:** ExceptionalThetaCorrespondencesForG2 at its open head, §10.6: "If one finite component is supercuspidal and its local H lift is supercuspidal, the global lift is cuspidal"; §10.5 (Steinberg criterion) is "In the setting of the preceding period theorem", totally definite O. Take Π_u = St, unramified elsewhere: neither applies. GS line 538 asserts it unproved.

   **Exact repair:**
   1. Declare a supplier gap, in `## Exact supplier contracts` under ExceptionalThetaCorrespondencesForG2 and in the top-level `gaps` of `design/plan.json`: `What ExceptionalThetaCorrespondencesForG2 must provide (gap:split-steinberg-theta-cuspidality): for split G₂ over a totally real number field k, the global exceptional theta lift to PGSp₆ of a globally generic cuspidal automorphic representation with the Steinberg representation at one finite place is cuspidal (Layer 10, §§10.5–10.6: the split-form counterpart of the Steinberg criterion of §10.5; §10.6 gives cuspidality only from a supercuspidal place).`
   2. In §3.15, cite that contract for the cuspidality of Σ, and say separately that the rank-seven transfer is cuspidal because its component at u has the irreducible parameter Sym⁶.
   3. Add to the §3.15 *Needs:* line and to Layer 3 Dependencies what the route already uses: ExceptionalThetaCorrespondencesForG2 §10.7 (real infinitesimal-character matching, for regular algebraicity of the transfer), ModularityAndLanglandsExtensions §§3.15, 3.17 (the transfer and its local parameters, as §3.1 lists them), and the new contract.

   **Repair test:** on the witness (St at u, unramified elsewhere, split form) the new contract gives Σ cuspidal; Σ_u = θ(St_G₂) = St_PGSp₆ has Sp₆-parameter Sym⁶, of dimension 7 with invariants of dimension 0, so the isobaric transfer has one summand. The other uses of a cuspidal global exceptional lift were checked and need nothing: §3.1 and the nongeneric case of §6.4 (totally definite O, Steinberg place: §10.5), §5.3, §1.5 and the generic case of §6.4 (supercuspidal place with supercuspidal lift: §10.6).

2. **F02** (P2) GlobalQuadraticForms is cited, without section, for octonion and quaternion algebra statements it does not make

   **Location:** `packages/LocalLanglandsCorrespondenceForG2/README.md:295` (§1.1 *Needs*): "GlobalQuadraticForms (the totally definite octonion algebra and its quaternion subalgebras)"; line 327 (§1.4): "GlobalQuadraticForms (Hasse principle for quaternion and octonion algebras over k)"; line 378.

   **Claim:** §§1.1 and 1.4 take from that roadmap the existence of the totally definite octonion algebra O over k split at every finite place, and a global quaternion subalgebra D ⊂ O with prescribed localizations. The roadmap states neither, and it is absent from Scope and from the supplier contracts.

   **Witness:** main `TauCetiRoadmap/GlobalQuadraticForms/README.md` contains neither "octonion" nor "quaternion" (0 matches, case-insensitive, 1253 lines). It states quadratic-form theorems: §6.2 (line 864, representation of forms), §6.3 (line 898), §7.2 (line 933, existence with prescribed local behaviour). ExceptionalThetaCorrespondencesForG2 §9.1 is local and §10.1 takes O as given.

   **Exact repair:**
   1. Add GlobalQuadraticForms to the Scope imports and to "From Tau Ceti roadmaps on main", by section: §6.2 (a regular form is represented by another exactly when it is so at every finite and real place), §6.3 (Hasse–Minkowski isometry) and §7.2 (existence with prescribed local forms).
   2. State the two algebra facts as API bullets of §1.1, as targets of this roadmap with their route: (i) the octonion algebra with norm form x₁² + ⋯ + x₈² is definite at every real place and split at every finite place, and is the only such algebra up to isomorphism (octonion algebras are classified by their norm forms; §6.3); (ii) given quaternion algebras D_u for u in a finite set S, with D_u the Hamilton quaternions at real u, there is a quaternion algebra D over k, definite at every real place, with D ⊗ k_u ≅ D_u for u ∈ S, that embeds in O: its norm form is a subform of that of O at every place, hence globally (§6.2), and a quaternion algebra whose norm form is a subform of the norm form of O embeds in O.
   3. Replace the three sectionless citations by "§1.1 (the algebra O and its quaternion subalgebras); GlobalQuadraticForms §§6.2, 6.3, 7.2".

   **Repair test:** k = ℚ, S = {p, p′} with D_p, D_p′ division. D must also ramify at ∞, three places, so by parity D ramifies at one further finite place, which the statement allows (nothing is prescribed outside S). Locally n_D ⊥ −n_D is hyperbolic of rank 8, the norm form of split O, so n_D is a subform at each finite place; at ∞ four squares sit in eight. §6.2 then gives the global subform.

3. **F03** (P3) two routes cite less than they use

   **Location:** `README.md:956`, §8.1: "the components are generic or unramified up to a quadratic twist and their local lifts are nonzero (MetaplecticAutomorphicForms §3.41 and the twist rule …)"; `README.md:1129`, §10.9: "§6.2 with §6.6 excludes other packets … *Needs:* §§10.6–10.8, §0.5, §5.3, §6.6".

   **Claim:** (a) §3.41 is cited for unramified components, but it is stated for generic σ only. (b) §10.9's route names §6.2 and its *Needs:* line omits it.

   **Witness:** MetaplecticAutomorphicForms at its open head, §3.41: "For generic irreducible σ of PGSp₆, prove its PGSO₈ similitude lift nonzero"; hypotheses "generic σ". GS line 1581 uses a separate fact for unramified representations. §10.9: the route sentence against its *Needs:* line.

   **Exact repair:** (a) In §8.1 add the reason §3.41 applies: "an unramified component here is generic: it is a quadratic twist of the unramified constituent of a principal series whose Satake parameter is s̃ ∈ Spin₇(ℂ) with q(s̃) the Satake parameter of a local component of a unitary cuspidal representation of GL₇, and such a principal series is irreducible (as in §2.4)"; or cite the Borel-Levi case of the pgsp6-similitude-theta-tables contract for these components. (b) Add §6.2 to the *Needs:* line of §10.9.

   **Repair test:** (a) the trivial representation of PGSp₆(F) is unramified and not generic, so "unramified" alone does not put a component under §3.41; with the added clause the components of Σ are irreducible unramified principal series, hence generic. (b) §6.6 already needs §6.2, so no new edge and no cycle.

4. **F04** (P3) the manifest's locator for CG omits two cited items

   **Location:** `packages/LocalLanglandsCorrespondenceForG2/sources.toml:11`: "Lemma 3.10; Proposition 3.12; Example 1; Proposition 4.7; Corollary 4.8; Lemma 5.9; …".

   **Claim:** README §0.8 cites CG Corollary 4.6 (twice, with the References entry) and formula (16); the manifest's locator lists neither, and lists Proposition 4.7, which the README does not cite.

   **Witness:** README line 235 "CG Corollary 4.6 excludes global conjugacy"; line 237 "CG, formula (16), p. 32". CG line 478 is Corollary 4.6, CG line 486 Proposition 4.7.

   **Exact repair:** in the CG entry, set the locator to "Lemma 3.10; Proposition 3.12; Corollary 4.6; Example 1; Corollary 4.8; Lemma 5.9; Proposition 5.10; formula (16); Lemma 8.2; Proposition 8.3; Proposition 8.4" (same key, nothing else changed).

   **Repair test:** every CG item the README names (lines 225, 235, 237, 246, 1181) then appears in the entry.

Four findings: two P2 (a proof route whose cuspidality input no supplier states; a supplier cited, without section, for statements it does not make) and two P3. Both round-5 findings are repaired. `Suggested.lean` elaborates with `sorry` as its only warning, and neither admitted theorem is padding.

## Previous findings (round 5)

| Finding | Repaired passage | Status |
|---|---|---|
| F01 (P2), Spin₈ → Spin₇ branching owned twice | README §0.1 now reads "are the case r = 4 of the multiplicity-free Spin(2r) → Spin(2r − 1) branching of RepresentationTheory/ClassicalGroups, §6.2"; the Route is gone and only parameter forms are proved. Main's `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md` lines 1139–1146 state the lifted Spin rule for rows in ℤ + ½ and name it a target of §§6.2, 6.7. Scope (README line 20), the contract (line 113), *How to read the build* and Layer 0 Dependencies agree. | Repaired. No gap was needed: the text is on main, so the repair report's decision not to declare one is right. |
| F02 (P3), twist Check without its starting parameter | README lines 161–162: general rule "replaces the Frobenius eigenvalues λ₁, …, λ₈ of s ∘ φ̃ by −λ₁, …, −λ₈", then φ̃ trivial (traces 8 / −8, vector 7 / 7) and the negative control Frobenius ↦ i(j(diag(−1, 1, −1))) (traces 0 / 0, vector −1 / −1). | Repaired. Recomputed: v-spectrum at a = −1, b = 1 is 1, −1, 1, −1, −1, 1, −1 (trace −1); spin adds one 1, giving 1⁴(−1)⁴, stable under negation. |

The same repair touched §2.2 Check 2, §2.5 Checks 1 and 3 and §10.3 Check 2; each now names its parameter (trivial, or St_PGSp₆ with 1 ⊕ Sym⁶) and the values 8 / −8 are right. No other Check asserts constant spectra for an unnamed parameter. No finding of the repair report was marked not actionable.

## Verified sound

### Principles and shape

All 75 numbered targets, their *Needs:* lines, API bullets, Checks, the 11 Examples and 11 Dependencies blocks were read. No route-specific shortcut (residue characteristics 2 and 3 are inside every statement; the p = 3 restriction of §§4.2–4.3, 7.1 is the source's and is stated as an injection), no re-planned roadmap, no algorithm, no `set_option`, no sorry'd data, no `lemma`, no LaTeX delimiters, no process residue (searched: pull-request numbers, "round", paths, HTML anchors, "optional", "deferred": 0 hits). Layer titles name mathematics. Every definition (§§0.0, 0.6, 1.1, 1.2, 2.1, 2.2, 2.3, 3.2, 3.3, 3.9, 3.10, 4.1, 5.1, 6.3, 6.7, 7.3, 9.1, 10.1) has an API list and at least three Checks.

### Seeded source sample (15 of 15 read)

| Target | Text opened | Result |
|---|---|---|
| 0.1 | GS §4.1, pp. 16–17 (GS lines 687–710) | Restrictions std ⊕ 1 and spin along the standard embedding, as stated; locator p. 17 holds the formula. |
| 0.3 | GS Lemma 2.4(ii), p. 9 (GS lines 407–414); §8.3, p. 24 (GS lines 1001–1010) | Injection, pole characterization on discrete parameters, S_φ ≅ S_(ι∘φ)/Z(Spin₇): all three as stated. |
| 1.2 | GS §10.3, p. 29 (GS lines 1210–1220) | Split simple G over a number field; the orthogonal complement of the zero-Whittaker and non-σ span. The README's two-step wording gives the same subspace. |
| 1.4 | GS Proposition 10.5 and proof, pp. 28–29 (GS lines 1179–1197) | Nonempty set, Steinberg or supercuspidal with nonzero lift, any real representation; the proposition asserts nothing outside S, as the README says. The place z comes from the declared Poincaré contract. |
| 1.6 | GS Proposition 10.7 and proof, pp. 29–30 (GS lines 1223–1237) | Isolation hypothesis and "all but one place" are kept as statement (i). |
| 2.3 | GS §4.3, pp. 17–18 (GS lines 737–747); proof of 4.1, p. 18 (GS lines 771–773); §5.2, p. 21 (GS line 874) | Isobaric transfer, local components, cuspidality from the vanishing lower lift at the Steinberg place; 1 ⊞ std on p. 21. |
| 3.3 | GS §3.2, p. 11 (GS lines 462–475); HD Theorems 8.2, 8.5, PDF pp. 25–28 (HD lines 907–936, 1017–1030) | The duality orbit {τ, τ∨} and the value ι′ ∘ φ; St⁺ ↦ π_gen[1], St⁻ ↦ π_sc[1] (HD line 1038). |
| 3.13 | GS Main Theorem (x), p. 4 (GS line 176); §3.4, pp. 13–14 (GS lines 587–591) | Characterized by (i), (ii), (iii), (ix) = §§3.7, 3.6, 3.5, 3.12; the tempered-case converse argument. |
| 3.15 | GS Main Theorem (viii), p. 4 (GS lines 164–171); §3.4, p. 12 (GS lines 536–544) | Hypotheses match (globally generic, regular algebraic, totally real, Steinberg). The route's cuspidality step is R01. |
| 6.4 | GS proof of Lemma 8.3, pp. 24–25 (GS lines 1018–1051) | Two cases, split with a depth-zero supercuspidal place and totally definite with a Steinberg place. |
| 6.5 | GS Lemma 8.3, pp. 24–25 (GS lines 1014–1061) | Both places replaced; L^S(spin) = ζ^S · L^S(std); GS20 Theorem 1.1 used over k, declared as a contract. |
| 8.1 | GS Lemma 12.5 and proof, pp. 37–38 (GS lines 1574–1590) | Tower property at the Steinberg place, local nonvanishing, standard L-value. Citation precision is R03(a). |
| 10.2 | GS Theorem 12.6, p. 38 (GS lines 1598–1613) | Tempered and discrete are carried to weak classes of such parameters. |
| 10.6 | GS proof of Theorem 12.7(ii), pp. 39–40 (GS lines 1644–1675) | One-place replacement under a trivial global component group; equal GL₈ transfers. |
| 10.9 | GS Theorem 12.7(ii), p. 39 (GS line 1634); final paragraph, p. 40 (GS lines 1676–1680) | Unions of Xu packets; one packet over a G₂-valued class. |

Also opened: GS Propositions 5.1–5.2 (GS lines 839–882), Lemma 12.4 (GS lines 1543–1570), Theorem 12.3 (GS lines 1512–1536); HD Theorems 15.1–15.2 (HD lines 2001–2031); CG numbering (CG lines 345–510, 783–807, 1215–1242). The author flagged no locator as unverified.

### Adversarial table (sampled targets, headlines, targets the findings touch)

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §0.0 `octonionAut`, `griess_conjugacy` | 2·id; t = diag(ζ, ζ, ζ³), ζ⁵ = 1, against t² | 2(1·1) = 2 ≠ 4. det t = ζ⁵ = 1; v(t): 1, ζ, ζ, ζ³, ζ⁴, ζ⁴, ζ²; v(t²): 1, ζ², ζ², ζ, ζ³, ζ³, ζ⁴; multiplicity of ζ is 2 against 1 | Scaling excluded by multiplicativity; equal images do not give the hypothesis. |
| §0.1 Spin₈ → Spin₇ (repaired) | λ = (1,0,0,0), (½,½,½,±½); centre −1 | μ ∈ {(1,0,0), (0,0,0)}: 7 + 1 = 8; μ = (½,½,½) only: 8; traces 8 and −8 | Matches ClassicalGroups §6.2 on main. |
| §0.1 twist Check (repaired) | φ̃ = 1; Frobenius ↦ i(j(diag(−1,1,−1))) | 8 / −8 and 7 / 7; 0 / 0 and −1 / −1 | Rule and negative control both hold. |
| §0.1 principal SL₂ | 2ρ∨ = (6,4,2) on (±½,±½,±½) | 6, 4, 2, 0, 0, −2, −4, −6 = Sym⁶ ⊕ 1 | Consistent with §§2.4, 2.5, 5.1, 8.2. |
| §0.3 | principal; subregular | invariants of s ∘ i ∘ φ: 1; 2 (1 ⊕ 1 ⊕ Sym² ⊕ Sym², not discrete) | Discreteness hypothesis needed and present. |
| §0.8 `spin7_not_acceptable` | weights of V on (ℤ/4)², η = (0,2) | sum (4,4) ≡ 0; ηV = (1,2),(1,0),(0,3),(2,3); V∨ = (3,0),(3,2),(0,3),(2,3); V has (0,1),(2,1): three distinct multisets; x, y both odd gives x + y even | Elementwise conjugacy, no common conjugator. |
| §1.2 | V ⊕ V, W = W₀ + W₀ | diagonal: 2W₀(v) ≠ 0; antidiagonal: 0; an irreducible V′ in the complement with W = 0 lies in Z ∩ Z⊥ = 0 | First API bullet holds with multiplicities. |
| §1.4 with R02 | k = ℚ, S = {p}; S = {p, p′} | ramified sets {p, ∞} (even); {p, p′, ∞} (odd, one more finite place needed) | Globalizing D needs the Hasse-type input R02 asks to cite by section. |
| §1.6 | SL₂(ℝ): D_k^±, k = 2 against k ≥ 3 | ⟨Λ, α∨⟩ = 1: limits of complementary series; ≥ 2: isolated; Whittaker dimensions 1 and 0 for the two signs | Distance to walls and genericity are separate hypotheses. |
| §1.7 | t = 0, 1 | h = (3,2,1): two spin weights equal 0; h = (11,6,3): ±10, ±7, ±4, ±1; 8t + 3 > 6t + 3 iff t > 0; 14t even | Spin-regular exactly for t ≥ 1. |
| §2.3 | Steinberg place; lower-tower Σ | invariants of Sym⁶: 0; of 1 ⊕ Λ²Sym³ = 1 ⊕ 1 ⊕ Sym⁴: 2 (Λ² weights 4, 2, 0, 0, −2, −4) | Steinberg excludes the lower lift. |
| §2.4 | q = 5, s = 2, trivial Satake class; ψ₅ | (1 − 5⁻²)/(1 − 5) = −6/25; eighth power (6/25)⁸; \|5\|^(8·3/2) = 5⁻¹²; R_uR_wR_σ = 1 and R_uR_wR_σ² = 1 give R_σ = 1 | Normalization and cancellation consistent. |
| §3.3 | St^±; non-self-dual τ | two representations, one value (subregular); τ ≠ τ∨ with one value | Well defined on duality orbits. |
| §3.10, §3.13 | ψ_a; A₂ image | det(M ⊗ φ_τ) = det(M)^r det(φ_τ)⁷, exponent 7r; v ∘ L(π) = 1 ⊕ φ ⊕ φ∨ reducible, 3 summands | Converse for irreducibles alone would not suffice, as the Check says. |
| §3.15 with R01 | Π_u = St, unramified elsewhere | §10.6 clause needs a supercuspidal place: none; §10.5 needs definite O: split here; transfer at u: Sym⁶, dimension 7, 1 summand | Statement kept; route input missing (R01). |
| §4.3, §4.5 | S₃ | \|Irr\| = 3, \|S₃\| = 6; χ_std₂(3-cycle) = ζ₃ + ζ₃⁻¹ = −1; self-dual discrete series of PGL₃: only St unless p = 2 (χ ⊗ St self-dual iff χ = χ⁻¹, χ³ = 1, so χ = 1) | Labels and the p = 3 case consistent with HD 8.5(i). |
| §6.5 | sign ε at one place, at two | ε; ε² = 1 | Two equal places needed. |
| §7.1, §7.2 | principal, subregular, non-self-dual A₂ (p ≠ 3) | fibre sizes 1, 3, 3; generic members 1, 1, 1 | Fibre count is \|Irr(S_φ)\|. |
| §8.1 with R03 | trivial representation of PGSp₆(F) | unramified, Whittaker dimension 0 | "Unramified" alone is outside §3.41. |
| §10.2 | φ, φ′ weakly equivalent | q ∘ φ ≅ q ∘ φ′; discreteness of a Spin₇-parameter = multiplicity-free sum of irreducible orthogonal summands in q ∘ φ, a property of the class of q ∘ φ; Sym³ through h: 1 ⊕ 1 ⊕ Sym⁴, multiplicity 2 | Constancy on weak classes is true. |
| §10.6 | σ′ ∈ X, σ outside the Spin₆ locus | q ∘ L_w(σ) has 0 trivial summands; members of Irr♠ ∪ Irr♣ have 1 ⊕ Λ²φ_τ, at least 1 (§9.2); so σ′ ∈ Irr♥ and §8.1 applies to Σ′ | Step from inside GS's proof checked at this generality. |
| §10.9 | weak class of i ∘ φ | lifts of q ∘ i ∘ φ: χ · (i ∘ φ); s-image χ ⊗ (1 ⊕ v ∘ φ) ≅ 1 ⊕ v ∘ φ forces conjugacy (§0.5): 1 Spin₇-class; CG pair: 2 classes | Single packet only on the G₂ image. |
| `sumSquaresSeven` | e₁; e₁ + i e₂ | 1; 0 | Nondegenerate and isotropic over ℂ, as wanted. |

### Lean file

- `lake env lean` on `packages/LocalLanglandsCorrespondenceForG2/Suggested.lean`, from the content checkout: exit 0; the only diagnostics are `declaration uses 'sorry'` at 118:8 and 137:8. `TauCeti.Algebra.Octonion.Basic` was already built.
- `#check @` on all five declarations in a scratch copy: types equal those of the worker's signature list; `octonionRep` keeps `[Group Γ]`, `griess_conjugacy` both semisimplicity hypotheses and the intertwiner, `spin7_not_acceptable` `Finite Γ`. Nothing changed.
- One-tactic probe, every sorried theorem (2 of 2), six tactics each (`simp`, `rfl`, `infer_instance`, `exact ⟨1, fun γ => by simp⟩`, `aesop`, `decide`): 12 of 12 fail. No padding.
- Headlines: Griess (§0.0) and unacceptability (§0.8) stated; every other headline of the Summary (§§0.2–0.5, 0.9–0.10, 1.4–1.7, 2.2–2.5, 3.12–3.15, 5.1–5.6, 6.6, 7.1–7.3, 8.2, 10.1, 10.9) is named in the module docstring with the missing carrier. All five backticked names of the roadmap's own are declared. Imports: `import Mathlib` and one used Tau Ceti module.
- Declarations opened at the pins: Mathlib `LinearAlgebra/CliffordAlgebra/SpinGroup.lean:62` (`lipschitzGroup`), `:293` (`spinGroup`, a `Submonoid`; the group structure is an instance, as the README says); `LinearAlgebra/QuadraticForm/Basic.lean:1408` (`weightedSumSquares`); `RepresentationTheory/Semisimple.lean` (`IsSemisimpleRepresentation`); `Algebra/Group/Conj.lean:32`; `LinearAlgebra/Matrix/Charpoly/Basic.lean:158`, `Charpoly/Coeff.lean:115`, `:119`; `LinearAlgebra/Matrix/Determinant/Basic.lean:80`; `Data/Matrix/Diagonal.lean:50`. Tau Ceti `Algebra/Octonion/Basic.lean:143`, `:336`, `:354`, `:365`, `:537`, `:551`, `:831`, `:861`; `Algebra/Lie/D4/Tripled/Triality/Basic.lean:155`, `:197`; `NumberTheory/ClassFieldTheory/WeilGroup/Basic.lean:181`, `:235`. All exist under the cited names.

### Suppliers, duplication, merge order

Resolved at main or the open head, by heading: ExceptionalThetaCorrespondencesForG2 §§0.1, 0.6–0.9, 1.8, 5.1–5.4, 5.7–5.9, 6.7, 8.1–8.4, 8.8–8.10, 9.1, 9.3–9.6, 10.3–10.7 (every italic title matches a heading); MetaplecticAutomorphicForms §§3.10, 3.17, 3.34, 3.41, 3.42, 6.13, 6.14; ModularityAndLanglandsExtensions §§2.43, 3.5, 3.8, 3.15, 3.17, 3.19, 3.27, 5.1; EndoscopicTransferAndUnitaryTraceComparison §§1.13, 4.7a, 4.8, 10.1 (geometric Φ, ω(Φ) = q⁻¹, as Conventions says), 10.26, 10.30, 10.31; SmoothRepresentationsOfLocalGroups SR.2.1–2.3, 3.1, 3.3, 5.2 (*classical-llc-normalization*); Part II SRU.1.1, 1.7–1.10, 3.8, 3.10, 4.7, 4.8; AutomorphicFormsOnReductiveGroups Layers 0, 2 (§§2.4–2.5), 4 (§§4.2–4.3); AutomorphicSpectralTheory §§6.16, 6.18, 6.19; AutomorphicGaloisRepresentationsPartII AG2.2, AG2.5, AG2.6; AutomorphicLFunctionsAndLocalFactors AL.3, AL.4; Part II Layer 6; ClassicalGroups §§6.2, 6.7 on main. The supplier's `ramified-spin-factor` and `regular-real-unitarity` contracts read as this README describes them. Exceptions: R01, R02, R03(a).

The 14 gap slugs are the same in the README and in `design/plan.json`; each names an earlier supplier and one object with its hypotheses. None asks for what a supplier already states (checked against §§3.41, 10.5–10.7, SRU.4.7 and ClassicalGroups §6.2).

Duplication by object: `roadmaps grep` for Griess, unacceptability, multiplicative octonion maps and a G₂ or weak PGSp₆ correspondence finds no other owner; ExceptionalThetaCorrespondencesForG2 declares the complete G₂ correspondence "downstream" and its `Suggested.lean` declares nothing that collides. `scratch/overlaps.md` lists no dropped id, no revision-only id and no other pull request changing this roadmap.

Overlap check: read ExceptionalThetaCorrespondencesForG2, AutomorphicLFunctionsAndLocalFactorsPartII, ModularityAndLanglandsExtensions, SmoothRepresentationsOfLocalGroups, SpinRepresentations (scope and cited sections; TwistedAutomorphicDescents and GanGrossPrasadUnitaryGroups by search only); shared objects: dual inclusions, complex parameters and component groups — owner ExceptionalThetaCorrespondencesForG2 Layer 0; spin factor of PGSp₆ — owner AutomorphicLFunctionsAndLocalFactorsPartII Layer 6, by the declared contracts of both roadmaps; nothing owned twice.

Dependency check, output exactly:

```text
depcheck: 246 roadmaps, 2254 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. No banned supplier is cited.

### Copyright, licences and scope

Wording: 21 passages of the README (the 15 sampled statements, §§5.1–5.3, §1.7, §8.2, §9.4) and the 5 docstrings of `Suggested.lean` were set beside GS, HD and CG at their locators; none shares a run of words beyond formulas and standard names, and several routes (§§2.4, 4.3, 1.7) differ from the source's argument. Arrangement: GS §§2, 3, 3.5, 4, 5, 6–8, 9, 10–11, 12 correspond to Layers 0, 3, 4, 2, 5, 6, 7, 1, 8–10: not in order, Layer 0 draws on C, CG and HKT, and the order Layer 1 → 2 → 3 is forced (§2.4 needs §1.6; §3.1 needs §1.4). Reuse: no table, figure or list is taken over.

Source independence: 26 passages compared with 3 sources, none shared; largest share GS, 76 of 115 locators; contents compared with GS: independent.

## Not verifiable

- Griess, Theorem 1: settled as uncertified; cited by locator, not read. Its use is corroborated only through C, HKT and GS.
- Shin, SV, ILM, KS, GF, GS20 and HKT were not reopened this round; their locators are outside the seeded sample and unchanged since the rounds that read them.
- The truth of the contract R01 proposes was not checked against a text; the mechanism (the Steinberg representation of G₂ has no lift to PGL₃) is the supplier's to prove.
- Ownership against the 240 open pull requests was checked through the indexed search and the overlap list, not by reading each.

## Source issues

- **Gap** in GS at §3.4, compatibility with global Langlands, p. 12: the source says the global lift of a generic Π on split G₂ with a Steinberg place is cuspidal; it should give a cuspidality argument for the split form; affects the proof.
- **Gap** in GS at Proposition 4.1(i), proof, p. 18: the source says the globalization is spherical at all other finite places; it should account for the one uncontrolled place its Proposition 10.7 allows; affects the proof.
- **Error** in GS at Main Theorem (vi), p. 4: the source says the lift of a generic discrete series is a generic discrete series of PGSp₆; it should be generic tempered, by HD Theorem 15.2(iii); affects a stated result.
- **Misprint** in GS at Main Theorem (ix), p. 4: the source says the gamma factor closes before the tensor factor; it should enclose the tensor product, as on p. 13; affects nothing.
- **Misprint** in GS at §3.1, p. 10: the source says the dichotomy is Theorem 2.1(i); it should be the dichotomy part, since (i) is Howe duality; affects nothing.
- **Misprint** in GS at Lemma 12.4, proof, p. 37: the source says the component at v₀ is π; it should be σ; affects nothing.
- **Misprint** in HD at §15.1, PDF p. 52: the source says Theorem 15.1(v) gives temperedness of the lift; it should be 15.1(iv); affects nothing.

## For the human reviewers

- **Licence.** `sources.toml` records Griess (doi:10.1007/BF01884298) as uncertified with licence class "none"; the headline `griess_conjugacy` in `Suggested.lean` line 118 rests on that locator, read only through C, HKT and GS.
- **Licence.** Shin is recorded with licence class author-page (`sources.toml` lines 129–141); its page numbers in §1.7 are those of the author PDF, not of the journal.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "bbd8bc67908b6a6a26fd0e485b8e9dbdddb27716", "job": "REV-PKG-LocalLanglandsCorrespondenceForG2~6", "model": "fable", "worker": "chris-x79"} -->
