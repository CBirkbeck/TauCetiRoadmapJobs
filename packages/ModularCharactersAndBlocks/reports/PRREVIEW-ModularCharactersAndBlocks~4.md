# Review of ModularCharactersAndBlocks (pull request #1775 at 5c1a0d2)
Folder: `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/`
**Verdict:** needs changes

🤖 Incremental AI re-review of the 87 lines changed since `4e678ad`. One finding, P3, carried over from the previous review and not addressed by this head; nothing blocking. The two findings the diff addresses (the supplier namespace and layer comment, the five locators) are repaired, and the new proof routes written for §0.1 and §6.3 were checked on computed instances and hold. The gate passes and the file elaborates with exactly eight `sorry` warnings. No pull-request file was changed.

## R01 (P3) — The family index excludes the roadmap it now contains

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md:11–63` (the family's list of roadmaps) and `:111–117`, “the modular theory proper — Brauer characters, decomposition matrices, blocks with defect … — is out of scope for every roadmap here”.

**Claim:** The family index describes the family after this pull request.

**Witness:** `git diff origin/main...HEAD -- TauCetiRoadmap/RepresentationTheory/README.md` is empty at `5c1a0d2`. Every other folder of `TauCetiRoadmap/RepresentationTheory/` has a list entry (`grep -c "(<Folder>/README.md)"` gives `1` for each of the thirteen others, `0` for `ModularCharactersAndBlocks`), and the scope bullet still excludes exactly what this roadmap owns. The pull-request description says the index and the scope boundaries are updated. Previous review: R03, not repaired.

**Repair:** Add to the family index, on top of the file as it stands on the branch (leaving every other entry in place so that the merge with main's later entries is clean): a list entry for ModularCharactersAndBlocks after ModularInduction (Brauer characters, decomposition and Cartan matrices, projective characters, block idempotents, defect groups, Brauer's three main theorems, the principal-block and section-orthogonality interfaces); a dependency bullet under “How they depend on one another” saying that it consumes CharacterTheory, ModularInduction, QuiverRepresentations Layer 3 and InductionRestriction Layer 6; and a scope bullet that names ModularCharactersAndBlocks as the owner of Brauer characters, decomposition matrices and blocks with defect, keeping the exclusion of the modular representation theory of symmetric groups. The three edits of `4e18c0d3` have this content; what went wrong there was that they were applied to an older copy of the index, which deleted the entries main had added since.

## Previous findings

- R01 — repaired: `README.md:50–52` names `CompleteOrthogonalIdempotents.exists_isProjectiveCover_of_isSimpleModule` in the root namespace with its hypotheses (Artinian ring, complete family of primitive orthogonal idempotents, projective cover by a principal left ideal), matching `TauCeti/RingTheory/Idempotents/Simple.lean:75–84` at the pin; `Suggested.lean:50–64` places `existsUnique_blockIdempotent_map_residue` under `## Layer 1`, where the README states it (§1.3, `README.md:340–341`).
- R02 — repaired: §0.1 (`README.md:218–224`) cites Webb 9.3.4 and Martínez p. 3 for the factorisation and conjugacy only and proves the parametrization and class bijection here from `TauCeti.pFreePart_conj`; §2.3 (`README.md:413–417`) cites Webb 9.2.7, p. 144, and says the characteristic-`p` form is proved by the descent; §6.3 (`README.md:697–711`) proves the inclusion criterion as a target with a route through Craven 2.7; §8.1 (`README.md:796–800`) cites Martínez 8.2, 8.4, 8.5 for the partition and Sambale 1.23 for bijectivity under `G/C_G(N)` a `p`-group; §8.3 (`README.md:823`) cites Navarro 6.10, recorded `uncertified` in the manifest and in the references.
- R03 — not repaired: the family index is identical to the merge base (`git diff origin/main...HEAD` empty for it), lists thirteen roadmaps and not this one, and keeps “is out of scope for every roadmap here”. Raised again as R01 above.

## Verified sound

