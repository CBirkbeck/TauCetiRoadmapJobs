<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13007#issuecomment-6849271154 -->
Red team round 1 pass a (claude) of e3467a3

Verdict: needs_changes

1. **F01** (P1) ArithmeticDynamicsPartII §6.0 is cited for centre containment and for the bound on D(q, G), which it does not state

   **Location.** `packages/NonabelianLevelStructures/README.md:11` ("the refinements for absolutely
   irreducible non-dihedral H ≤ SL₂(𝔽_q): center containment, the bound on the diagonal normalizer
   quotient"), `:53` ("Z(SL₂(𝔽_q)) ≤ H, the bound on the diagonal normalizer quotient"), `:742`
   ("ArithmeticDynamicsPartII §6.0 proves |D(q, G)| ≤ 2"), `:759` (*Needs* of §5.6), `:869`
   ("Z(G) = Z(SL₂(𝔽_q)) by ArithmeticDynamicsPartII §6.0").

   **Claim.** §6.0 of ArithmeticDynamicsPartII supplies (i) Z(SL₂(𝔽_q)) ≤ H and (ii) |D(q, H)| ≤ 2
   for absolutely irreducible non-dihedral H.

   **Witness.** ArithmeticDynamicsPartII at its open head 7dd79a5, §6.0 (README lines 768–795) and
   its `Suggested.lean`: neither statement occurs. The only related text is "Retain … any diagonal
   normalizer quotient" (line 770) and, in §6.3 (line 850), a trivial quotient in even characteristic
   only. §6.6 here uses (i) in its statement and proof, so the input is unowned. Both are Chen,
   Proposition 6.4.1(a) and (b) (CHEN2024 lines 5201–5220); (i) is also the opening assertion of
   Chen's Theorem 5.3.2 (CHEN2024 line 4202).

   **Repair.** Own both here.

   - Line 11: delete "center containment, the bound on the diagonal normalizer quotient," and write
     "the centralizer bound on d for semisimple c".
   - Line 53: replace "Z(SL₂(𝔽_q)) ≤ H, the bound on the diagonal normalizer quotient, `m ∣ 24` (odd
     q) or `m ∣ 12` (even q) and `d ∣ |C_H(c)/⟨c⟩|`" by "`m ∣ 24` (odd q) or `m ∣ 12` (even q) on a
     ramification component with noncentral c of trace ≠ 2, and, for semisimple c,
     `d ∣ |C_H(c)/⟨c⟩|`" (the supplier's hypotheses; the present text drops "semisimple").
   - §5.6, line 742: replace the sentence "ArithmeticDynamicsPartII §6.0 proves … for G = SL₂(𝔽_q)."
     by "Prove also that |D(q, G)| ≤ 2 for q ≥ 3 and G absolutely irreducible and not dihedral
     (Chen, Proposition 6.4.1(b), p. 429, with N/(G·C) in place of N/C): by Dickson's classification
     the projective image is A₄, S₄, A₅ or a subfield PSL₂ or PGL₂, and in each case the normalizer
     induces at most one nontrivial outer class." Add the API bullet "|D(q, G)| ≤ 2 for absolutely
     irreducible non-dihedral G, q ≥ 3." In its *Needs* replace "ArithmeticDynamicsPartII §6.0 (the
     bound for non-dihedral images)" by "ArithmeticGaloisRepresentations §4.4; §5.7".
   - §6.6, line 867: after "absolutely irreducible and not dihedral." insert "Then G contains
     Z(SL₂(𝔽_q)), so Z(G) = Z(SL₂(𝔽_q)) (Chen, Proposition 6.4.1(a), pp. 428–429)." In the proof
     route replace "Z(G) = Z(SL₂(𝔽_q)) by ArithmeticDynamicsPartII §6.0" by "Z(G) = Z(SL₂(𝔽_q)): for
     even q the centre is trivial; for odd q an absolutely irreducible G has even order (an odd-order
     subgroup of PSL₂(𝔽_q) is cyclic or fixes a point of P¹ by ArithmeticGaloisRepresentations §4.4,
     so its preimage is abelian or reducible), and −I is the only involution of SL₂(𝔽_q)". Tested on
     the refuting instance: G = SL₂(𝔽₃), order 24, contains −I; D₁₀ ≤ SL₂(𝔽₄) has trivial centre
     equal to Z(SL₂(𝔽₄)) = 1.

