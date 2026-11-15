<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13172#issuecomment-6901629613 -->
Review (claude) of 588c1fa

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) §3.11: the functional equation uses undefined archimedean factors, and its route uses global lifts nobody supplies

   **Location:** `packages/LocalLanglandsCorrespondenceForG2/README.md:625`, §3.11: "*Route:* GF Proposition 2.3 transfers supercuspidal support; the two global theta routes give the functional equation; globalization of a supercuspidal pair (§1.4) gives uniqueness. *Needs:* §3.10, §1.4; … ExceptionalThetaCorrespondencesForG2, Layer 10."

   **Claim:** §3.11 asserts that the family of §3.10 satisfies, and is the only family satisfying, a functional equation `L^S(1 − s, Π × T∨) = ∏_(u∈S) γ(s, Π_u × T_u, ψ_u) L^S(s, Π × T)`. Four things are missing.

   1. S is not defined, and it contains the real places; §3.10 defines γ only over the nonarchimedean F, so the factors at real u are undefined. GF defines them through the archimedean correspondence (GF lines 112–118) and fixes them in the uniqueness argument (GF line 310).
   2. The alternative "or to PD×" and the uniqueness on supercuspidal π ∈ Irr♠ (GF Lemma 2.5, GF lines 321–356) need the global theta lift between Aut(D), D a cubic central simple algebra over k, and split G₂, in a group of type E₆. Layer 10 of the supplier has no such pair.
   3. Identifying the real components of the lifts (GF lines 234–243, 254–257) needs the real theta correspondence on parameters: compact G₂ (all irreducibles) and split G₂ (spherical). The supplier's §10.7 matches infinitesimal characters only.
   4. Uniqueness on supercuspidal π ∈ Irr♥ needs a globalization that is non-supercuspidal at every other finite place (GF lines 288, 309). §1.4 leaves one finite place z uncontrolled.

   **Witness:** ExceptionalThetaCorrespondencesForG2 at its open head: Layer 10 is §§10.1–10.7, all on Aut(O) × PGSp₆ in E₇ (§10.1 "The global Albert E₇ pair"); no global cubic pair. §1.4: "spherical at every finite place outside S ∪ {z}". GF line 288.

   **Exact repair:**

   1. In the statement of §3.11 say: "S is a finite set of places of k containing the real places and every finite place where Π, T or ψ is ramified; at a real place u the factor is `γ(s, (v ∘ φ_(Π_u)) ⊗ φ_(T_u), ψ_u)` for the archimedean Langlands parameters of Π_u and T_u (GF, §2.4, pp. 3–4; AutomorphicFormsOnReductiveGroups §§2.4–2.5); the family ranges over all nonarchimedean local fields of characteristic zero at once, the archimedean factors being fixed." Change the locator to "GF, Theorem 2.4, Lemma 2.5 and §§2.6–2.8, pp. 5–9" and add "§2.4; Lemma 2.5" to the GF entry of `sources.toml`.
   2. Declare, under ExceptionalThetaCorrespondencesForG2 in `## Exact supplier contracts`, in the Scope paragraph of consumed contracts and in the top-level `gaps` of `design/plan.json`:
      - `What ExceptionalThetaCorrespondencesForG2 must provide (gap:cubic-jordan-global-theta): for a number field k, a central simple k-algebra D of degree three, H = Aut(D) the automorphism group of the Jordan algebra D (H(k_v) ≅ PGL₃(k_v) ⋊ ℤ/2 where D splits, with identity component PD_v× elsewhere) and split G₂, the global theta lift in both directions for the dual pair H × G₂ in the group of type E₆ attached to D (Layer 10), every irreducible constituent of a lift having at each finite place a local component in the local correspondence of §§5.1 and 5.9; and a cuspidal representation of H with a nonzero period over the stabilizer of a cubic subfield e ⊂ D has a nonzero lift to G₂, cuspidal when one finite component of the lift is supercuspidal (GF, Lemma 2.5 and proof, pp. 8–9).`
      - `What ExceptionalThetaCorrespondencesForG2 must provide (gap:real-exceptional-theta-parameters): at a real place, the theta lift to PGSp₆(ℝ) of an irreducible representation of the compact G₂(ℝ) with parameter φ is the holomorphic discrete series whose Sp₆-parameter is v ∘ φ; and for split G₂(ℝ), Howe duality for spherical representations of the pairs G₂ × PGSp₆ and (PGL₃ ⋊ ℤ/2) × G₂, the parameters being related by i and by j (Layer 10, §10.7, which matches infinitesimal characters only; GF, §2.7, pp. 6–7).`
   3. Extend the poincare-weak-containment contract and §1.3 by "(a′) if k has a real place outside S, the conclusion of (a) holds with no place z" (the counterpart of (b′); GF, §2.8, p. 7, uses the globalization in this form), and add to §1.4 the statement "(ii) if S contains no real place, Π can be taken spherical at every finite place outside S". Add an instance (c) of the same contract for H = Aut(D), D a cubic division algebra over k, and the stabilizer of a cubic subfield, as GF Lemma 2.5 uses it.
   4. Replace the Route by: cuspidal support by GF Proposition 2.3; the functional equation by the E₇ lift (Layer 10, §§10.3–10.5) or the cubic contract, with real components by the real contract; uniqueness on supercuspidal π ∈ Irr♥ by §1.4(ii) with S = {v₀}, or S = {v₀, v₁} with St at v₁ when θ(π) is not supercuspidal (cuspidality by §10.5); uniqueness on supercuspidal π ∈ Irr♠ by the cubic contract. List these in *Needs:* and in Layer 3 Dependencies.
   5. Add the Check: "with one uncontrolled place z the two functional equations give only R_π R_z = 1 for the ratio R of two families, satisfied by R_π = 2, R_z = 1/2; §1.4(ii) leaves no such place".

   **Repair test:** on the refuting instance (S = {v₀}, Π_z supercuspidal), §1.4(ii) removes z: every finite v ≠ v₀, v₁ is spherical, so R_v = 1 by the torus rule; R = 1 at St by the Levi rules; the real factors are common. Hence R_π = 1. For π = θ_D(τ) supercuspidal in Irr♠, dim τ > 1, §1.4 does not apply (its hypothesis is a nonzero lift to PGSp₆); the cubic contract supplies the globalization.

