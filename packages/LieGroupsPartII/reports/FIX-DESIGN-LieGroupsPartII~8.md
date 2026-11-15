# Repair of LieGroupsPartII design

The review REV-DESIGN-LieGroupsPartII~7 has two findings, both P3. Each was checked against:

- this roadmap's README and plan;
- LieGroups on main (`TauCetiRoadmap/RepresentationTheory/LieGroups/README.md` and its `Suggested.lean`);
- RealSemisimpleLieGroups at the head of its open pull request, read with `roadmaps show`.

Both findings are right, and both are applied. Its "For the human reviewers" section lists no finding, so nothing was changed because of it.

Only `packages/LieGroupsPartII/design/README.md` and `packages/LieGroupsPartII/design/plan.json` changed. `sources.toml` needed no change: `knapp2002` already has the locator "Ch. VII §§2, 4–5, 7" and lists 2.5 and 7.3 in `cited_for`. No source was fetched and no request file was written.

There is no `Suggested.lean` at the design stage, so no Lean command was run and no `#check` comparison was possible. No mathematical statement changed; the edits are terminology and locators.

## F01 (P3) — applied

Old: "Iwasawa datum" named LieGroups' `IwasawaData` in the §2.3 heading and the pair `(D, 𝔞)` in §§2.5 and 3.1, and was defined for neither. New: Conventions defines the **Iwasawa pair** `(D, 𝔞)`. §§2.5 and 3.1 use it. §2.1 and plan 2.1 say "Iwasawa triple", and the §2.3 heading names `IwasawaData`.

Evidence and details:

- **The finding holds.** The old Conventions defined only `(D, 𝔞, Σ⁺)`. Old §2.5 and §3.1 used `(D, 𝔞)` with no `Σ⁺`, while the old §2.3 heading meant `IwasawaData`. LieGroups' `Suggested.lean:591` also uses "Iwasawa datum" for `IwasawaData`.
- **The Conventions sentence, slightly extended from the review's wording.** It says what the pair is and that `Σ`, `W(Σ)`, `M`, `W_G` and the component condition depend on the pair only. It adds that every pair extends to a triple, so "for every pair" and "for every triple" have the same scope for these notions. §2.5 adds "an Iwasawa triple satisfies it when its pair does", because plan 2.5 (`IwasawaTriple.ComponentCondition`) and the rest of the README apply the condition to triples. Plan 2.5 now says the condition is "a property of the Iwasawa pair (D, 𝔞) alone".
- **The §2.3 heading.** "The base Iwasawa datum of an Iwasawa triple" became "The base `IwasawaData` of an Iwasawa triple". No "Iwasawa datum" is left in the README or the plan.
- **The same pattern elsewhere.**
  - *"Iwasawa choices".* This undefined phrase stood for `(𝔞, Σ⁺)` in four places: Summary, Scope line 10, the §1.2 Check (forms) and the plan summary. The first two and the plan summary now say "Iwasawa triples". The Check now says "`𝔞 = ℝ` and `Σ⁺ = ∅`", not "triple", because its two data differ in `B` and so are different triples.
  - *"Iwasawa triple" in LieGroups.* LieGroups uses this name for `IsIwasawaTriple K A N` (`Suggested.lean:591–593`): three subgroups that are the `K`, `A`, `N` of some `IwasawaData`. That is a different object from this roadmap's `(D, 𝔞, Σ⁺)`. Conventions now says so in one sentence. It adds that §2.3's subgroups `(K, lieExp 𝔞, lieExp 𝔫)` satisfy that predicate (fields `K_eq_fixed`, `A_eq`, `N` of `IwasawaData`).
- **The heading change breaks no citation.** `roadmaps grep LieGroupsPartII` finds no citation on main or at any open head. The board packages that name this roadmap (`SurfaceGroupCharacterVarieties/target.md`, `RealReductiveGroupsStructure/target.md`) cite neither §2.3 nor its anchor.

