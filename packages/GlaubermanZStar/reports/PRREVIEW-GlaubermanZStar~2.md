# Review of GlaubermanZStar (pull request #1778 at 6d23755)

**Verdict:** needs changes

The mathematics of the plan is sound: the Z* statement, the dihedral and fusion lemmas, the Brauer–Suzuki configuration, the principal-block constancy argument and the orthogonality contradiction all check out under instantiation (table below). What blocks are one vacuous Lean statement and the push gate (import form), followed by shape and policy defects in the README.

## R01 (P1) — `principalBlock_character_alternative` is vacuous: its hypotheses are jointly unsatisfiable, and it closes by `Or.inl` from its sibling

**Location.** `TauCetiRoadmap/GlaubermanZStar/Suggested.lean` lines 61–73: "theorem principalBlock_character_alternative … ZStarConclusion t ∨ χ s = 0 ∨ χ t = -χ 1".

**Claim.** For an isolated involution `t` with `normalClosure {t} = ⊤`, a commuting involution `s ≠ t`, and `χ` nontrivial in the principal 2-block, one of three alternatives holds.

**Witness.** (1) One-tactic probe: on a copy of the file elaborated with `lake env lean`, the body `Or.inl (glauberman_zStar t ht hisolated)` closes the goal; the only diagnostics are unused-variable warnings for `hm h2 hχ hne hgen ih hs hst hst_ne`. (2) The hypotheses cannot all hold. Z* gives an odd normal `N` with every conjugate of `t` in the coset `N t`, so `normalClosure {t} = ⊤` forces `G = N⟨t⟩`. An involution `s = n t` (`n ∈ N`) commuting with `t` satisfies `n^t = n` from `st = ts` and `n^t = n⁻¹` from `s² = 1`, so `n² = 1`, `n = 1`, `s = t`, against `s ≠ t`. Hence the statement is true for every conclusion, including `False`, and as an acceptance test it tests nothing beyond `glauberman_zStar`.

**Repair.** Delete `principalBlock_character_alternative` from `Suggested.lean`, and `ZStarConclusion` with it (nothing else uses it). Keep the Z4 alternative in the README as a target stated inside the minimal-counterexample induction, where it has content. If a Lean statement of Z4's content is wanted, state the non-vacuous identity it rests on, for instance: for `χ` in the principal 2-block, `t` an isolated involution and `s` an involution commuting with `t`, `χ(ts) · χ(1) = χ(t) · χ(s)` (true for every such triple, since `O_{2'}(G) ≤ ker χ` and `t` is central modulo it). Tested: with the deletion the remaining five declarations elaborate with `sorry` as the only warning.

## R02 (P3, gate) — Import header is not the single `import Mathlib`

**Location.** `TauCetiRoadmap/GlaubermanZStar/Suggested.lean` lines 1–5: four `import Mathlib.<submodule>` lines and no `import Mathlib`.

**Claim.** The gate reports `imports=1 mathlib-subimports=4 no-import-mathlib=1 build=4 FAIL`; the four build warnings are the module-system notices these submodule imports trigger.

**Witness.** `gate.md` for this head, rules `imports`, `mathlib-subimports`, `no-import-mathlib`.

**Repair.** Replace lines 1–5 by `import Mathlib` followed by `import TauCeti.RepresentationTheory.CharacterTable.VirtualCharacter`. Tested: the file with that header elaborates under `lake env lean` with `sorry` as the only warning, and the four module-system warnings disappear. No acceptance while the gate fails.

## R03 (P3) — README is not in TauCetiRoadmap form

**Location.** `TauCetiRoadmap/GlaubermanZStar/README.md` lines 1–314, headings "Foundations and ownership", "Conventions and public statements", "Milestone graph", "### Z0: …" to "### Z5: …", "## Checks".

**Claim.** The README lacks the required sections and per-definition apparatus.

**Witness.** Compare `TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md` lines 39, 120, 167, 243, 260–300: `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts` with `### From …` subsections, `## How to read the build`, `## Layer k:` with `### k.n` subsections, `### Examples` and `### Dependencies` per layer. This README has no `**Summary.**` paragraph, no `*Needs:*` lines (the dependency check therefore reads only the link targets), no API bullets, and one `## Checks` section with five checks in total; the definitions it introduces (isolation, weak closure, `Z*(G)`, the existence form, the dihedral lemma, `InPrincipalTwoBlock`, the set `K` of Z2) have no `**Checks.**` lists of their own. There is no `## Downstream consumers`.