**Gate and build.** The worker's gate at `5c1a0d2` reads `set_option=0 … depcheck=0 … outside-folder=0 … build=0 OK`, every check passing. Independent `lake env lean TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/Suggested.lean` from the pull-request worktree exited 0 with exactly the eight `declaration uses sorry` warnings at lines 42, 56, 72, 99, 117, 127, 139, 153 and nothing else. The worktree head is `5c1a0d2c3f618e868ebe3992e89fbff55233c3fd` and clean; the outside-folder diff (`origin/main...HEAD` excluding the folder and the family index) is empty.

**Dependency check.** The command of the brief returned exactly:

```text
depcheck: 224 roadmaps, 2101 edges, 0 problem(s)
```

No `UPWARD`, `CYCLE` or `moved:` line. The diff adds no supplier and no cross-roadmap citation; the one new `*Needs:*` item, `TauCeti.pFreePart_conj`, is a pinned declaration (`TauCeti/GroupTheory/OrderOfElement/PPart.lean:208`, inside `namespace TauCeti`, statement `pFreePart p (g * x * g⁻¹) = g * pFreePart p x * g⁻¹`). The worker's citation scan found no cross-roadmap citation or Lean name of the README that resolves nowhere, and I did not re-resolve the supplier citations the diff leaves untouched (the previous report resolved all of them at the same heads).

**Pinned declarations opened this round** (Tau Ceti and Mathlib at the pins of `lake-manifest.json`; paths relative to the library):

| Declaration | File:line | What it supplies |
| --- | --- | --- |
| `TauCeti.pFreePart_conj`, `TauCeti.pPart_conj` | `TauCeti/GroupTheory/OrderOfElement/PPart.lean:208,215` | Conjugation transports both factors; what the §0.1 route uses. |
| `CompleteOrthogonalIdempotents.exists_isProjectiveCover_of_isSimpleModule` | `TauCeti/RingTheory/Idempotents/Simple.lean:81`, root namespace (the `TauCeti` namespace closes at line 73) | `[Ring R] [IsArtinianRing R]`, `CompleteOrthogonalIdempotents e`, every `e i` primitive, `S` simple: a projective cover `Ideal.span {e i} →ₗ[R] S`. Matches the README's parenthetical exactly. |

**Lean form and signatures.** A scratch copy of `Suggested.lean` with `#check @name` for all eleven declarations was elaborated; every type agrees with the worker's `signatures.md` and with the README statement of the same name, and none lost a section binder (the file carries every hypothesis in the declaration's own signature). The only Lean change since the previous head is the move of `existsUnique_blockIdempotent_map_residue` from the Layer 4 comment to a new `## Layer 1` comment; its type is unchanged (complete DVR, `IsDomain`, `IsAdicComplete`, no residue-characteristic hypothesis, as §1.3 states). Layer comments are in README order (0, 1, 2, 6, 7). The docstring's “three definitions” are `IsBlockIdempotent`, `brauerProjection`, `IsDefectGroup`; one `import Mathlib` plus one existing Tau Ceti module; `theorem` only; no `set_option`, no sorry'd data, no `example`.

**Padding probe.** On the scratch copy every `sorry` was replaced by `first | (simp; done) | rfl | infer_instance | fail "probe"`; all eight theorems failed with `probe`, so none closes in one tactic. None restates a definition, mirrors a Check or computes a value.

**Headline inventory.** Unchanged from the previous review (`README.md:12–19`): ten headlines, eight stated, two groups named in the docstring as not statable with their missing carriers (`Suggested.lean:16–27`). The move of the block-correspondence theorem changes no statement.

**Ownership.** The diff introduces no new object; the previous report's ownership search (defect groups, Brauer characters, principal block, decomposition matrix, Brauer homomorphism over main and the open heads) stands. Ownership against open pull requests whose files the brief does not supply was not re-checked.

**Sources: the changed locators and the sampled targets they touch.** Printed-page offsets as in the previous report: `webb` printed = PDF marker − 7, `martinez` printed = PDF − 8, `sambale` printed = PDF, `craven` printed = PDF − 5.