## F02 (P3) — applied

Old: README §2.5 "(Knapp 2002, Ch. VII §5)"; plan 2.5 "Ch. VII §5 (structure of M)"; plan 7.3 "Ch. VII §5". New: "(Knapp 2002, Ch. VII §§2, 5)" in README §2.5. Plan 2.5 and 7.3 now read "Ch. VII §§2, 5 (reductive groups and their axioms; structure of M)".

Evidence and details:

- **The finding holds.** The README's own References entry places "reductive groups and their axioms" in Ch. VII §2 and gives §5 as "structure of `M`". §1.1 cites Ch. VII §2 for axiom (v). RealSemisimpleLieGroups §2.3, at its head, cites "Knapp, Ch. VI, Thm. 6.57, and Ch. VII §2" for `W_G = W(Σ)` when `M` meets every component. So the claim "axiom (v) implies the component condition" belongs at least to §2.
- **Section level only.** `knapp2002` is uncertified, so no proposition number is claimed. Section 5 is kept, so the widened locator cannot lose a correct reference.
- **The same pattern elsewhere.**
  - README §7.3 already reads "Ch. VII §§2, 4–5, 7".
  - Plan 3.5 cites "Ch. VII §7 (minimal parabolic subgroups); Ch. VII §5 (structure of M)". Its §5 is cited for `M`, and its component-condition clauses hold by definition (`G⁰` is connected) or are §2.5's. It is left unchanged.
  - Plan 8.1 cites Ch. VII §2 for the real points, as RealSemisimpleLieGroups §2.3 does.

## Adversarial mathematics pass (changed or added statements)

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `Σ`, `W(Σ)`, `M`, `W_G`, component condition depend on the pair only | `GL_2(ℝ)`, diagonal `𝔞`, `Σ⁺ = {e₁ − e₂}` vs `{e₂ − e₁}`; `SL_2(ℝ)`, both systems; `O(1,1)`; compact `G` | `GL_2`: `M = {diag(±1, ±1)}` (4 elements), `|W_G| = 2`, condition holds (`det diag(−1, 1) = −1`) for both systems, while `𝔫 = ℝE₁₂` vs `ℝE₂₁` differs, so `𝔫`, `N`, `P` are rightly left out. `SL_2`: `M = {±1}`, `|W_G| = 2`, condition holds for both. `O(1,1)`: `Σ = ∅`, the only positive system is `∅`, `M = {±1}` meets 2 of 4 components, condition fails. Compact: `𝔞 = 0`, `M = G`, holds | Holds | Added (Conventions) |
| Every pair extends to a triple | `𝔞 = 0`; `SL_3(ℝ)`; `BC₁` | `𝔞 = 0`: `Σ = ∅`, `H₀ = 0`, `Σ⁺ = ∅`. `SL_3`: `H₀ = diag(2, 0, −2)` has root values `2, 4, 2` and their negatives, none zero. `BC₁`: `λ(H₀) = 1` gives `Σ⁺ = {λ, 2λ}`. In general a nonzero real `𝔞` is not a finite union of the proper hyperplanes `ker β` | Holds | Added (Conventions) |
| §2.3's `(K, lieExp 𝔞, lieExp 𝔫)` satisfy LieGroups' `IsIwasawaTriple` | definition at `Suggested.lean:592`; `GL_2(ℝ)` | `IsIwasawaTriple K A N := ∃ D : IwasawaData I G, D.K = K ∧ D.A = A ∧ D.N = N`. §2.3 sets `K = G^θ` (`K_eq_fixed`), `A = lieExp 𝔞` (`A_eq`) and `N = Nplus = lieExp 𝔫`. For `GL_2`: `(O(2), positive diagonal, upper unitriangular)`, as §2.3's Check | Holds | Added (Conventions) |
| §2.5: a triple satisfies the condition when its pair does | `GL_2`, both positive systems; `Aut(𝔰𝔩_3(ℝ))` | `GL_2`: same `M`, holds for both. `Aut(𝔰𝔩_3)`: `|W_G| = 12 ≠ 6 = |W(A₂)|` for every one of the 6 positive systems, fails for all | Agrees with §2.5's Checks | Clause added |
| §2.1 restated for a triple | `BC₁`, `A₂`, `BC₂` (§2.1 Checks) | `Σ_Π = Σ` with simple root `λ`; stabilizer `{1, s_{α₁}}`; `Σ ∩ span(e₂) = {±e₂, ±2e₂}`. Unchanged: only the subject of the sentence changed | Holds | Wording |
| §3.1 for an Iwasawa pair | `GL_3(ℝ)`, `𝔰 = ℝ·diag(1, 1, −2)`; `𝔰 = 0`; `𝔰 = 𝔞` | `L = GL_2 × GL_1`, roots `±(e₁ − e₂)`; `L = G`; `L = MA`. No statement of §3.1 uses `Σ⁺` (the component-condition clause is a pair property), so the pair is its exact generality | Holds | Wording |
| §1.2 Check (forms), new wording | `ℝ^×`, `B = xy`, `B' = 2xy` | `𝔭 = 𝔤 = ℝ`, so `𝔞 = ℝ`; `𝔤` abelian, so `Σ = ∅` and `Σ⁺ = ∅`; `B(1,1) = 1 ≠ 2 = B'(1,1)` | Holds | Wording |
| Locator Ch. VII §§2, 5 | README References; §1.1; RealSemisimpleLieGroups §2.3 | References: §2 "reductive groups and their axioms", §5 "structure of `M`". §1.1: axiom (v) at Ch. VII §2. RealSemisimpleLieGroups §2.3: "Ch. VI, Thm. 6.57, and Ch. VII §2". `sources.toml` `knapp2002` locator "Ch. VII §§2, 4–5, 7" covers both sections | Consistent; book uncertified | Locator widened |

