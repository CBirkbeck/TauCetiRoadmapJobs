<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13172#issuecomment-6908022436 -->
Review (claude) of 2afd21e

Verdict: needs_changes

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) Chenevier's Corollary 6.8 is on pp. 150–151, not 149–150

   **Location:** `packages/LocalLanglandsCorrespondenceForG2/README.md:269` (§0.9): "(C, Theorem E, p. 100; Corollary 6.8, pp. 149–150)"; `README.md:1235` (References): "Corollary 6.8 pp. 149–150".

   **Claim:** The statement of Corollary 6.8 and its proof are on printed pages 150 and 151. Page 149 holds the end of the proof of Theorem 6.4 and Remark 6.6.

   **Witness:** C line 2256 (running head, printed page 150), C line 2282 (Corollary 6.8), C line 2301 (running head, printed page 151, inside its proof). C line 2213 is the head of page 149.

   **Exact repair:** in both places write "Corollary 6.8, pp. 150–151".

   **Repair test:** Theorem E stays at p. 100 (C line 235, PDF page 6, 94 + 6); Theorem 6.4 at p. 148 with its proof ending on p. 149 (C lines 2176, 2239), as §§0.0 and 0.10 say.

2. **F02** (P3) the contract symplectic-steinberg-generic-parameter has a proved source, which states it for cuspidal representations

   **Location:** `packages/LocalLanglandsCorrespondenceForG2/README.md:70`: "a discrete automorphic representation σ of Sp₂ₙ(𝔸_k) whose component at some finite place v is the Steinberg representation … (GS, proof of Lemma 12.4, p. 37, uses it at n = 3"; the same `needs` in `design/plan.json`; `README.md:23`.

   **Claim:** The contract's only locator is a place where the statement is used without proof. It is a stated and proved result: Magaard–Savin, Proposition 8.2, and Kret–Shin, Lemma 2.1 and Corollary 2.2 (KS is already in the manifest). Both state it for a cuspidal σ; the contract says discrete.

   **Witness:** MagaardSavin lines 394–397 (statement, PDF p. 10), 398–427 (proof: Aubert involution of the trivial packet; unbounded packets are fully induced). KS lines 693–700 (PDF p. 16); KS line 637 (standing hypothesis: cuspidal).

   **Exact repair:**

   1. In `README.md:70` and in the `needs` of the slug in `design/plan.json`, replace "a discrete automorphic representation σ" by "a cuspidal automorphic representation σ", and in `README.md:23` "of a discrete automorphic representation of Sp₂ₙ" by "of a cuspidal automorphic representation of Sp₂ₙ".
   2. In `README.md:70` replace "(GS, proof of Lemma 12.4, p. 37, uses it at n = 3;" by "(Magaard–Savin, Proposition 8.2 and proof, arXiv p. 10, stated over ℚ by an argument that uses only Arthur's classification; Kret–Shin, Lemma 2.1 and Corollary 2.2, PDF p. 16; GS, proof of Lemma 12.4, p. 37, uses it at n = 3;".
   3. `sources.toml`: the entry `MagaardSavin` was added by the sources service in this review with no authors, title or year. Add `authors = "Kay Magaard, Gordan Savin"`, `title = "Computing finite Galois groups arising from automorphic forms"`, `year = 2014`, `version_note = "arXiv v1"`. In the `KS` entry add "Lemma 2.1; Corollary 2.2" to `locator`.
   4. References: add "[MagaardSavin] K. Magaard and G. Savin, *Computing finite Galois groups arising from automorphic forms*, arXiv:1406.3773 (v1). Proposition 8.2." and add "Lemma 2.1; Corollary 2.2" to the [KS] line.

   **Repair test:** The six uses (§§1.7, 3.1, 3.11, 6.4, 8.1, 10.6) apply the contract to a constituent of the restriction to Sp₆ of a cuspidal Σ of PGSp₆, which is cuspidal; so "cuspidal" covers each. At n = 1 the statement holds: the parameters of SL₂ are μ on GL₃, χ ⊞ μ₂ with μ₂ dihedral (N = 0 at every place), three quadratic characters (N = 0), and 1 ⊠ ν₃ (the trivial representation); only the first has a Steinberg member.