| Passage | Text opened (source line) | Result |
| --- | --- | --- |
| §0.1 factorisation and conjugacy | `webb` 6147–6158 (Lemma 9.3.4, PDF 153 = printed 146); `martinez` 165–167 (PDF 11 = printed 3) | Both state exactly the commuting factorisation and (Webb) the conjugacy of the factors; the README now cites them for that alone. Supported. |
| §2.3 residue-field splitting (sampled) | `webb` 6054–6056 (Theorem 9.2.7, PDF 151 = printed 144) | Webb: a field containing a primitive `m`-th root of unity, `m` the exponent, splits `G`; stated without proof. The README's description of it and of the characteristic-`p` form is accurate. Supported as a locator for the statement; the characteristic-`p` form is a target here with its route. |
| §6.3 inclusion criterion (sampled) | `craven` 823–827 (Lemma 2.7, PDF 28 = printed 23) | Lemma 2.7: for `Q ⊴ R` and a block `e` of `C_G(R)` there is a unique `R`-stable block `f` of `C_G(Q)` with `Br_R(f) e = e`, and every other `R`-stable block has `Br_R(f') e = 0`. Exactly the existence and uniqueness the route uses. Supported. |
| §8.1 domination | `martinez` 1895–1896 (Cor 8.2), 1907–1908 (Prop 8.4), 1928–1934 (Thm 8.5), PDF 59–60 = printed 51–52; `sambale` 541–545 (Thm 1.23, p. 18) | Martínez 8.2: every block of `G/N` lies in a unique block of `G`; 8.4: domination is containment of the image idempotent; 8.5(ii): for `N` a `p`-group, defect groups of the dominated block are `P/N`. Sambale 1.23: `N` a normal `p`-subgroup with `G/C_G(N)` a `p`-group gives bijective domination, introduced by Sambale as a “rather special case”. The README's sentence now matches both. Supported. |
| §8.3 kernel theorem (sampled) | Navarro, Theorem 6.10: not readable (paywalled, `uncertified` in the manifest with its DOI) | Cited by locator, as the brief allows; the route was recomputed (row A45 below). |
| §8.4 interfaces (sampled) | `README.md:838–842`, unchanged; exports §§0.1, 5.2, 4.3, 8.3, 7.3 | Each exported section exists and §§0.1, 8.3 are the ones repaired here. |
| Scope: supplier description | `TauCeti/RingTheory/Idempotents/Simple.lean:76–84` | As in the table above. |

The other sampled targets (§§1.1, 1.2, 2.1, 2.2, 3.1, 4.1, 4.2, 5.1, 6.1, 6.2, 7.1) are untouched by the diff and were verified in the previous report's sample table; §§6.1–6.2 were re-read for what §6.3's new route consumes (the relative-trace kernel of `Br_P`, `README.md:646–647`; the factoring of the projection through `C_G(Q)` for `Q ≤ P`, `README.md:648`; defect groups for the last sentence of §6.3) and supply it.

**Adversarial computations.** Rows A01–A48 of the previous report are carried forward for every statement the diff leaves untouched (they cite that report). The rows below are new, for the changed statements; `r = (123)`, `t = (12)` in `S₃`; `e₀ = 1 + r + r²`, `e₂ = r + r²` in `𝔽₂[S₃]`. A “pass” is an instance check, not a proof.