**Repair.** Rewrite in the house shape: a `**Summary.**`; `## Scope and ownership` (the present "Foundations and ownership" content, with the deferrals to LocalFiniteGroupTheory, ModularCharactersAndBlocks, CharacterTheory, InductionRestriction and OddOrderTheorem by section); `## Conventions`; `## Exact supplier contracts` listing by name what is consumed (`pPrimeCore 2 ⊤`, L4 rank-one classification, L5 complements, M4 principal block, M5 section orthogonality, M7 local third main theorem, M8 kernel containment, F2 Dade/induction comparison, CharacterTheory §4.4, InductionRestriction Layers 2 and 5, Mathlib `Sylow`, `QuaternionGroup`, `MonoidHom.transfer`, Tau Ceti `IsTISet`, `irreducibleCharacters`); `## How to read the build`; `## Layer 0` … `## Layer 5` with `### k.n` prose, a `*Needs:*` line per target, API bullets and at least three Checks per definition, `### Examples` and `### Dependencies` per layer; `## Downstream consumers`; `## References`.

## R04 (P3) — Claims have no locators; the seeded sample target has none

**Location.** `README.md` lines 69–72 ("Weak closure of the singleton in a Sylow subgroup means … Prove the equivalence of these conditions in Z0"); lines 291–301 (references by whole paper or whole book).

**Claim.** Glauberman 1966 is cited as a paper, Gorenstein as a book, Brauer–Suzuki as a note; the equivalence of isolation with singleton weak closure, the constancy theorem of Z3, the class-sum coefficient identity of Z4 and the block-section orthogonality carry no theorem or page number.

**Witness.** No `(Source, Thm, p.)` locator occurs anywhere in the README; the only locator is "Chapter VI, §2.2, Example 3" for Suzuki (line 153). The sample target's statement is correct (table rows 1, 7, 8) but cannot be checked against a source as written.