2. **F02** (P3) `markoffPoly` and `markoffTraceSurface` do not exist in ClassicalArithmeticCompletion

   **Location.** `packages/NonabelianLevelStructures/README.md:99`: "§4.58: `markoffPoly`,
   `markoffLevelSet` and `markoffTraceSurface`, with X*(R) = X(R) ∖ {0}."

   **Claim.** These are declaration names of ClassicalArithmeticCompletion §4.58.

   **Witness.** `roadmaps grep --fixed markoffTraceSurface` and `… markoffPoly`: "no match on main or
   in any open roadmap pull request"; neither occurs in the pinned Tau Ceti.
   `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:8670–8686` names only M(x), `V_k(R)` and
   `markoffLevelSet R k`.

   **Repair.** Replace the sentence by: "§4.58: the polynomial M(x) = x₁² + x₂² + x₃² − x₁x₂x₃, the
   level sets `V_k(R)` = `markoffLevelSet R k`, and the trace-coordinate surface X(R) := V₀(R), with
   X*(R) = X(R) ∖ {0}."

3. **F03** (P2) gap:asada-cofinality is compound and coextensive with the target §0.7 it serves

   **Location.** `packages/NonabelianLevelStructures/README.md:107` (the gap), `:252` (§0.7), `:7`
   ("This roadmap owns: … cofinality").

   **Claim.** §0.7 is a target of this roadmap that needs the gap as an input.

   **Witness.** The gap's `needs` is the two sentences of §0.7 verbatim in content (Asada's
   domination statement for M(G)_ℚ̄, and the open U ⊆ X with a finite étale Galois N → U): the
   supplier is asked for the whole target, in two unrelated parts, about the stack M(G) that
   ArithmeticDynamicsPartII §6.0 owns. Nothing is left for §0.7 to prove, so cofinality has two
   owners.

   **Repair.** Ask the supplier only for the group-theoretic inputs, and keep the translation to
   covers in §0.7. Split into two contracts (the second slug is new in `design/plan.json`'s `gaps`):

   - "What MappingClassGroupsAndCanonicalRepresentations must provide (gap:asada-cofinality): for
     every finite-index subgroup Γ of Out⁺(F₂) there are a finite group G generated by two elements
     and a class e ∈ Epi^ext(F₂, G) whose stabilizer in Out⁺(F₂) is contained in Γ (Asada, §7)."
   - "What MappingClassGroupsAndCanonicalRepresentations must provide (gap:origami-veech-stabilizers):
     for every finite-index subgroup Γ of SL₂(ℤ) ≅ Out⁺(F₂) with −I ∈ Γ ≤ Γ(2) there are an integer
     d, a transitive subgroup G ≤ S_d generated by two elements and a class in
     Epi^ext(F₂, G)/N_{S_d}(G) whose stabilizer in Out⁺(F₂) is exactly Γ (Bell–Booher–Chen–Liu, proof
     of Theorem 2.2.3; BBCL22 lines 641–651)."

   §0.7's proof route then reads: translate the first through the fibre dictionary of §0.3 into the
   domination statement; for a curve X take Belyi's open U finite étale over P¹ ∖ {0, 1, ∞} = the
   cover of 𝓜(1) of the free index-two subgroup of Γ(2), apply the second to Γ_U·{±I}, and take
   N → U the quotient of the component by N_{S_d}(G)/C_{S_d}(G). Its *Needs* gains §0.6 (quotients
   by subgroups of Out(G)).

4. **F04** (P2) the module docstring of `Suggested.lean` does not name the SL₂ vertical-automorphism theorem

   **Location.** `packages/NonabelianLevelStructures/Suggested.lean:32–49` (the list "Headline
   theorems that are not statable at the pins").

   **Claim.** The list covers every headline of the README that is not stated.

   **Witness.** The README Summary names "computes the vertical automorphisms of SL₂(𝔽_q)-level
   structures" (§6.6, Chen's Theorem 5.3.2) among the results; it is neither stated in the file nor
   named in the docstring. The six bullets cover §§0.7, 1.8, 2.2–2.3, 7.1–7.4, 7.6–7.7 only.

   **Repair.** Add the bullet: "* The vertical automorphism groups of SL₂(𝔽_q)-level structures and
   the representability of the compactified level stack for absolutely irreducible non-dihedral
   subgroups of `SL₂(𝔽_q)` (README §6.6): the admissible-cover stack and its vertical automorphism
   groups are missing."

5. **F05** (P3) §6.5 claims every finite field but omits even q with a ≠ 0

   **Location.** `packages/NonabelianLevelStructures/README.md:853`: "Let q be odd and t ≠ 2. … For
   even q and t ≠ 0, C₁(0)_t has q points … extends the slice classification … to every level and
   every finite field."

   **Claim.** The classification covers every finite field.

   **Witness.** q = 4, a² + a + 1 = 0 (the roadmap's own example in §6.3): X² + aX + 1 is irreducible,
   a ≠ 0, q even; no sentence of §6.5 gives the size of C₁(a)_t.

   **Repair.** After "exactly the single point (a, 0, 0) when a² = t + 2." insert: "The split and
   irreducible counts hold verbatim for even q and a ≠ 0, where X² − aX + 1 is separable." Add the
   Check: "Over 𝔽₄ with a² + a + 1 = 0 and t = 1: a² ≠ t + 2 = 1, the polynomial is irreducible and
   the conic y² + z² + a y z = a has q + 1 = 5 points." (Recomputed by enumeration over 𝔽₄: exactly
   5 solutions, and X² + aX + 1 has no root.)

6. **F06** (P3) `TauCeti.CoveringSpace.monodromyFunctor` is used but absent from the Tau Ceti contract

   **Location.** `packages/NonabelianLevelStructures/README.md:190` and `:269` name Tau Ceti
   `TauCeti.CoveringSpace.monodromyFunctor`; the subsection "### From Tau Ceti" (line 49) does not.

   **Witness.** Pinned Tau Ceti, `TauCeti/Topology/Covering/Monodromy/Basic.lean:63`, declares it;
   the contract paragraph lists every other Tau Ceti declaration the README uses.

   **Repair.** Append to line 49: "`TauCeti.CoveringSpace.monodromyFunctor`
   (`TauCeti/Topology/Covering/Monodromy/Basic.lean`) is the monodromy functor from covering spaces
   of a topological space to actions of its fundamental groupoid on fibres; it is topological and
   proves no Riemann existence theorem."

7. **F07** (P3) reference-list locators: a wrong label and locators no target uses

   **Location.** `packages/NonabelianLevelStructures/README.md:1035` ("Theorem 4.2.2 … and Theorem
   3.4.2") and `:1036` ("Theorem 2.2.3, Proposition 2.1.2 and Corollary 2.1.3").

   **Witness.** CHEN2018 line 1010: the statement numbered 3.4.2 is a Corollary (only the
   introduction, line 175, calls it a theorem). No section of the README cites CHEN2018 3.4.2 or
   BBCL22 Proposition 2.1.2 or Corollary 2.1.3.

   **Repair.** Line 1035: "Theorem 4.2.2 (structure of M(D₂k))." Line 1036: "Theorem 2.2.3 and its
   proof." If R03 is applied, §0.7 cites "Bell–Booher–Chen–Liu, Theorem 2.2.3 and its proof".

Seven findings: one P1 (a supplier cited for two statements it does not make), two P2, four P3.
No finding re-raises a settled one. The three `Suggested.lean` theorems were found faithful to
Chen's statements and to the README, and every numeric Check that could be recomputed was
recomputed (values in the pass table below).

## Dependency check

    depcheck: 206 roadmaps, 1905 edges, 0 problem(s)

No UPWARD or CYCLE line. Every supplier named is on main (StableReduction,
SchemeAndStackFoundations, ClassicalArithmeticCompletion, NoncongruenceModularForms, BelyiMaps,
CFSGBasicProperties) or earlier in the merge order.

## The pass: computed values

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| `nielsenRight`, `nielsenLeft` | generic (u, v) | prodShear gives (u, u v); swap ∘ shear ∘ swap gives (v u, v) | agree with README §3.1 |
| `coarseNielsenOrbit` | 1, C₂, C₃, S₃, D₈, D₁₀, D₁₂, D₁₄, D₁₆, D₁₈, Q₈, A₄, S₄, SL₂(𝔽₃), A₅, SL₂(𝔽₅), PSL₂(𝔽₇) | sizes 1; 3; 4; 3; 6; 3,3; 6; 3,3,3; 6,6; 3,3,3; 6; 4; 9; 16; 18,10,10; 72,40,40; 18,16,16,7,7 | all README sizes confirmed |
| `cuspVerticalExponent`, `centralizerQuotientOrder` (Lean bodies, brute force) | same groups | (m′, d′): S₃ (3,1); D₁₀ (5,1); D₁₆ (4,2); A₄ (2,2); S₄ (1,1); SL₂(𝔽₃) (2,1); A₅ (1,1); SL₂(𝔽₅) (2,1) both classes; PSL₂(𝔽₇) (1,1) | README §3.2 Checks confirmed |
| `combinatorial_congruence` | same groups; G = 1; abelian | moduli 1; 1; 1; 1; 3 ∣ 9; 2 ∣ 16; 3 ∣ 18, 5 ∣ 10; 3 ∣ 72, 5 ∣ 40; 3 ∣ 18, 4 ∣ 16, 7 ∣ 7; D₈, Q₈, D₁₂: 1 ∣ 6 | holds on every orbit of every group tried |
| footnote 28 (c = [u, v] versus Higman class [v, u]) | swap automorphism | swap normalizes Out⁺(F₂) and sends φ([a,b]) ∈ c to φ′([b,a]) ∈ c | Lean statement with c = ⁅u, v⁆ is the source's |
| `simple_group_congruence` | r = 0; A₇ ℓ = 7, 5; A₅, A₆ | ℓ⁰ = 1; 7⁶, 5⁶ ≥ 2520; excluded by `hPSL` | proof route recomputed: v_ℓ(d′) = 0, v_ℓ(m′) ≤ ⌊r/2⌋, exponent r − ⌊r/2⌋ = (r+1)/2 in ℕ; A₇ orbits not re-enumerated |
| §4.1 square subgroups | SL₂(𝔽₅) ℓ = 5; D₂ₖ ℓ = k; A₅ | (r, s) = (1, 0), v₅(m′) = 0; hypothesis fails, v_k(m′) = 1; m′ = 1 | consistent |
| I(G) | C₂, C₃, S₃, D₁₀ | 2, 4, 2, 4 | confirmed by hand |
| §2.2 order formula | abelian; S₃; SL₂(𝔽₃) | \|G\|; 3; 2 | consistent |
| convention witnesses | Fricke; 𝔽₇ peripheral; anti-action; rotation | 3; −1 nonsquare mod 7; (2,1,3) versus (2,5,7); (3,3,6) | confirmed |
| branch words | abelianization matrices | M₀ M₁₇₂₈ M∞ = −I; M∞ M₁₇₂₈ M₀ = [[−2,−1],[−1,−1]] | trace maps satisfy T∞ ∘ T₁₇₂₈ ∘ T₀ = id, checked on X*(𝔽_p), p ≤ 53 |
| `integral_trace_coordinates` | zero ring; 𝔽₂ counterexample N; universe of S | both sides 0; N vanishes on a₁₂ = 0 and traces fill 𝔸³; universal algebra in `Type u` | statement as typed is Chen's Theorem 5.2.1 |
| §5.3 | (I, I); unit unipotents; A = [[1,2],[0,1]] | 0; 1; 4 with index-4 sublattice | confirmed |
| §5.5 admissible traces | q = 2, 3, 4, 5, 7, 8, 9, 11 (enumeration) | non-admissible: {0}; {1,2}; {0}; {0,2,4}; {0,1,2}; {0}; {1,2}; {1,2}; no central commutator of a generating pair | confirmed (q ≥ 13 not enumerated) |
| §5.6, §5.7 | q = 2, 3, 4, 5; n = 1, 2 | \|D(q)\| = 1, 2, 1, 2; span of SL_n(𝔽_q) is M_n(𝔽_q) | confirmed |
| §6.3–6.5 slices | 𝔽₅ (a,t) = (0,−2), (1,4), (2,−2); 𝔽₇ (1,6); 𝔽₄ | cycles 4,4; one point; 5,5; period 6 = ord₇(3); order 5 | confirmed; even q, a ≠ 0 missing (R05) |
| §7.1–7.3 table | p = 5 … 53 (14 primes) | D, c₀, c₁₇₂₈, c∞, genus, d_p equal the README table; fixed triple (3,3,6); C_p formula and genus formula agree with enumeration | confirmed |
| §7.3 lower bound | all 337 primes 13 ≤ p < 2304 | integer values, minimum 5 at p = 13; genus 0, 0, 1 at 5, 7, 11 | confirmed |
| §7.6 parity rule | p = 5 … 53 | signs of (γ₀, γ₁₇₂₈, γ∞) on Y*: all even exactly for p ≡ 1, 3, 13, 15 (mod 16) | confirmed |
| §7.6 MP(7), MP(11) | roots of X² − 3X + 1 | order 8 in 𝔽₄₉; order 5 in 𝔽₁₁ | neither in P_MP |
| §7.7 coset map | g Γ̄_y ↦ y·g⁻¹ | h·gΓ̄ ↦ (y·g⁻¹)·h⁻¹ | equivariant |

## Verified sound

- Declarations read: 17 of 17 in `Suggested.lean` (14 definitions, 3 theorems, plus one proved
  `example`), each compared with its elaborated signature in the worker's signatures file and with
  its README statement; no lost binder, no `set_option`, no `lemma`, imports are `Mathlib` and one
  existing Tau Ceti module, every Lean name occurs in the README. No declaration is padding: none
  restates a definition or follows from a library lemma.
- Targets read: all 46 numbered sections of Layers 0–7, with their proof routes and *Needs*
  lines; every definition has at least three Checks.
- Checks: all 164 read against their sections; every one with a numeric or group-theoretic value
  was recomputed by enumeration or by hand (the values are in the table above), the qualitative
  ones were tested against the statement they accompany; none false.
- Locators verified against the text: 58 labels of CHEN2024 (57 statements and §4.11) mapped to printed pages and
  compared with the README's page ranges (all consistent); content compared for Theorems 2.5.2(6)
  and (7), 4.10.3, 4.10.5, 4.12.3, 5.2.1, 5.3.2, 5.6.3, 5.6.4, 5.6.6, Lemmas 4.12.1–4.12.2, 5.3.1,
  Corollaries 4.12.4–4.12.5, 5.6.8, Propositions 5.1.3, 5.6.1, 5.6.2, 6.3.1, 6.4.1 and Remark
  4.10.2; MP18 Theorems 1.3–1.4 and the density statement; BBCL22 Theorem 2.2.3 with its proof;
  CHEN2018 Theorem 4.2.2.
- Sibling citations checked at current heads: ArithmeticDynamicsPartII §§0.1, 1.4, 2.1–2.4,
  3.6–3.7, 4.2, 6.0–6.6, 7.2–7.4a (content; R01 is the one mismatch);
  InverseGaloisAndArithmeticFundamentalGroups §§IG.1.2–IG.1.4, IG.3.1, IG.3.2, IG.5.4 (content,
  including the action convention e ↦ e ∘ α⁻¹ and the absence of Gaschütz's lemma);
  NoncongruenceModularForms §§1.1, 3.5 and `compositionFactor_of_isCongruenceSubgroup` (content);
  MappingClassGroupsAndCanonicalRepresentations §2.3 (content, at the package on the board);
  LanglandsParameterStacks §§2.1, 3.8 (content); AlgebraicModuliForArithmeticGeometry §§5.1, 8.3
  and the four names cited (present); SchemeAndStackFoundations §§1.19, 1.21, 1.23, 3.2, 4.6, 4.15
  with `scheme_riemann_hurwitz`, `node_versal_deformation` (present);
  HeightsRationalPointsAndObstructions §4.6 `mordell_finite` (present); BelyiMaps §10.4,
  CFSGBasicProperties A0, StableReduction Layers 1–3, AnabelianGeometryAndNonabelianChabauty
  §§1.1–1.2 with all five named statements, ModularCurvesPartII §§3.1, 3.11, 3.12,
  ArithmeticGaloisRepresentations §§1.7, 4.3, 4.4, ClassicalArithmeticCompletion §§4.57, 4.58,
  4.76 (headings and named statements present; R02 is the one mismatch).
- Pinned declarations checked by grep at the pins: every Tau Ceti name and every Mathlib name of the
  two contract paragraphs exists in the file named.
- The eight gap slugs agree between the README and `design/plan.json`; each has a named supplier.
- Ownership: no declaration of `Suggested.lean` shares a fully qualified name with a readable
  roadmap; ArithmeticDynamicsPartII's `Suggested.lean` declares `traceOrder`, `orientedStep`,
  `signStep`, `mpCondition` in its own namespace and none is redeclared here.
- Policy: the pull request changes only the package folder; no pull-request number or process
  word in the README or in docstrings.

## Not verifiable

- Lean elaboration: no Lean command is permitted in this pass, so the proof of the one `example`
  (lines 188–240) and the elaboration of the file rest on the worker's signatures file.
- ASADA2001 §7 and VDOVIN1999 Theorem A: settled as uncertified; read only through Chen's and
  Bell–Booher–Chen–Liu's restatements.
- Ellenberg–McReynolds and Schmithüsen, on which the second contract proposed in R03 rests, were
  read only through BBCL22 lines 641–651.
- `simple_group_congruence` on A₇ was not re-enumerated here (the previous review records an A₇
  orbit); §5.5 for q ≥ 13 and the PSU₃(4) degrees 1 and 184 rest on Chen.
- The content of ModularCurvesPartII §3.12, StableReduction Layer 2 and
  ArithmeticGaloisRepresentations §4.3's normal-subgroup statement was checked by heading and key
  phrase, not line by line.
- Ownership against open pull requests was checked through the roadmap index (`roadmaps grep`)
  and the eight sibling heads read; the other open heads were not read in full.

## Source issues

- **Misprint** in CHEN2024 at Proposition 5.6.1(a), printed page 418: the source says the fibre over j = 0 has (D − 3)/3 points with D = p(p ± 3); it should be (D + 2)/3, one unramified point plus (D − 1)/3 of index 3; affects a stated result.
- **Error** in CHEN2024 at §4.11, printed page 388: the source says d′ = 2 for the odd dihedral group of order 2k; it should be 1, the centralizer of a primitive rotation being the rotation subgroup; affects nothing.
- **Gap** in CHEN2024 at Lemma 4.12.2, printed pages 389–390: the source says an intersection of order at most ℓ^j yields a subgroup C_(ℓ^k) × C_(ℓ^(k−j)); it should treat only j = 0, since for k = 2, j = 1 the two cyclic groups may be nested; affects a stated result.
- **Misprint** in CHEN2024 at Corollary 4.12.4, proof, printed page 390: the source says ⟨z, c⟩ has order ℓ^(r+1) and refers to a part (c); it should say order at least ℓ^(r+1) and refer to the second item of (b); affects nothing.
- **Error** in CHEN2024 at Proposition 6.4.1(b), printed page 429: the source says N/C has order at most 2 for the normalizer and centralizer of G in GL₂(𝔽_q); it should be N/(G·C), since N/C contains the inner automorphisms; affects a stated result.
- **Error** in CHEN2024 at Theorem 5.6.4, printed page 419: the source says only finitely many elliptic curves over K carry such a structure; it should say finitely many j-invariants, quadratic twists sharing the structure; affects a stated result.
- **Misprint** in CHEN2018 at the introduction, line 175 of the cached text: the source calls statement 3.4.2 a theorem; it should be Corollary 3.4.2, as in the body; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e3467a3af5a7af660b2d7d3b2fb818b6171d93c7", "job": "RT-NonabelianLevelStructures~1a", "model": "fable", "worker": "chris-x21"} -->