3. **F03** (P3) §3.11(ii)(a), Route: at an unbounded localization the packet of §3.17 is a set of standard modules, and the step needs their irreducibility

   **Location:** `packages/LocalLanglandsCorrespondenceForG2/README.md:645`: "the global parameter being generic, its localization at u is an L-parameter and the component of the constituent at u lies in its L-packet (§§3.15, 3.17), so A_u ≅ Lif(Π_u)".

   **Claim:** ModularityAndLanglandsExtensions §3.15(c) gives L-packets for parameters bounded on the Weil group. For an unbounded localization §3.17 uses Arthur's extension, whose packet members are the full inductions from tempered packets of a Levi subgroup. The component of Σ is then an irreducible constituent of such an induction; it has the parameter of the localization only if the induction is irreducible. Hypothesis (a) does not make the localizations bounded. The supplier has the needed statement in §3.25, which the README does not cite.

   **Witness:** ModularityAndLanglandsExtensions at its open head, §3.17: "`ψ_v∈Ψ̃⁺_unit` may be unbounded, using Arthur(1.5.1)–(1.5.2)'s bounded-case extension"; §3.25: "every `Π_φ(G)` member is an irreducible standard module". MagaardSavin lines 422–424. Instance: a split real u with Π_u spherical of exponent `|·|^(a_i)`, 0 < a_i < 1/2.

   **Exact repair:**

   1. In the Route of (ii)(a) replace the clause quoted above, up to "(§§3.15, 3.17), so", by: "the global parameter being generic, its localization at u is an L-parameter; if it is bounded, the component of the constituent at u lies in its tempered L-packet (§§3.15, 3.17); if it is unbounded, the packet of §3.17 consists of the standard modules induced from tempered packets of a Levi subgroup, and these are irreducible (ModularityAndLanglandsExtensions §3.25; the parameter is generic in the sense of that section because, by the image statement of §5.1, it is the parameter of a globally generic cuspidal representation, whose component at u is a generic member of the packet), so the component is the Langlands quotient with that parameter; so".
   2. Add §3.25 and §5.1 to the *Needs* of §3.11, §3.25 to the Layer 3 Dependencies, to the supplier bullet at `README.md:67` ("§3.25 the members of a generic L-packet are irreducible standard modules") and to the list of sections at `README.md:13`.

   **Repair test:** At the instance of the witness the GL₇ component A_u is the irreducible induction of the seven characters `1, |·|^(±a_i)`; by §3.25 the Sp₆(ℝ) induction with exponents (a₁, a₂, a₃) is irreducible, its spherical member has parameter `1 ⊕ ⨁ |·|^(±a_i)`, which is the parameter the real contract gives Lif(Π_u). In the uniqueness argument nothing changes: the statement used there is (ii)(a) itself.

4. **F04** (P3) §10.5, Route: a representation of Sp₆(F) with trivial central character need not extend to PGSp₆(F)

   **Location:** `packages/LocalLanglandsCorrespondenceForG2/README.md:1142`: "has trivial central character (the parameter lifts to Spin₇), so it extends to PGSp₆; its weak class has the same q-image as φ̃".

   **Claim:** Trivial central character gives a representation of the normal subgroup Sp₆(F)/μ₂ of PGSp₆(F), which occurs in the restriction of an irreducible representation of PGSp₆(F). It extends only when that restriction is irreducible. The source picks a representation containing it (GS line 1638) and does not extend it. The statement of §10.5, which is about PGSp₆(F)-orbits, is correct.

   **Witness:** If σ ⊗ χ ∘ sim ≅ σ for a quadratic χ ≠ 1 (the nontrivial stabilizers of the §6.2 Check), the restriction of σ to Sp₆(F) is reducible and no constituent extends. Same for SL₂(F) in PGL₂(F): a member of a two-element packet.

   **Exact repair:** replace "so it extends to PGSp₆; its weak class has the same q-image as φ̃" by "so it occurs in the restriction to Sp₆(F) of an irreducible representation σ of PGSp₆(F), without extending to it in general; the weak class L_w(σ) has the same q-image as φ̃".

   **Repair test:** For σ with σ ⊗ χ ∘ sim ≅ σ the repaired sentence holds for each constituent of the restriction, and the twist of the last step of the Route is applied to σ, as in GS lines 1639–1642.

Four findings, all P3; none is blocking. All three round-8 findings are repaired. `Suggested.lean` elaborates with `sorry` as its only warning and neither admitted theorem is padding. The dependency check is clean. The four repairs below are one locator, one contract whose proof the manifest's own sources contain, one route citation and one false clause in a route.

## Previous findings (round 8)