| Statement | Instances | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| B01 §0.1 “`pPart g = x` iff `g = x s`, `s` `p`-regular in `C_G(x)`” | `C₆ = ⟨g⟩`, `p = 2`, `x = g³`; `S₃`, `p = 2`, `x = t`; `S₃`, `p = 3`, `x = r` | `C₆`: `g³·{1, g², g⁴} = {g³, g⁵, g}`, each of `2`-part `g³` (orders `2, 6, 6`), and no other element has `2`-part `g³`; `S₃, x = t`: `C_G(t) = {1, t}`, regular part `{1}`, so only `t` has `2`-part exactly `t` (the other transpositions have `2`-part conjugate, not equal); `x = r`: `C_G(r) = C₃`, `3`-regular part `{1}`, only `r` | Pass | — |
| B02 §0.1 class bijection | `C₂ × S₃`, `p = 2`, `x = (c, 1)` with `c` the generator; `S₃`, `p = 2`, `x = 1`, `x = t` | `C_G(x) = G`; elements with `2`-part `x`: `(c,1), (c,r), (c,r²)`; `G`-classes among them: `{(c,1)}`, `{(c,r),(c,r²)}` = `2`; `2`-regular classes of `C_G(x)`: `{1}`, `{r, r²}` = `2`. Full count: representatives `1, (c,1), (1,t), (c,t)` give `2 + 2 + 1 + 1 = 6 = k(C₂ × S₃)`. `S₃`: `x = 1`: `2` classes both sides; `x = t`: `1` class (transpositions) and `1` regular class of `C₂`; `2 + 1 = 3 = k(S₃)` | Pass | — |
| B03 §0.1 conjugator fixes `x` | `C₂ × S₃`, `g = (c, r)`, `g' = (c, r²)` | `h = (1, t)` conjugates `g` to `g'`; `h x h⁻¹ = (c, 1) = x`, and `h ∈ C_G(x)` conjugates the free parts `(1, r) ↦ (1, r²)`; conversely `(1, r)` and `(1, r²)` are `C_G(x)`-conjugate, so `g ∼ g'` | Pass | — |
| B04 §2.3 characteristic-`p` form versus Webb's hypothesis | `S₃`, `p = 2`, `m = 6`; `C₃`, `p = 2`; `C₅`, `p = 5` | `S₃`: no primitive `6`-th root of unity exists in characteristic `2` (Webb's literal hypothesis is empty), `e' = 3`, `𝔽₄ ∋ ζ₃` splits `S₃` (simples of dimensions `1, 1, 2`, each absolutely simple); `C₃`: `𝔽₂[C₃] = 𝔽₂ × 𝔽₄` does not split, `𝔽₄[C₃] = 𝔽₄³` does; `C₅`: `e' = 1`, `𝔽₅[C₅]` local with the trivial simple | Pass | — |
| B05 §6.3 orbit lemma: `Br_Q(z) = ∑ Br_Q(b)` over `Q`-stable blocks below `z` | `G = C₃ ⋊ C₈` (`s r s⁻¹ = r⁻¹`), `k = 𝔽₄`, `p = 2`, `Q' = ⟨s²⟩ ⊴ Q = ⟨s⟩` | `C_G(Q') = C₃ × C₄`, blocks `e_j = ∑_i ζ₃^{−ij} r^i` (`j = 0, 1, 2`, `1/3 = 1`); `C_G(Q) = ⟨s⟩`. Blocks of `k[G]`: `e₀` and `e₁ + e₂ = r + r²` (the `⟨s⟩`-orbits on `Irr(C₃)`). `z = Br_{Q'}(e₁ + e₂) = e₁ + e₂`: blocks below it `e₁, e₂`, swapped by `s`, no `Q`-stable one, so the formula gives `0`; directly, `Br_Q(r + r²)` keeps the coefficients on `⟨s⟩`, which are `0`. `z = e₀`: `Q`-stable, formula gives `Br_Q(e₀) = 1`, directly the coefficient of `1` in `1 + r + r²` is `1`. The orbit sum `e₁ + e₂ = Tr_{Q'}^{Q}(e₁)` with `Q' < Q` | Pass | — |
| B06 §6.3 criterion both directions | same `G`; `S₃`, `p = 2`, `Q = ⟨t⟩`; `Q = 1` | `(Q', e₁)`: `Br_{Q'}(e_{B₁}) e₁ = (e₁ + e₂) e₁ = e₁`, and `(1, e₁ + e₂) ⊴ (Q', e₁)` directly (`1 ⊴ Q'`, `e_{B₁}` stable, `Br_{Q'}(e_{B₁}) e₁ = e₁`), so both sides hold; `(Q, 1)` for `B₁`: `Br_Q(e_{B₁}) · 1 = 0 ≠ 1`, and no chain exists since `Br_Q` kills `e₁, e₂`; `(Q, 1)` for `B₀`: `Br_Q(e₀) = 1`, chain `(1, e₀) ⊴ (Q, 1)`. `S₃`: `Br_{⟨t⟩}(e₀) · 1 = 1`, `Br_{⟨t⟩}(e₂) · 1 = 0`. `Q = 1`: `Br_1(e_B) f = f` iff `e_B f = f` iff `f = e_B` | Pass, both directions | — |
| B07 §6.3 defect groups from the criterion | same `G` | `B₁`: `Br_{⟨s²⟩}(e_{B₁}) ≠ 0`, `Br_{⟨s⟩}(e_{B₁}) = 0`, defect group `C₄`; its maximal Brauer pairs `(⟨s²⟩, e₁)`, `(⟨s²⟩, e₂)`, conjugate by `s`; `B₀`: `Br_{⟨s⟩}(e₀) = 1 ≠ 0`, defect group the Sylow `C₈`, consistent with the augmentation `aug(e₀) = 3 = 1` | Pass | — |
| B08 §8.1 bijectivity hypothesis | `S₃`, `p = 3`, `N = C₃`; `C₆`, `p = 3`, `N = C₃`; `D₈`, `p = 2`, `N = Z(D₈)` | `S₃`: `G/C_G(N) = C₂`, not a `3`-group; one block of `𝔽₃[S₃]` maps onto two of `𝔽₃[C₂]`, not bijective. `C₆`: `G/C_G(N) = 1`; `𝔽₃[C₆] = 𝔽₃[C₃] ⊗ 𝔽₃[C₂]` has `2` blocks, `𝔽₃[C₂]` has `2`, bijective. `D₈`: `G/C_G(N) = 1`; one block to one block of `𝔽₂[V₄]` | Pass; Sambale's hypothesis separates the cases | — |
| B09 §8.1 Martínez 8.2 at general `N` | `S₃`, `p = 3`, `N = C₃` (a `p`-group); `N = 1` | `Irr(S₃/C₃) = {1, sgn} ⊆ Irr(S₃)`, both in the single `3`-block, so each block of `C₂` (`{1}`, `{sgn}`) lies in exactly one block of `S₃`; `N = 1`: identity | Pass | — |
| A45 (recomputed) §8.3 route with the new locator | `S₃`, `p = 2`; `C₃ ⋊ C₈`, `p = 2` | `S₃`: `Φ_1 = 1 + sgn`, constant on `C₃`-cosets, `Φ_1(1) = 2 ≠ 0`, `Φ_1(t) = 0`, so `K ⊆ C₃ = O_{2'}`; `C₃ ⋊ C₈`: `Irr(B₀)` are the characters trivial on `C₃` (the `8` characters of `C₈`), intersection of kernels `C₃ = O_{2'}(G)` | Pass | — |
| R01-scope supplier contract | `R = 𝔽₂[C₂]` (Artinian, local), `e = (1)`; `R = 𝔽₃[C₂]`, `e = (e₊, e₋)` | `𝔽₂[C₂]`: `Ideal.span {1} = R` covers the trivial simple, a projective cover since `R` is local; `𝔽₃[C₂]`: `R e₊ ≅ 𝔽₃` trivial, `R e₋ ≅ 𝔽₃` sign, each simple covered by its own summand; the pinned theorem asks exactly `IsArtinianRing`, completeness and primitivity, no commutativity | Pass | — |