## Check outcomes

Dependency gate, verbatim:

```text
candidate: LieGroupsPartII is not in the merge order yet; checked as if placed after ArithmeticLocallySymmetricSpaces (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2235 edges, 0 problem(s)
```

The gate shows no UPWARD or CYCLE line.

Citation resolver on the edited README (`roadmaps resolve`):

- cross-roadmap citations found nowhere: none;
- Lean names found nowhere: none.

The two leads in the worker's citation file (`LocallySymmetric.IsCartanInvolution.transposeInverse` and `LocallySymmetric.realPoints_lieGroup`) are ArithmeticLocallySymmetricSpaces' planned names, and the resolver now finds them.

`plan.json` parses as JSON. The changed lines contain no LaTeX delimiter, process word or machine path.

## Ownership and maintainer notes

- **No new target, supplier or gap.** "Iwasawa pair" is terminology for an object this roadmap already uses. `roadmaps grep` for "Iwasawa pair" on main and at the open heads finds only "Iwasawa pairing", a cohomological pairing in PhiGammaModulesAndIwasawaCohomology and PadicHodgeRegulators, not this object. Ownership against open pull requests was checked through the `roadmaps grep` index of 2026-11-15.
- **Names other roadmaps cite.** None changed. The only renamed heading is §2.3's, and no roadmap or board package cites it.
- **Vocabulary across LieGroups and this part.** LieGroups says "Iwasawa triple" for three subgroups (`IsIwasawaTriple`) and "Iwasawa datum" for `IwasawaData`. This roadmap's "Iwasawa triple" is `(D, 𝔞, Σ⁺)`. Conventions now states the difference and the implication between them. Renaming the triple would touch 34 README occurrences and 37 in the plan, including its `IwasawaTriple.*` names, and no finding asks for it.
- **Uncertified locator.** Whoever holds Knapp (2002) can confirm which of Ch. VII §§2, 5 states that axiom (v) makes `M` meet every component.