2. **F02** (P2) the contract pgsp6-pgso8-unramified-theta is not minimal: the unramified components of §8.1 are generic by an existing supplier

   **Location:** `packages/LocalLanglandsCorrespondenceForG2/README.md:80`: "it is not contained in the generic case of §3.41, since an unramified representation, the trivial one for instance, need not be generic"; `README.md:990`: "a route through the generic case alone leaves the unramified places open".

   **Claim:** The contract asks MetaplecticAutomorphicForms for the nonvanishing of the lift of every unramified representation. §8.1 uses it only on components that are irreducible unramified principal series, hence generic, where §3.41 already applies. The repair report declared it because "Kato's irreducibility criterion … No supplier states it"; a supplier does.

   **Witness:** SmoothRepresentationsOfLocalGroupsPartII at its open head, SRU.5, §5.3: "5.4 Irreducibility of unramified principal series (*unramified-principal-series-irreducibility*)" (Kato, split adjoint G) and "5.5 … L(s) is generic iff X(s) is irreducible". AutomorphicLFunctionsAndLocalFactors AL.3.3.8: `q^(−1/2) < |α_i| < q^(1/2)`.

   **Exact repair:**

   1. Delete the contract from `## Exact supplier contracts`, from the Scope paragraph (`README.md:23`, "the nonvanishing of the similitude lift of unramified representations to split PGSO₈") and from the `gaps` of `design/plan.json`; remove it from the *Needs:* of §8.1 and from Layer 8 Dependencies.
   2. In the §8.1 Route replace the clause on the other finite places by: "at the other finite places the component is χ_v ∘ sim ⊗ σ_v⁰ with σ_v⁰ unramified of Satake parameter s̃ ∈ Spin₇(ℂ); the Sp₆-restriction of Σ has a simple generic global parameter, a unitary cuspidal Π of GL₇, because its component at v₁ has the irreducible parameter Sym⁶ (ModularityAndLanglandsExtensions §§3.8, 3.17), and q(s̃), with eigenvalues λ₁^(±1), λ₂^(±1), λ₃^(±1), 1, is the Satake parameter of Π_v, so `q^(−1/2) < |λ_i| < q^(1/2)` (AutomorphicLFunctionsAndLocalFactors, AL.3.3.8); the roots of Spin₇ take on s̃ the values λ_i^(±1) and λ_i^(±1) λ_j^(±1), i < j, of absolute value strictly between q⁻¹ and q, so the unramified principal series of σ_v⁰ is irreducible and σ_v⁰, with its twist, is generic (SmoothRepresentationsOfLocalGroupsPartII, SRU.5, §5.3, *unramified-principal-series-irreducibility* and *spherical-generic-criterion*, PGSp₆ being split, adjoint and quasi-simple); §3.41 gives the nonzero lift". Add these three citations to *Needs:* and to Layer 8 Dependencies.
   3. Replace the fourth Check of §8.1 by: "Unramified alone does not give genericity: the trivial representation of PGSp₆(F) has (λ₁, λ₂, λ₃) = (q³, q², q) and Whittaker space 0. It cannot be a component of Σ, since |λ₁| = q³ ≥ `q^(1/2)` violates the bound on the Satake parameters of a unitary cuspidal representation of GL₇; the bound is what places the unramified components under §3.41."

   **Repair test:** on the instance that refuted round 6's wording (the trivial representation), the bound fails at λ₁ = q³, so it is excluded. For a component of Σ: |λ_i| < `q^(1/2)` < q and |λ_i λ_j^(±1)| < q, so no root value is `q^(±1)`; this holds in every residue characteristic.