| Finding | Repaired passage | Status |
|---|---|---|
| F01 (P2), §3.11(ii)(a): A_u ≅ Lif(Π_u) needs a generic parameter | `packages/LocalLanglandsCorrespondenceForG2/README.md:641`: "whose irreducible constituents restrict to Sp₆ with a generic global Arthur parameter"; `:645` Route through L-packets; `:70` new contract symplectic-steinberg-generic-parameter; `:655` exponent Check; `:1221` Notes. | Repaired, by a route different from the one proposed (the proposed step 3 was circular, as the repair report says). Two residual points: R02 (the new contract has a proof in sources the manifest holds), R03 (unbounded localizations). |
| F02 (P2), contract cubic-global-jacquet-langlands false for χ ∘ Nrd; split D | `README.md:76`: "if Π′ = χ ∘ Nrd for a Hecke character χ, then JL(Π′) = χ ∘ det, whose component χ_v ∘ det at a ramified place v is not the transfer χ_v ⊗ St₃"; `:645` split and division cases separated; `:656` Check at Π′ = 1; the same `needs` in `design/plan.json`. | Repaired. The replacement of AL.3.3.1 by EndoscopicTransferAndUnitaryTraceComparison §10.29 is correct (§10.29 covers nongeneric Langlands quotients; resolved at the open head). |
| F03 (P3), locator "HKT, main theorem"; manifest entries | `README.md:961`: "HKT, abstract, p. 1, with Theorem 3.3, p. 17, for surjectivity and §4, Proposition 4.3, Lemma 4.4 and Proposition 4.5 with the construction that follows it, pp. 18–22"; `sources.toml` HKT and GS locators extended. | Repaired. Checked: HKT lines 716, 802, 813, 829, 917; GS lines 341, 883, 1134, 1201, 1398, 1444, 1448. |

No finding of the repair report was marked not actionable. Patterns searched in the rest of the package: a Steinberg place used for genericity without a supplier (now cited in §§1.7, 3.1, 3.11, 6.4, 8.1, 10.6; §§2.3, 3.15 use global genericity through ModularityAndLanglandsExtensions §5.1 and need nothing more); a contract that is false on a boundary case (none found in the other 18); a locator without a number (none); a page locator off by one (R01).

## Verified sound

### Principles and shape