**README and Lean agreement.** Every backticked name of this roadmap's own in the README (`existsUnique_blockIdempotent_map_residue` in §1.3, the eight headlines in the summary, `brauerProjection_mul`, `isDefectGroup_conj`, `isDefectGroup_iff_sylow_of_augmentation_ne_zero`) is declared in `Suggested.lean`, and the gate's `readme-ids-missing=0` agrees. The README's Checks remain prose and are not restated in Lean.

## Not verifiable

- **Navarro, Theorem 6.10 (`navarro`).** Paywalled; recorded `uncertified` in the manifest with DOI `10.1017/CBO9780511526015` and cited by locator at `README.md:823` and `:879–881`. The kernel theorem was checked on instances only (row A45), not certified from the text.
- **Serre (`serre`).** Settled as uncertified; unchanged by the diff.
- **Open pull requests without supplied files** were not re-searched this round; the previous report's index search stands.
- **The pinned names `TauCeti.pFreePart_conj` and `CompleteOrthogonalIdempotents.exists_isProjectiveCover_of_isSimpleModule`** were verified by reading the pinned source files, not by elaboration: the scratch file imports only the module `Suggested.lean` imports, in which both are unknown identifiers, as expected.

## Source issues

- **Misprint** in webb at the remark after Theorem 9.2.7, printed p. 144: the source says `𝔽_p(ζ)` with `ζ` a primitive `m`-th root of unity, `m` the exponent of `G`, is a splitting field; no such root exists in characteristic `p` when `p` divides `m`, and it should be the prime-to-`p` part of `m`; affects nothing.