3. **F03** (P3) four *Needs:* lines: three list a target the route does not use, one omits a supplier it uses

   **Location:** `packages/LocalLanglandsCorrespondenceForG2/README.md:386` (§1.7): "*Needs:* §1.6; AutomorphicSpectralTheory, automorphic-plancherel-density contract"; `README.md:635` (§3.12): "*Needs:* §3.9, §3.10, §3.11"; `README.md:645` (§3.13): "§§3.5–3.7, §3.11, §3.12"; `README.md:467` (§2.4): "generic and spherical, hence an irreducible unramified principal series".

   **Claim:** (a) The route of §1.7 is the Plancherel density theorem, the multiplicity formula and a quadratic twist; it never uses §1.6. (b) §3.12 follows from §3.9, §3.10 and the GL_r correspondence; (c) the route of §3.13 is the converse theorem, §0.4 and §3.5. Neither uses §3.11, yet both, and through them §7.1, wait for it. (d) The step of §2.4 is a theorem with an owner that the *Needs:* line does not name.

   **Witness:** GS lines 1549–1570 (proof of Lemma 12.4: no use of Proposition 10.7). GS lines 576–579 (item (ix) from the definition and the GL_r correspondence). SmoothRepresentationsOfLocalGroupsPartII §5.3, 5.5: "L(s) is generic iff X(s) is irreducible".

   **Exact repair:** remove "§1.6" from the *Needs:* of §1.7; remove "§3.11" from the *Needs:* of §3.12 and of §3.13; in §2.4 add "(SmoothRepresentationsOfLocalGroupsPartII, SRU.5, §5.3, *spherical-generic-criterion*)" after "irreducible unramified principal series" and add that citation to the *Needs:* of §2.4 and to Layer 2 Dependencies.

   **Repair test:** §5.2 keeps its own "§1.6, §1.7", so no consumer loses an input. After (b) and (c) the items (ix) and (x) of §7.1 no longer depend on the contracts of R01. The citation of (d) is to a roadmap earlier in the merge order (line 294 against 316).

Three findings: one P1 (§3.11 rests on global and archimedean inputs that no supplier states, and its functional equation uses factors the roadmap does not define), one P2 (the contract pgsp6-pgso8-unramified-theta asks for a theorem the route does not need: an existing supplier section makes the unramified components generic) and one P3 (four *Needs:* lines). All four round-6 findings are repaired. `Suggested.lean` elaborates with `sorry` as its only warning and neither admitted theorem is padding.

## Previous findings (round 6)