**Repair.** Give each claim its locator: Glauberman 1966, *Central elements in core-free groups*, J. Algebra 4, pp. 403–420, DOI 10.1016/0021-8693(66)90030-5 (the roadmap's statement is its Theorem 1 and the commuting-conjugate corollary; record the theorem number from the text, which is paywalled and goes in the manifest as `uncertified`); Brauer–Suzuki 1959, PNAS 45, p. 1757 (the PubMed Central copy PMC222795 is the legal text); for the Z3 constancy lemma and the central-character congruence definition of the principal block cite a textbook theorem (for example Navarro, *Characters and Blocks of Finite Groups*, or Isaacs, *Character Theory of Finite Groups*, Chapter 15) by number and page.

## R05 (P3) — Pull-request number and process narrative in the README; Lean repositories cited as proof sources

**Location.** `README.md` line 22: "LocalFiniteGroupTheory [#1634](…/pull/1634)"; lines 305–314: "Coordinate with the authors before adapting code … Extract the general T.I./coherence inputs separately and audit the resulting import graph"; lines 10–12 "Suggested home … suggested block-theory directories".

**Claim.** Cross-roadmap citations must name the roadmap and section, never a pull-request number; a README is timeless and carries no process instructions.

**Witness.** The lines quoted. The AxiomMath/CFSG files linked at lines 305–308 exist at the pinned commit, but no licence is visible on the repository page, and the README itself says the material is third-party ("Qiuzhen-CFSG material") and asks readers to "coordinate with the authors".

**Repair.** Cite "LocalFiniteGroupTheory, L1/L4/L5" without the number. Delete lines 309–314. Keep the AxiomMath links only if their licence permits reuse and then state them as a reference with what each file states, in your own words; otherwise drop them. Replace the "suggested home" sentences by the single intended Tau Ceti path.

## R06 (P3) — Lean names absent from the README; docstring form

**Location.** `Suggested.lean` lines 7–14 (module docstring), 22, 28, 34 (no docstrings); `README.md` throughout.

**Claim.** Every Lean name must appear in the README and every declaration must carry a docstring; the module docstring must say the file states the headline theorems against the pins and which headlines are not statable.

**Witness.** `grep -c` on the README: `glauberman_zStar` 1, `glauberman_zStar_sylow` 0, `brauer_suzuki` 0, `ZStarConclusion` 0, `principalBlock_involution_section_constancy` 0, `principalBlock_character_alternative` 0. The module docstring says "these are suggested forms for selected targets, not a complete checklist", which contradicts the file's role as the acceptance test. `glauberman_zStar`, `glauberman_zStar_sylow`, `brauer_suzuki` have no docstrings.

**Repair.** Docstring "Glauberman's Z* theorem: target signatures" stating that the roadmap is `README.md`, that the file states the headline theorems against the pinned Mathlib and Tau Ceti, and that every headline is statable (none is missing). Add a docstring with the mathematics and source to each theorem. Name `glauberman_zStar` and `glauberman_zStar_sylow` in Layer 5, `brauer_suzuki` in Layer 2, `InPrincipalTwoBlock` and `principalBlock_involution_section_constancy` in Layer 3 of the README.

## R07 (P3) — Quaternion parameter convention promised but not stated; no witness Check

**Location.** `README.md` lines 150–153: "Use actual native quaternion groups, with order and parameter conventions made explicit"; `Suggested.lean` line 35: `QuaternionGroup (2 ^ (n - 2))`.

**Claim.** The convention is left implicit.

**Witness.** At the pin, `Mathlib/GroupTheory/SpecificGroups/Quaternion.lean` line 51 defines `QuaternionGroup n` of order `4 * n` (`QuaternionGroup.card`); the probe `Nat.card (QuaternionGroup 2) = 8` closes by `simp [QuaternionGroup.card]`. So `QuaternionGroup (2 ^ (n - 2))` is the generalized quaternion group of order `2 ^ n` for `n ≥ 3`, `n = 3` is `Q₈`, and `n = 2` would give `QuaternionGroup 1 ≅ C₄`, which `3 ≤ n` excludes.

**Repair.** State in Conventions: "the generalized quaternion group of order `2^n`, `n ≥ 3`, is Mathlib's `QuaternionGroup (2^(n-2))`, of order `4 · 2^(n-2)`", and add the Checks `n = 3` gives `Q₈` of order 8 with unique involution `a 2`, and `QuaternionGroup 1` is cyclic of order 4 (excluded).

## Verified sound

**Gate and build.** The targeted build at this head produced only the four import warnings; a probe copy with the header `import Mathlib` + `import TauCeti.RepresentationTheory.CharacterTable.VirtualCharacter` elaborated under `lake env lean` with `sorry` as the only warning. No `set_option`, no sorried data, no `lemma`, no LaTeX, no edits outside the folder (`git diff --stat origin/main...HEAD` excluding the folder is empty). `#check @name` for all seven declarations: elaborated types agree with the README statements; the two "dropped" `[Finite G]` binders are on `ZStarConclusion` and `InPrincipalTwoBlock`, whose types do not mention finiteness and which every theorem uses under `[Finite G]`, so nothing changes.

**Dependency check.** `gate --depcheck … --movable`: `depcheck: 205 roadmaps, 1651 edges, 0 problem(s)`; no UPWARD or CYCLE line. The three suppliers that are only in pull requests are new roadmap folders (LocalFiniteGroupTheory, ModularCharactersAndBlocks, OddOrderTheorem); none is in the merge order yet, so this roadmap is checked as placed after them. OddOrderTheorem's README says at its head (line 50) that it does not include Z*, so there is no cycle.

**Cross-roadmap citations resolved** (13): LocalFiniteGroupTheory at its head: L1 `pPrimeCore p H` and `O_{p'} = piCore {q | q ≠ p}` (Conventions, L1), L4 "cyclic or generalized quaternion for p = 2" for 2-rank 1, L5 normal p-complements and the cyclic-Sylow Burnside case, and its own statement (line 298) that Z* and Brauer–Suzuki are not on it. ModularCharactersAndBlocks at its head: M1 root lifting, M2 change-of-system comparison, M4 principal block by action on the trivial module, M5 generalized decomposition numbers and block-section orthogonality for non-conjugate p-parts, M7 local third main theorem for `P·C_G(P) ≤ H ≤ N_G(P)`, M8 Brauer-character triviality on `O_{p'}` and "Expose … for p = 2 to Z*"; its ownership line 66 excludes Z*. OddOrderTheorem F2 at its head: the Dade/induction comparison with every `H_a = 1` on `TauCeti.IsTISet` data, explicitly "without cyclic-factor or odd-order hypotheses" and "consumed by Z*", and the note that `characterPairing_ind_ind_of_isTISet` needs `IsTISubgroup`. CharacterTheory on main §4.4 (Galois action, line 760). InductionRestriction on main Layer 2 (induced characters, Frobenius reciprocity, line 268) and Layer 5 (Clifford theory, line 607).

**Library declarations opened at the pins** (7): `TauCeti.irreducibleCharacters` (`RepresentationTheory/CharacterTable/Table.lean` line 119, `[Field k] [Group G]`, irreducible representations on `Fin n → k`); `Representation.IsIrreducible` is Mathlib's abbreviation for `IsSimpleModule` (`RepresentationTheory/Irreducible.lean` line 29), so `χ 1 ≠ 0` and the division in `InPrincipalTwoBlock` is never by zero; `TauCeti.IsTISet` (`GroupTheory/TrivialIntersection.lean` line 194); `TauCeti.characterPairing_ind_ind_of_isTISet` (`RepresentationTheory/Induction/TrivialIntersection.lean` line 144, hypotheses `IsTISubgroup H`, `H ≠ ⊤`, as the README says); `QuaternionGroup` (Mathlib `GroupTheory/SpecificGroups/Quaternion.lean` line 51, order `4n`); `MonoidHom.transfer`; `Subgroup.normalClosure`.

**Ownership.** `roadmaps grep` over the 440 open heads and main for Z*, Brauer–Suzuki and isolated involutions: the only hits are the three suppliers excluding the topic and this roadmap. No other owner. Nothing at the pins states Z*, Brauer–Suzuki, `O_{p'}` cores or the principal block.

**Sources.** The lean-eval page cited at README line 302 exists and states exactly the existence form of `glauberman_zStar` (with `t ≠ 1 ∧ t * t = 1` in place of `orderOf t = 2`). The AxiomMath files at the pinned commit exist. Glauberman 1966: bibliographic data (J. Algebra 4 (1966) 403–420) confirmed; text paywalled (see Not verifiable). Brauer–Suzuki 1959: bibliographic data confirmed; text see Not verifiable.

**Adversarial table.** One row per statement; values computed on each side.

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| `glauberman_zStar` | `C₂`, `t` central | `N = ⊥`: `[g,t] = 1 ∈ ⊥`, `Nat.card ⊥ = 1` odd | holds |
| | `S₃`, `t = (12)` | conjugates `(13)`, `(23)` do not commute with `(12)`: isolated; `N = A₃`, `[g,t]` even, `|A₃| = 3` | holds |
| | `Q₈`, `t = -1` | isolated (central); `N = ⊥` | holds |
| | `V₄`, each `t` | isolated (abelian); `N = ⊥` | holds, matches README Check |
| | `A₅`, `t = (12)(34)` | `(13)(24)` is conjugate and commutes: hypothesis fails; only odd normal subgroup is `⊥` and `[g,t] ≠ 1`: conclusion false | negative control, hypothesis needed |
| | `D₈`, `t = s` reflection | `s r²` conjugate (via `r`) and commuting: not isolated; `t = r²`: central, `N = ⊥` | consistent |
| `glauberman_zStar_sylow` | `S₄`, `S = D₈`, `t = (12)(34)` | `(13)(24) ∈ S` conjugate: hypothesis fails; `Z*(S₄) = Z(S₄) = 1` so conclusion false | negative control |
| | `S₃`, `S = ⟨(12)⟩` | only conjugate in `S` is `t`: holds; `N = A₃` | holds |
| `brauer_suzuki` | `n = 3`, `G = Q₈`, `SL(2,3)`, `SL(2,5)` | `QuaternionGroup 2` has 8 elements (probe); `t = -1` resp. `-I` central, `O(G) = 1`, `N = ⊥` | holds |
| | `n = 2` | `QuaternionGroup 1 ≅ C₄`, excluded by `3 ≤ n`; `n - 2` junk only below 2 | hypothesis correct |
| `InPrincipalTwoBlock` | trivial character | `z = |Cl(g)|`, `z - |Cl(g)| = 0 ∈ m` | in block |
| | `C₂`, sign | `g = s`: `z = -1`, `-1 - 1 = -2 ∈ m` | in block (one 2-block) |
| | `S₃`, degree 2 | transposition class size 3, value 0: `z = 0`, `0 - 3 = -3 ∉ m` (`m ∩ ℤ = 2ℤ`) | not in block (defect zero), agrees with M8's example |
| | `S₃`, sign | 3-cycle class: `z = 2`, difference 0; transpositions: `z = -3`, `-6 ∈ m` | in block |
| | wrong model: `3 ∈ m` | `S₃` degree 2: `-3 ∈ m`, in block | matches `p = 3`, so the ideal discriminates the prime |
| constancy theorem | `N = ⊥` | `χ(s·1) = χ(s)` | holds trivially |
| | `S₃ × C₂`, `s = (1,c)`, `N = A₃ × 1`, `χ = sgn ⊗ ε` | `χ(s) = -1`, `χ(sn) = sgn(3-cycle)·ε(c) = -1` | holds |
| | same, `χ = std ⊗ ε` (not in `B₀`) | `χ(s) = -2`, `χ(sn) = 1` | fails: block hypothesis needed |
| `principalBlock_character_alternative` | any | hypotheses contradictory: `G = N⟨t⟩`, `s = nt`, `n = n^t = n⁻¹`, `n = 1`, `s = t` | vacuous (R01) |
| Z0 dihedral identity, `ord(ab) = 2k`, `k` even | `D₈`, `a = s`, `b = sr`, `ab = r`, `k = 2` | `r⁻¹ s r = s r² = a (ab)²`; `s r² ≠ s`, commutes with `s`, conjugate to `s` | holds |
| Z0 descent through `N ⊴ G`, `t ∉ N` | general | `M = ⟨x,t⟩N` with `x = tᵍ`, `[x,t] ∈ N`; `M = SN`, `x ∈ Sⁿ`, `n ∈ N`; `x^{n⁻¹} ∈ S` conjugate to `t` in a 2-group, weak closure gives `x = tⁿ`, so `x̄ = t̄` | holds given isolation ⇒ weak closure |
| Z0 product-conjugacy | general | `b = aᵍ`, `t, tᵍ ∈ C_G(b)`, Sylow conjugacy by `c ∈ C_G(b)`: `t^{gc⁻¹} = t`, `(ta)^{gc⁻¹} = tb` | holds |
| Z1 passage from `H = ⟨t^G⟩` | general | `Z*(H) ⊴ G` contains `t^G`, so `H/O(H)` is abelian generated by involutions; in `G/O(H)` all conjugates of `t̄` lie in the normal elementary abelian `H̄`, commute with `t̄`, isolation gives `t̄` central; `[G,t] ≤ O(H)` | holds |
| Z1 central `N = ⟨w⟩` lifting | general | `M = N × O(M)`; in `G/O(M)`, `[Ḡ,t̄] ≤ ⟨w̄⟩ ≤ Z`, `t̄ᵍ ∈ {t̄, t̄w̄}` commutes with `t̄`, isolation gives `t̄` central | holds |
| Z2 `C_S(U) = X` is Sylow in `C` | general | a Sylow `T ≥ X` of `C` lies in some `Sᵍ`, so `T = X` or `T = Sᵍ`; the latter centralizes `U ≤ Sᵍ` of order 4 but `|Z(Sᵍ)| = 2` | holds |
| Z2 `K` is T.I. with `N_G(K) = H` | general | `k ∈ K ∩ Kᵍ`: `k₂` of order ≥ 4 generates a cyclic 2-subgroup of `C ∩ Cᵍ` containing both `U` and `Uᵍ` (unique order-4 subgroups of cyclic Sylows), so `U = Uᵍ`, `g ∈ H` | holds |
| Z2 `C_G(k) ≤ H`, `|H : C| = 2` | general | `C_G(k) ≤ C_G(k₂) ≤ C_G(U)`; `S ≤ H`, `S ⊄ C`, `H/C ↪ Aut(U) = C₂` | holds, every `H_a = 1` |
| Z3 route | `P = ⟨s⟩`, `H = C_G(s)` | `P·C_G(P) = H ≤ N_G(P)`; `N ≤ O_{2'}(H)`; `(sn)_2 = s`, `(sn)_{2'} = n`; `χ(sn) = Σ d^s_{χφ} φ(1) = χ(s)` | holds |
| Z4 odd-core package | `d = th`, `(th)² ∈ N`, `|N|` odd | `ord(d) = 2k`, `k` odd; `w = dᵏ`; `v = d^{k+1} ∈ N`; `μ = t dᵏ`, `μ² = 1`; `μh = d^{1-k} ∈ N`; `tμ = w` | holds |
| Z4 class-sum identity | general | `ω_χ(K_t)ω_χ(K_s) = Σ_u a_u ω_χ(K_u)`; constancy on products gives `|Cl(t)||Cl(s)| χ(t)χ(s)/χ(1)² = |Cl(t)||Cl(s)| χ(ts)/χ(1)` | `χ(ts)χ(1) = χ(t)χ(s)` |
| Z4 combination | general | `χ(s)χ(1) = χ(t)χ(ts) = χ(t)²χ(s)/χ(1)`; `χ(t) = χ(1)` puts `t`, hence `⟨t^G⟩ = G`, in `ker χ` | `χ(s) = 0` or `χ(t) = -χ(1)` |
| Z4 orthogonality | `(s,t)`, `(s,1)` | 2-parts `s ≁ t`, `s ≁ 1`; sum `Σ_{B₀} χ(s)(χ(t)+χ(1))`; nontrivial terms 0; trivial term `1·(1+1) = 2 ≠ 0` | contradiction holds |
| README Checks (line 284–289) | `C₂`, `S₃`, `Q₈`, `V₄`, `A₅` | as in rows above | all correct |

**Hypothesis audit.** `hm : m.IsMaximal` and `h2 : 2 ∈ m` in the constancy theorem are both needed (a prime over 3 changes the block, row "wrong model"). `hgen` in the alternative is used only to exclude `χ(t) = χ(1)` and becomes moot with R01.

## Not verifiable

- Glauberman 1966, *Central elements in core-free groups*: Elsevier, paywalled. Looked at Crossref (the DOI ending `-7` first tried is not registered; the registered DOI is `10.1016/0021-8693(66)90030-5`), the ScienceDirect landing page (HTTP 403), the author's page at the University of Chicago (no copy). Recorded `uncertified` in the manifest. The equivalence "isolated ⇔ weakly closed singleton in a Sylow 2-subgroup" (the seeded sample) was therefore checked mathematically (table rows for Z0) and against the secondary statement on the Z* theorem's encyclopedia page, which gives the Sylow form and the commuting-conjugate corollary; the theorem number is not confirmed from the text.
- Brauer–Suzuki 1959, PNAS 45, 1757–1759: pnas.org answers HTTP 403; the PubMed Central copy PMC222795 is a legal free copy, but the download link served only a "Preparing to download" placeholder, and the service cached that placeholder under `brauer_suzuki1959` (its text is 9 lines of boilerplate). The worker should refetch that entry; the page images are scanned, so OCR will be needed.
- Suzuki, *Group Theory II*, Chapter VI §2.2 Example 3; Gorenstein, *Finite Groups*: Springer and Chelsea, paywalled; cited by locator only. Not fetched.
- Ownership against open pull requests was checked through `roadmaps grep` over all 440 heads; the board's package index was not searched beyond this folder.

## Source issues

- none