No route-specific shortcut (residue characteristics 2 and 3 are inside every statement; the exception at p = 3 is the source's, GS lines 606–608, stated as an injection). No re-planned roadmap, no upward supply, no algorithm, no `set_option`, no sorry'd data, no `lemma`. Residue scan of `README.md` and `Suggested.lean` (pull-request numbers, round labels, process words, machine paths, HTML anchors, LaTeX delimiters): 0 hits. Every definition read has its API and at least three Checks; every layer ends with Examples and Dependencies; layer titles name mathematics. All 1242 lines of the README were read this round.

### Seeded source sample (15 of 15 read at the locator)

| Target | Text opened | Result |
|---|---|---|
| 0.0 | C lines 2238–2239 (p. 149); HKT lines 896–915 (pp. 21–22); GS lines 587–591 (p. 13), 214 | The conjugacy statement is used as the README states it; Griess's own text not read (uncertified). |
| 0.2 | GS lines 396–406 (p. 9), 422–425 (p. 10) | Injection modulo duality, pole criterion for discrete parameters, μ₃ and S₃. |
| 0.3 | GS lines 407–414 (p. 9); 1001–1010 (§8.3, p. 24) | Injection, pole criterion, S_φ ≅ S_(ι∘φ)/Z(Spin₇). |
| 1.5 | GS lines 1243–1252 (p. 30) | Hypotheses on σ and δ as stated. |
| 2.2 | GS lines 712–736 (p. 17) | Lift through f₂ and the transfer to GL₈; unramified Satake comparison. |
| 2.4 | GS lines 750–790 (pp. 18–19) | Statement for generic discrete series; the README's route differs as its Notes say. |
| 3.2 | GS lines 437–460 (pp. 10–11) | The two branches of the definition. |
| 3.6 | GS lines 108–112 (p. 3); 517–527 (p. 12) | Temperedness and tempered induction. |
| 3.11 | GF lines 158–200 (pp. 4–5), headings at lines 91–321 | Rules (a)–(d) and the data of (ii); pages of Definition 2.1, §2.4, §§2.7–2.8, Lemma 2.5 as cited. |
| 4.1 | GS lines 613–625 (p. 14), 644–651 (p. 15) | Invariants, opposite algebras, Kottwitz labelling. |
| 4.2 | GS lines 603–608 (p. 14), 652–677 (pp. 15–16) | Three lifts, injection at p = 3. |
| 4.4 | GS lines 606–608, 665; HD lines 1017–1038 (PDF pp. 27–28) | θ(St⁺) = π_gen[1], θ(St⁻) = π_sc[1]; bijective at p = 3. |
| 6.4 | GS lines 1018–1051 (pp. 24–25) | Both globalizations with two equal places. |
| 6.5 | GS lines 1014–1016, 1052–1061 (pp. 24–25) | Statement and the pole of the partial spin L-function. |
| 10.5 | GS lines 1631–1643 (p. 39) | Statement; the route's "extends" is R04. |

The author flagged no locator as unverified. Also read: KS lines 637–700; MagaardSavin lines 384–428; C lines 2172–2312.

### Adversarial table (sampled targets, headlines, repaired passages, targets the findings touch)

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §0.0 `griess_conjugacy` | 12 one-tactic probes; Γ trivial; t against t², ζ⁵ = 1 | all fail; g = 1; multiplicity of ζ: 2 against 1 | Not padding; hypothesis is the intertwiner. |
| §0.8 `spin7_not_acceptable` | 12 probes, two with Γ = PUnit | all fail; the trivial group leaves `¬ ∃ g, …` false | Not padding. |
| §0.2 pole criterion | principal; subregular; χ ⊗ Sym², χ cubic; 1 ⊕ 1 ⊕ 1 | Sym⁶: 0 invariants; 1 ⊕ S₃ ⊕ S₃: 1; det = χ³ = 1; pole of order 7 | Holds for discrete φ only, as stated. |
| §0.3 | principal; subregular | 1 ⊕ Sym⁶: one invariant line; 1 ⊕ 1 ⊕ S₃ ⊕ S₃: order 2, q-image has S₃ twice, not discrete | Converse needs discreteness, as stated. |
| §1.5 | δ = St; δ = π_gen[1] | θ(St) = St discrete; θ(π_gen[1]) Siegel-induced | Hypothesis selects correctly. |
| §2.2 | trivial parameter, central −1 | spin eigenvalues 1⁸ against (−1)⁸; standard 1⁷ both | Not determined by standard data. |
| §2.4 | #T = 1, 2; one free place | R_u R_w R_σ = 1 and R_u R_w R_σ² = 1 give R_σ = 1; with z: R_σ = 2, R_z = 1/2, 1/4 solve | §1.6(ii) needed, used. |
| §3.2, §3.6 | St; trivial representation | Sym⁶ with N ≠ 0; eigenvalues q^(±3), q^(±2), q^(±1), 1, unbounded | Boundedness on W_F. |
| §3.11(ii)(a) | St at v₁; Arthur SL₂ nontrivial; unbounded generic localization | exponents 3, …, −3 once: (7, 1) or (1, 7); a + b = 2n + 2 and ab ≤ 2n + 1 force a = 1 or b = 1; packet of §3.17 is a full induction | Hypothesis right; R03 for the unbounded case. |
| §3.11 exponent Check | (2, 2), (3, 1), (2, 1), (1, 7) | {1, 0, 0, −1}; {1, 0, −1}; {½, −½}; trivial representation | Correct. |
| §3.11(ii)(b), Π′ = 1 | ramified u | 1_GL₃ and St₃: support \|·\|, 1, \|·\|⁻¹; both sides γ(T) γ(St₃ × T)² | Correct. |
| §3.11(ii)(b), split D | datum with spherical real components | Langlands quotient and spherical subquotient share χ₁ ⊕ χ₂ ⊕ χ₃ | Correct. |
| contract cubic-global-jacquet-langlands | infinite-dimensional Π′; χ ∘ Nrd | cuspidal, so generic, so discrete series at ramified v (no proper Levi transfers); χ ∘ det | Correct. |
| contract symplectic-steinberg-generic-parameter | n = 1, 2, 3; even SO | SL₂: four parameter types, one with St; n = 2: {1, 0, 0, −1} ∪ {0} ≠ {2, …, −2}; SO₂ₙ: S₂ₙ₋₁ ⊕ S₁ | True; source and hypothesis: R02. |
| §4.1 | opposite algebra | invariant 1/3 ↦ 2/3, χ ↦ χ⁻¹ | Consistent with GS line 625. |
| §4.2 | τ ≇ τ∨ | lifts from D₁ of JL(τ) and of JL(τ∨) differ by Howe duality | Three members for p ≠ 3. |
| §4.3 (used by 4.4) | self-dual irreducible 3-dimensional | image A₄ or S₄ needs a non-cyclic V₄, so p = 2; at p = 3 only Sym² | As stated. |
| §4.4 | labels | \|Irr(S₃)\| = 3, \|S₃\| = 6; HD 8.5(i): zero only if φ_τ ∋ 1 and ε = − | Three members, every p. |
| §6.4 | generic route; Steinberg route | genericity from §5.1; from the contract | Inputs named. |
| §6.5 | two equal places | sign change η² = 1 on a 2-group; pole from ζ^S at s = 1 | Holds. |
| §10.5 | two lifts of q ∘ φ̃; σ with σ ⊗ χ ≅ σ | lifts differ by χ : WD_F → μ₂, trivial on SL₂; restriction reducible | Statement holds; route clause R04. |
| §0.9 locator | Corollary 6.8 | printed pp. 150–151 | R01. |

### Lean file

- `lake env lean` on `packages/LocalLanglandsCorrespondenceForG2/Suggested.lean`, from the content checkout: exit 0; the only diagnostics are `declaration uses 'sorry'` at 118:8 and 137:8.
- `#check @` on the five declarations in a scratch copy elaborates; the types are those of the worker's signature list and of §§0.0 and 0.8. No binder lost; nothing changed (the file is unchanged since round 8).
- One-tactic probe on both sorried theorems, twelve tactics each (`simp`, `rfl`, `infer_instance`, `decide`, `aesop`, `tauto`, `trivial`, `simp_all`, four `exact` terms with trivial witnesses): 24 of 24 fail.
- Headlines of the Summary: Griess (§0.0) and unacceptability (§0.8) are stated; the others (§§7.1, 7.2, 3.12–3.13, 0.2–0.5, 0.9–0.10, 1.4–1.7, 2.2–2.5, 5.1–5.3, 8.2, 5.6, 6.6, 7.3, 10.1, 10.9, 3.15) are named in the module docstring with the missing carriers. The five backticked names of the roadmap's own are declared. Imports: `import Mathlib` and one used Tau Ceti module.
- Pinned declarations opened this round: Tau Ceti `Algebra/Octonion/Basic.lean:336`, `:354`, `:365`, `:537`, `:551`, `:831`, `:861`; `Algebra/CayleyDickson/Quaternion.lean:116`, `:124`, `:312`; `Algebra/Lie/D4/Tripled/Triality/Basic.lean:155`, `:197`; `NumberTheory/ClassFieldTheory/WeilGroup/Basic.lean:181`, `:235`; the three quadratic-form and Brauer declarations in their files. Mathlib `LinearAlgebra/CliffordAlgebra/SpinGroup.lean:62`, `:293`, `:385` (the `Group` instance); `LinearAlgebra/QuadraticForm/Basic.lean:1408`; `Matrix/Charpoly/Basic.lean:158`; `Charpoly/Coeff.lean:115`, `:119`; `Determinant/Basic.lean:80`; `RepresentationTheory/Semisimple.lean`.

### Suppliers, gaps, duplication, merge order

Citations resolved at the open heads this round: ModularityAndLanglandsExtensions §§3.8, 3.15, 3.17, 3.25, 5.1 (text read); ExceptionalThetaCorrespondencesForG2 §§0.1, 0.6–0.9, 5.1, 5.9, 6.7, 10.3–10.7 (headings and scope read; its consumer paragraph names this roadmap as owner of the G₂ parameterization); EndoscopicTransferAndUnitaryTraceComparison §10.29; AutomorphicLFunctionsAndLocalFactorsPartII §10.0, first statement. The worker's citation resolver lists nothing unresolved.

Gaps: 19 slugs, the same set in the README and in `design/plan.json`, each with a named supplier earlier in the merge order. The two changed in round 9 were recomputed (table above); symplectic-steinberg-generic-parameter asks for nothing a roadmap states (indexed search for a Steinberg component forcing a simple generic parameter, and for Magaard: no owner).

Duplication by object: no other roadmap states Griess's theorem, unacceptability of Spin₇, or the G₂ parameter map. No declaration of `Suggested.lean` shares a fully qualified name with another roadmap. `scratch/overlaps.md`: no dropped id, no revision-only id, no second copy, no other pull request changing this roadmap. Ownership against the open pull requests was checked through the indexed search and the overlap list, not by reading each.

Overlap check: read ExceptionalThetaCorrespondencesForG2 (scope, headings, consumer paragraph), ModularityAndLanglandsExtensions and AutomorphicLFunctionsAndLocalFactorsPartII (cited sections), TwistedAutomorphicDescents and GanGrossPrasadUnitaryGroups (searched for G₂, Spin₇, PGSp₆ and octonion objects: none owned there), SmoothRepresentationsOfLocalGroups and SpinRepresentations (as resolved by the citation check); the octonion model of G₂, dual inclusions, complex parameters and component groups — owner ExceptionalThetaCorrespondencesForG2 Layer 0; the spin factor of PGSp₆ — owner AutomorphicLFunctionsAndLocalFactorsPartII Layer 6; nothing owned twice.

Dependency check, output exactly:

```text
depcheck: 250 roadmaps, 2376 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. No banned supplier is cited.

### Copyright, licences and scope

Wording: 14 passages set beside the sources at their locators (GS lines 396–418, 437–460, 603–608, 712–736, 750–790, 1014–1061, 1631–1643; GF lines 165–200; C lines 2282–2288; HKT lines 896–899; KS lines 693–700; MagaardSavin lines 394–397; HD lines 1017–1026; the docstring of `griess_conjugacy`). The closest is §0.5 beside HKT Lemma 4.6, a statement that can be written in one way. Arrangement: GS §§2, 10, 4, 3, 3.5, 5, 6–8, 9, 12 correspond to Layers 0, 1, 2, 3, 4, 5, 6, 7, 8–10, not in the source's order; Layer 6 merges three sections; the run Layer 5 → 6 → 7 is forced (§6.1 needs §5.2; §7.1 needs §§6.1, 6.7). Reuse: no table, figure or list is taken over.

Source independence: 14 passages compared with 7 sources, none shared; largest share GS, 79 of 107 parenthetical locators counted; contents compared with GS: independent.

## Not verifiable

- Griess, Theorem 1, and SpV, §1.5 and Theorems 1.7.1, 1.8.1: settled as uncertified; cited by locator, not read.
- The truth of the declared contracts beyond the two recomputed here.
- Shin, SV, ILM, CG and GS20 were not reopened; their locators are unchanged since the rounds that read them.
- Jiang–Zhang, Proposition B.1 (behind ModularityAndLanglandsExtensions §3.25): read only as the supplier states it; the repair of R03 relies on that statement.
- Sections outside the sample and untouched by round 9 rely on the round-8 table rows where those carry values.

## Source issues

- **Error** in HKT at Lemma 4.6, proof, arXiv v3 p. 21: the source says every nonzero spinor has stabilizer conjugate to the image of G₂; it should say every nonisotropic spinor; affects the proof.
- **Misprint** in GS at §3.3, p. 11: the source says the totally definite octonion algebra is over the local field; it should be over the number field k; affects nothing.
- **Gap** in GS at Lemma 12.4, proof, p. 37, and §3.3, p. 12: the source says a Steinberg component makes the transfer cuspidal, with a reference to Arthur only; it should cite the argument of Magaard–Savin, Proposition 8.2; affects the proof.
- **Gap** in GF at §2.7(a), pp. 6–7: the source says the components of the transfer are Lif of the local components for every lift; it should assume a generic parameter and irreducible standard modules; affects the proof.

## For the human reviewers

- **Licence.** `sources.toml` records Griess (doi:10.1007/BF01884298) as uncertified; the headline `griess_conjugacy` (`Suggested.lean` line 118) rests on that locator, read only through C, HKT and GS.
- **Licence.** `sources.toml` records SpV as uncertified; §1.1(i) and the doubling step of §1.1(iii) cite its theorem numbers without the text.
- **Licence.** Shin is recorded with licence class author-page; its page numbers in §1.7 are those of the author PDF.
- **Scope.** GF is recorded as arXiv:2308.12561v1 with no journal reference; §3.11 states its main theorem with the corrections listed in Notes on the sources.
- **Licence.** The entry `MagaardSavin` (arXiv:1406.3773) was added to `sources.toml` by the sources service during this review; the README does not cite it until R02 is applied.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2afd21ebb659bfe0173a9d44d98a60d155c5ea56", "job": "REV-PKG-LocalLanglandsCorrespondenceForG2~9", "model": "fable", "worker": "chris-x89"} -->