| Finding | Repaired passage | Status |
|---|---|---|
| F01 (P2), cuspidality of the lift of a split generic Π with a Steinberg place | `README.md:61`: "What ExceptionalThetaCorrespondencesForG2 must provide (gap:split-steinberg-theta-cuspidality): for split G₂ over a number field k and a globally generic cuspidal automorphic representation Π …"; §3.15 Route: "cuspidal by the split-steinberg-theta-cuspidality contract"; *Needs*, Layer 3 Dependencies and the Check at `README.md:672` agree; same slug in `design/plan.json`. | Repaired. The supplier at its open head still gives cuspidality only from a definite O (§10.5) or a supercuspidal place (§10.6), so the contract asks for nothing provided. |
| F02 (P2), GlobalQuadraticForms cited without section for octonion facts | `README.md:296–302`: §1.1 (i)–(iii) state the classification by norm forms, the totally definite algebra and its quaternion subalgebras; the five remaining citations all read "GlobalQuadraticForms §6.3"; R17.1.5 is cited for ramification realization. | Repaired, by a different route from the one proposed; the route is sound (rows below). |
| F03 (P3), §8.1 cites §3.41 for unramified components; §10.9 *Needs* | §8.1 Route now uses a new contract pgsp6-pgso8-unramified-theta; §10.9 *Needs* reads "§§10.6–10.8, §0.5, §5.3, §6.2, §6.6". | Part (b) repaired. Part (a) is closed formally, but through a contract that is not minimal and on a premise that is false: R02. |
| F04 (P3), CG locator in the manifest | `sources.toml:11`: "Lemma 3.10; Proposition 3.12; Corollary 4.6; Example 1; Corollary 4.8; Lemma 5.9; Proposition 5.10; formula (16); Lemma 8.2; Proposition 8.3; Proposition 8.4". | Repaired. |

No finding of the repair report was marked not actionable. The repaired patterns were searched for in the rest of the package: a route step with no supplier (found again in §3.11: R01; and in §2.4, where the supplier exists and is not cited: R03), and a sectionless supplier citation (none left).

## Verified sound

### Principles and shape

All 75 numbered targets were read in full with their *Needs:* lines, API bullets and Checks, and the 11 Examples and 11 Dependencies blocks. No route-specific shortcut (residue characteristics 2 and 3 are inside every statement; the restriction at p = 3 in §§4.2–4.3 and 7.1 is the source's, GS line 162, and is stated as an injection), no re-planned roadmap, no algorithm, no `set_option`, no sorry'd data, no `lemma`. Residue scan of `README.md` and `Suggested.lean` (pull-request numbers, "round", "current", "removed", "optional", "deferred", paths, HTML anchors, LaTeX delimiters): 0 hits. Layer titles name mathematics. Every definition (§§0.0, 0.6, 1.1, 1.2, 2.1, 2.2, 2.3, 3.2, 3.3, 3.9, 3.10, 4.1, 5.1, 6.3, 6.7, 7.3, 9.1, 10.1) has an API list and at least three Checks.

### Seeded source sample (15 of 15 read)

| Target | Text opened | Result |
|---|---|---|
| 0.0 | C line 2239 (end of proof of Theorem 6.4, PDF p. 55 = printed p. 149); HKT lines 896–915 (Lemma 4.6, pp. 21–22); GS lines 587–591 (p. 13) | All three use the conjugacy theorem in the form stated. Griess itself: not readable (below). |
| 0.7 | GS lines 1448–1450 (Lemma 12.2, p. 34); CG lines 345–348, 372–377 | Equivalence as stated; Lemma 3.10 and Proposition 3.12 give the semisimple step of the route. |
| 1.1 | GS lines 1168–1178 (§10.2, p. 28) | L²_D as the complement of the zero-period span; k totally real, O totally definite. SpV: not readable (below). |
| 1.3 | GS lines 1184–1197, 1228–1237 (pp. 28–30); SV lines 11075, 11239; ILM lines 952–983 (pp. 19–20) | Both weak containments; the totally complex arrangement with small archimedean support is ILM's. |
| 3.6 | GS lines 108–112 (p. 3), 517–527 (p. 12) | Tempered iff bounded on W_F; induced parameter from a unitary discrete series of M. |
| 3.8 | GS lines 528–531 (p. 12) | Fibre of size 1 or 2 with \|S_φ\| = 1 or 2, unique generic member, for all p (GS line 535). |
| 3.11 | GF lines 126–204 (pp. 4–5), 226–362 (pp. 6–9) | The three Levi rules and (d) match Theorem 2.4(i). The global property and the route: R01. |
| 4.5 | GS lines 1100–1110 (Theorem 9.1(i), p. 26) | p ≠ 3; labels trivial or nontrivial on the image of π₀ Z_SL₃(φ_τ). |
| 6.1 | GS lines 889–918 (pp. 21–22) | Both cases; the twist by χ uses Proposition 4.1(ii), README §2.5. |
| 7.3 | GS lines 1083–1097 (§9, p. 26) | Two base points, X*(φ) and i ∘ φ, give the bijection of homogeneous sets. |
| 7.4 | GS lines 1114–1121 (p. 27) | η = η′ ∘ i_*; the README restricts to the diamond discrete range, as its Notes say. |
| 8.2 | GS lines 1512–1536 (p. 36), 1591–1595 (p. 38); KS line 2962 | Existence and uniqueness in Φ_w; Proposition 13.1 under (St), (L-coh), (spin-REG). |
| 10.4 | GS line 1628 (p. 39) | The source leaves the lower-tower case to the reader; the README states it with its route. |
| 10.6 | GS lines 1644–1675 (pp. 39–40) | Trivial global component group, one-place replacement, near equivalence on GL₈. |
| 10.8 | GS line 1644 (p. 39) | The source asserts the reduction; the README states it as a target. |

The author flagged no locator as unverified.

### Adversarial table (sampled targets, headlines, changed passages, targets the findings touch)

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §0.0 `octonionAut`, `griess_conjugacy` | 2·id; t = diag(ζ, ζ, ζ³), ζ⁵ = 1, against t² | 2(1·1) = 2 ≠ 4; v(t): 1, ζ, ζ, ζ³, ζ⁴, ζ⁴, ζ²; v(t²): 1, ζ², ζ², ζ, ζ³, ζ³, ζ⁴; multiplicity of ζ 2 against 1 | Scaling excluded; equal images are not the hypothesis. |
| §0.1 Checks | a = −1, b = 1; centre −1 | 1, −1, 1, −1, −1, 1, −1, so (X−1)³(X+1)⁴; traces 8 and −8 | Hold. |
| §0.2 | φ_τ = 1 ⊕ 1 ⊕ 1; self-dual discrete φ_τ | L(s) = (1 − q⁻ˢ)⁻⁷, pole of order 7; χ ⊗ St self-dual iff χ² = χ³ = 1, so χ = 1; irreducible 3-dimensional orthogonal image needs A₄ or S₄, so p = 2 | Criterion only for discrete φ; §4.3's p = 3 claim holds. |
| §0.7 | γ, −γ with one SO₇-image | tr_S(−γ) = −tr_S(γ): equal iff 0, which is CG Lemma 3.10(iii) | Semisimple step holds. |
| §0.8 `spin7_not_acceptable` | weights on (ℤ/4)², η = (0, 2); ℚ₅, ℚ₃ | sum (4, 4) ≡ 0; ηV = (1,2), (1,0), (0,3), (2,3); V∨ = (3,0), (3,2), (0,3), (2,3); orders 16 and 8 of F×/F×⁴ | Three distinct multisets; pullback exists for ℚ₅ only. |
| §1.1(i) (new) | ℝ; isotropic norm, x = a + v | signatures (8, 0) and (4, 4); a ≠ 0: n₀(v/a) = −1; a = 0: n₀ isotropic, universal; then v² = 1 and K[v] ≅ K × K | Holds in characteristic ≠ 2. |
| §1.1(ii) (new) | ℚ₂; ℚ(√2), c = −(1 + √2); k totally complex | −7 ≡ 1 mod 8 is a square, 7·1 + (−7) = 0; −c ↦ 2.414 and −0.414; no real place: O is split, unique | Holds; "every real place" needed. |
| §1.1(iii) (new) | ℚ, S = {p}; {p, p′}; {2} split; real u ↦ M₂(ℝ) | {p, ∞}: 2, even; {p, p′, ∞}: 3, one prime added; (−1, −3): −1 at 3 and ∞, +1 at 2; det has signature (2, 2), not in (8, 0) | Holds; R17.1.5 used with S_∞ all real places. |
| §1.4, with R01 | S = {v₀}; S = ∅ | conclusion allows #({z} ∖ S) = 1; S = ∅ gives the constant function | Statement sound; too weak for §3.11. |
| §1.7 | t = 0, 1 | h = (3, 2, 1): spin weight 0 twice; h = (11, 6, 3): ±10, ±7, ±4, ±1; 8t + 3 > 6t + 3 iff t > 0; 14t even | Spin-regular exactly for t ≥ 1. |
| §2.3 | St place; lower tower | invariants of Sym⁶: 0; Λ²Sym³ = Sym⁴ ⊕ 1, so 1 ⊕ Λ²Sym³ has 2 | Steinberg excludes the lower lift. |
| §2.4 | ℚ₅, s = 2; ψ₅; one uncontrolled place | (1 − 5⁻²)/(1 − 5) = −6/25; (6/25)⁸; \|5\|¹² = 5⁻¹²; R_σ = 2, R_z₁ = 1/2, R_z₂ = 1/4 solve the weaker system | Normalization consistent; the Check is the model for R01. |
| §3.2, §3.6 | trivial representation | v-eigenvalues q⁻³, …, q³ at arithmetic Frobenius, N = 0, unbounded | Non-tempered, distinguished from St by N. |
| §3.8 | torus characters (χ₁, χ₂) quadratic, independent | all six coroot characters nontrivial; stabilizer in W is {±1}; R-group of order 2; dual centralizer T ⋊ {±1}, π₀ of order 2 | \|Irr(S_φ)\| ∈ {1, 2} consistent. |
| §3.10 | ψ_a | det(M ⊗ φ_τ) = det(M)^r det(φ_τ)⁷, dimension 7r | Multiplier as stated. |
| §3.11, R01 | Levi rules; real u ∈ S; π ∈ Irr♠ supercuspidal; place z | 2+2+1+1+1 = 7 and 2+2+3 = 7; §3.10 has no real factor; Layer 10 has no cubic pair; R_π R_z = 1 does not give R_π = 1 | Local rules right; global property and route incomplete. |
| §3.15 | Π_u = St, unramified elsewhere; infinitesimal character ρ | §10.5 needs definite O, §10.6 a supercuspidal place: neither; Sym⁶ has 0 invariants; v-weights 3, 2, 1, 0, −1, −2, −3 | Contract needed; one summand; regular. |
| §4.3, §4.5 | S₃ | \|Irr\| = 3, \|S₃\| = 6; χ_std₂ at a 3-cycle: −1 | Labels by restriction, not by a value. |
| §6.1 | χ-twist of a KS member | q unchanged; s ∘ (χφ_σ) = χ ⊗ s ∘ φ_σ, the parameter of SpinLift(σ ⊗ χ) by §2.5 | Replacement of σ valid. |
| §8.1, R02 | trivial representation; a component of Σ | (q³, q², q): \|λ₁\| ≥ `q^(1/2)`, excluded; \|λ_i\|, \|λ_i λ_j^(±1)\| < q: no root value `q^(±1)` | Components are generic; contract unnecessary. |
| §10.4 | χ quadratic; μ² ≠ 1 | Λ²(φ ⊗ χ) = χ²Λ²φ = Λ²φ; (φ ⊗ χ)∨ = φ∨ ⊗ χ | Holds only for quadratic characters, as stated. |
| §10.6 | σ′ ∈ X | q-image of a lower-tower member has a trivial summand; a trivial summand of q ∘ φ̃ is a fixed vector, stabilizer SO₆, preimage Spin₆; excluded by hypothesis | σ′ ∈ Irr♥, so §8.1 applies to Σ′. |
| §10.8 | Borel Levi, unramified data | each packet a singleton | Reduction non-vacuous only on reducible inductions. |
| `sumSquaresSeven` | e₁; e₁ + i e₂ | 1; 0 | Nondegenerate, isotropic over ℂ. |

### Lean file

- `lake env lean` on `packages/LocalLanglandsCorrespondenceForG2/Suggested.lean`, from the content checkout: exit 0; the only diagnostics are `declaration uses 'sorry'` at 118:8 and 137:8. `TauCeti.Algebra.Octonion.Basic` was already built.
- `#check @` on the five declarations in a scratch copy: the types equal the worker's signature list (`octonionRep` keeps `[Group Γ]`; `griess_conjugacy` both semisimplicity hypotheses and the intertwiner; `spin7_not_acceptable` `Finite Γ`). Nothing changed.
- One-tactic probe on both sorried theorems, eight tactics each (`simp`, `rfl`, `infer_instance`, `decide`, `aesop`, `tauto`, `simp_all` or `trivial`, and `exact` with the trivial witness): 16 of 16 fail. No padding.
- Headlines: Griess (§0.0) and unacceptability (§0.8) are stated; every other headline of the Summary is named in the module docstring with the missing carrier. The five backticked names of the roadmap's own (`octonionAut`, `octonionRep`, `griess_conjugacy`, `sumSquaresSeven`, `spin7_not_acceptable`) are declared. Imports: `import Mathlib` and one used Tau Ceti module.
- Pinned declarations opened this round (the names added by the last repair): Tau Ceti `Algebra/CayleyDickson/Basic.lean:70` (`CayleyDickson`), `:202` (the product, as the README writes it); `Algebra/CayleyDickson/Quaternion.lean:116` (`normSq`, on `CayleyDickson ℍ[R]` for a commutative ring R), `:124` (`normSq_def`); `NumberTheory/QuadraticForm/Global/AnisotropicPlaces.lean:121`; `LinearAlgebra/QuadraticForm/Witt/Extension.lean:50` (under `[Invertible (2 : K)]`, finite dimension, regular subspace); `NumberTheory/ClassFieldTheory/Brauer/CentralSimple/Invariant.lean:65`; Mathlib `Algebra/Quaternion.lean:684` (`Quaternion`). The other pinned names carry the file and line of round 6 and their passages are unchanged.

### Suppliers, gaps, duplication, merge order

Every cited section was resolved by heading at main or at the open head: ExceptionalThetaCorrespondencesForG2 (every italic title, and §§0.1, 0.6–0.9, 1.8, 5.1–5.4, 5.7–5.9, 6.7, 8.1–8.4, 8.8–8.10, 9.1, 9.3–9.6, 10.3–10.7); MetaplecticAutomorphicForms §§3.10, 3.17, 3.34, 3.41, 3.42, 6.13, 6.14; ModularityAndLanglandsExtensions §§2.43, 3.5, 3.8, 3.15, 3.17, 3.19, 3.27, 5.1; EndoscopicTransferAndUnitaryTraceComparison §§1.13, 4.7a, 4.8, 10.1, 10.26, 10.30, 10.31; SmoothRepresentationsOfLocalGroups SR.2.1–2.3, 3.1, 3.3, 5.2 (*classical-llc-normalization* lies inside SR.5.2); Part II SRU.1.1, 1.7–1.10, 3.8, 3.10, 4.7, 4.8; AutomorphicFormsOnReductiveGroups §§2.4, 2.5, 4.2, 4.3; AutomorphicSpectralTheory §§6.16, 6.18, 6.19; AutomorphicGaloisRepresentationsPartII AG2.2, AG2.5, AG2.6; AutomorphicLFunctionsAndLocalFactors AL.3, AL.4; Part II Layer 6; GL2AutomorphicRepresentationsAndTransfer R17.1.5 (its paragraph "Ramification realization" states the iff as cited); GlobalQuadraticForms §6.3 on main ("two regular forms are isometric exactly when they are isometric at every finite and every real place"). Exceptions: R01 (Layer 10 cited for what it lacks) and R03(d).

Gaps: the 16 slugs are the same in the README and in `design/plan.json`; each names an earlier supplier. split-steinberg-theta-cuspidality is precise and asks for nothing provided. pgsp6-pgso8-unramified-theta: R02. The other 14 are unchanged since round 6.

Duplication by object: `roadmaps grep` for the classification of octonion algebras by norm forms, composition algebras, a totally definite octonion algebra, Griess, unacceptability and a G₂ × GL_r gamma theory finds no other owner (LieHighestWeight uses split composition algebras only; ExceptionalThetaCorrespondencesForG2 takes O as given in §10.1), so §1.1 owns (i)–(iii) and cites R17.1.5 for the quaternion realization. No declaration of `Suggested.lean` has the name of a declaration in another roadmap (search on main and at the open heads: no match). `scratch/overlaps.md` lists no dropped id, no revision-only id and no other pull request changing this roadmap.

Overlap check: read ExceptionalThetaCorrespondencesForG2, AutomorphicLFunctionsAndLocalFactorsPartII, ModularityAndLanglandsExtensions, SmoothRepresentationsOfLocalGroups, SpinRepresentations (scope and cited sections; TwistedAutomorphicDescents and GanGrossPrasadUnitaryGroups by search only); shared objects: dual inclusions, complex parameters, component groups and the octonion automorphism group — owner ExceptionalThetaCorrespondencesForG2 Layer 0; spin factor of PGSp₆ — owner AutomorphicLFunctionsAndLocalFactorsPartII Layer 6; nothing owned twice.

Dependency check, output exactly:

```text
depcheck: 241 roadmaps, 2261 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. No banned supplier is cited.

### Copyright, licences and scope

Wording: 22 passages of the README and the 5 docstrings of `Suggested.lean` were set beside the sources at their locators (GS lines 102–176, 508–591, 889–918, 1083–1121, 1168–1247, 1444–1450, 1512–1536, 1543–1590, 1598–1680; GF lines 126–204; ILM lines 952–983; HKT lines 896–915; CG lines 345–377; C line 2239). None shares a run of words beyond formulas, standard names and forced lists of hypotheses; several routes differ from the source's (§§1.7, 2.4, 0.5, 4.3). Arrangement: GS §§2, 3, 3.5, 4, 5, 6–8, 9, 10–11, 12 correspond to Layers 0, 3, 4, 2, 5, 6, 7, 1, 8–10, not in order; Layer 0 draws on C, CG and HKT, Layer 1 on SV, ILM, Shin and SpV; the order Layer 1 → 2 → 3 is forced (§2.4 needs §1.6; §3.1 needs §1.4). Reuse: no table, figure or list is taken over.

Source independence: 27 passages compared with 6 sources, none shared; largest share GS, 99 of about 150 locators; contents compared with GS: independent.

## Not verifiable

- Griess, Theorem 1: settled as uncertified; cited by locator, not read. Its use is confirmed only through C, HKT and GS.
- SpV, §1.5 and Theorems 1.7.1, 1.8.1: settled as uncertified; cited by locator, not read. The statements of §1.1(i) were checked by computation, not against the text; whether the book also covers characteristic two, which §1.1(i) excludes, was not checked.
- Shin, GS20, HD and the pages of GS outside the sample were not reopened; their locators are unchanged since the rounds that read them.
- The truth of the contracts proposed in R01 was not checked beyond GF's use of them (GF lines 234–257, 321–356).
- Ownership against the open pull requests was checked through the indexed search and the overlap list, not by reading each.

## Source issues

- **Gap** in GS at §3.4, compatibility with global Langlands, p. 12: the source says the lift of a generic Π on split G₂ with a Steinberg place is cuspidal; it should give the argument for the split form; affects the proof.
- **Misprint** in GS at Main Theorem (ix), p. 4: the source says the gamma factor closes before the tensor factor; it should enclose the tensor product, as on p. 13; affects nothing.
- **Misprint** in GS at Lemma 12.4, proof, p. 37: the source says the component at v₀ is π; it should be σ; affects nothing.
- **Gap** in GS at Lemma 12.4, proof, p. 37: the source says Shin's Theorem 5.8 gives spin-regular real components; it should name a weight sequence that is spin-regular; affects the proof.
- **Error** in HKT at Lemma 4.6, proof, p. 21: the source says every nonzero spinor has stabilizer conjugate to G₂; it should restrict to nonisotropic spinors; affects the proof.
- **Gap** in GS at Lemma 12.5, proof, p. 37: the source says unramified representations have nonzero lifts to PGSO₈ without reference; it should cite one, or use that these components are generic; affects the proof.

## For the human reviewers

- **Licence.** `sources.toml` records Griess (doi:10.1007/BF01884298) as uncertified with licence class "none"; the headline `griess_conjugacy` (`Suggested.lean` line 118) rests on that locator, read only through C, HKT and GS.
- **Licence.** `sources.toml` records SpV (doi:10.1007/978-3-662-12622-6) as uncertified; §1.1(i) and the doubling step of §1.1(iii) cite its theorem numbers without the text.
- **Licence.** Shin is recorded with licence class author-page (`sources.toml`); its page numbers in §1.7 are those of the author PDF, not of the journal.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "588c1fa8b0d642e67672094b05df076636b207ee", "job": "REV-PKG-LocalLanglandsCorrespondenceForG2~7", "model": "fable", "worker": "chris-x90"} -->
