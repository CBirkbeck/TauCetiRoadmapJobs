# GATE-PolynomialGaloisGroups~2: answers to human review of the pull request (head `cbb3352`)

Repair commit: `6d11a26` ("PolynomialGaloisGroups: review repairs (drop companion imports and
padding, own Gassmann targets, fix residue)"), not pushed. Only
`TauCetiRoadmap/PolynomialGaloisGroups/README.md` and `TauCetiRoadmap/PolynomialGaloisGroups/Suggested.lean`
changed (78 insertions, 259 deletions).

Second repair commit: `0081eac` ("PolynomialGaloisGroups: review repairs (remove stray
reference-data file, cite TransGrp source directly)"), not pushed. It deletes
`TauCetiRoadmap/PolynomialGaloisGroups/HighDegreeReferenceData.md` (the gate's `stray-files=1`) and
changes the two README links to it, nothing else (5 insertions, 174 deletions).

**Governing finding.** H09 is right, and editing these two files cannot fix it. On main the
roadmap is archived at `Completed/PolynomialGaloisGroups/`, and `STATUS.md` there records every
layer as done. The merge base `8f5231d` still has the same README at the active path; `diff`
against the archived copy shows only lines 139 and 1573, which are link paths. The branch adds new
programmes to a completed roadmap, and that has to be a separate Part roadmap. Merging is not even
mechanically possible: main moved the folder and the branch modifies the old path, so git reports a
modify/delete conflict. The repairs below are confined to the two editable files. They make the
text correct, so that the author can carry it into the new roadmap. They do not make the branch
mergeable.

## H01 (roed-math) — applied differently
Do not archive until the six generator equalities (`3T2`, `4T2`, `4T4`, `4T5`, `5T4`, `5T5`) are
certified. Three facts settle this. The pinned Tau Ceti `a91d3aa` has no
`TransitiveGroupLabel/Generators.lean`; that directory holds Affine, Basic, Classification, Cyclic,
Dihedral, Even, KleinFour, Order, Parity, Primitive and Solvable. Copying the proofs into the roadmap
folder (`PrescribedGenerators.lean`) creates a second owner (H13). And the roadmap is already
archived on main (H09). So `Suggested.lean` no longer imports or restates them. The README Layer 1C
"Exact generators" paragraph now says that the six equalities are Checks of that layer. Before:
"`PrescribedGenerators.lean` gives the six explicit comparison proofs". After: "The six equalities
are Checks of this layer". The module docstring states that the pin has no module making this
comparison.

## H02 (roed-math) — applied
The header's claim that the supplier patch also supplies the two quintic facts is gone. The
docstring now says that `disc(x⁵ − x − 1) = 2869` and the group-side quintic solvability bridge
are complete proof terms in this file. The "later native Generators module" paragraph has been
deleted.

## H03 (CBirkbeck) — applied differently
The request was to bump to a Tau Ceti revision that contains `Generators.lean`, import it, and close
the six comparisons. This roadmap cannot bump the pin, and the gate refuses an import that does not
exist at the pin. The answer is the same as H01: the six equalities are README Checks until the
shared pin advances. No second reference family is built, as the comment asked.

## H04 (CBirkbeck) — answered
The merge conflict comes from the folder move, not from the text. Main moved
`TauCetiRoadmap/PolynomialGaloisGroups/` to `Completed/PolynomialGaloisGroups/` (commit `569d44af`),
and the branch modifies the old path. Edits inside the folder cannot resolve it. Under H09 the
branch should be closed rather than rebased.

## H05 (CBirkbeck) — applied differently
Same obligation as H01/H03, raised again with the supplier read from Tau Ceti main. The zero-based
transcriptions do agree with the README's one-based rows. They are at the README Layer 1C rows and
the "Exact generators" paragraph, which is now a Check. They are still absent at the pin `a91d3aa`,
so nothing is imported.

## H06 (CBirkbeck) — applied
The certificate claimed completion and then listed exceptions. The header no longer makes any
completion claim. It now reads: the radical criterion
`RadicalConverse.finiteGalois_iff_image_mem_solvableByRad` is the one `sorry`; Layer 1D
(degrees 6–11) is not stated; the six generator equalities are README Checks.

## H07 (CBirkbeck) — answered
The scope points are preserved unchanged in the README:
- the discriminant-square test keeps `ringChar F ≠ 2`;
- separability over a field is kept distinct from a nonzero discriminant over a domain;
- the Frobenius input is still consumed from `TauCeti.NumberField.exists_gal_fullCycleType_eq_factorizationType`, with the good-prime hypothesis `¬ (p : ℤ) ∣ f.discr` on the polynomial discriminant (README supplier table, row "5, the membership statement");
- Hilbert irreducibility and general `Aₙ` realization remain out of scope.

## H08 (kim-em) — answered
The 67085ab status note is superseded. The six equalities it closed were proved in
`PrescribedGenerators.lean`, a copy of a Tau Ceti module that is later than the pin. H13 identifies
that file as a second owner, so `Suggested.lean` no longer imports it. The "16 explicit
proof/construction targets" are now one `sorry`'d headline. The rest were admitted worked examples
(H15), and they stay in the README as prose.

## H09 (CBirkbeck) — answered
Correct, and not repairable on this branch (see the governing finding). The evidence:
- main has `Completed/PolynomialGaloisGroups/README.md`, whose scope line 35 reads "for `n ≤ 5` only";
- its line 57 lists "Completeness of the classification of transitive subgroups in degrees 6 to 11" as out of scope;
- `STATUS.md` there marks Layers 0–6 and 9 done;
- the merge base differs from that copy only at lines 139 and 1573.

The new layers (1D, 10, the `S₁₆` Gassmann example and the embedding examples) belong in a new
roadmap that cites the completed one by section. Close this pull request.

## H10 (CBirkbeck) — applied
Number Field Arithmetic has no Layer 8.4: `Completed/NumberFieldArithmetic/README.md` has 8.1–8.3
only, at lines 2140, 2160 and 2206, and line 2244 lists Gassmann triples as uncovered. Its 3.8 names
no declaration. The repair has three parts:
- The `NumberField E` input now comes from the pinned Tau Ceti `Polynomial.SplittingField.instNumberField` (`TauCeti/NumberTheory/NumberField/SplittingField.lean` line 35).
- The two conclusions are now stated as Layer 9 targets in the Gassmann paragraph. First, almost-conjugate `H, K ≤ Gal(E/ℚ)` have fixed fields with equal `TauCeti.dedekindZetaCoeff` and equal `NumberField.dedekindZeta` (Perlis 1977, Theorem 1). Second, `E^H ≅ E^K` over ℚ exactly when `H` and `K` are conjugate.
- Every `NFA 3.8/8.4` citation and every `Gassmann.dedekindZeta…` or `numberField_splittingField` name has been removed: the intro, the supplier paragraph and table row, the namespace paragraph, the Layer 9 `*Needs:*` line, the order-of-work row, Related roadmaps and References.

## H11 (CBirkbeck) — applied
Correct: `HighDegreeReferenceData.md` listed GAP's degree 6–11 entries, shifted down by one,
wholesale. The file is deleted. The two README links to it (Layer 1C ownership paragraph, "with the
fixed generator rows in [HighDegreeReferenceData.md]"; Layer 1D "Fixed inputs", "The 160 rows in
[HighDegreeReferenceData.md]") now cite the GAP TransGrp library at commit `165fc21` by file
(`lib/trans.grp` for degrees 6–7, `data/trans8.grp`–`data/trans11.grp` for 8–11), the locator
already given in that layer's *Sources* line; no generator data remains in the roadmap folder.

## H12 (CBirkbeck) — answered
Correct: the Layer 1D "finite proof producer", the recursion on subgroup orders and the subgroup
enumeration fallback describe a procedure, not a statement. The repair asked for is a
classification theorem per degree, proved by cases (imprimitive groups through the wreath
embedding, primitive groups through the cited lists). That belongs to the new roadmap that owns
Layer 1D (H09). Rewriting Layer 1D here would plan new material inside a completed roadmap, so it
was not done.

## H13 (CBirkbeck) — applied
`Suggested.lean` lines 1–2 imported `TauCetiRoadmap.PolynomialGaloisGroups.Compatibility` and
`…PrescribedGenerators`. Both imports are deleted, and so are the six `PrescribedGenerators.*`
examples. The file now uses the native `TauCeti.*` names directly. One `change` became a no-op
without the aliases and was removed (the `permCongrHom` naturality example).

The README's paragraph on `Compatibility.lean` aliases now says that the roadmap builds no alias of
the native objects, and that Belyi Maps consumes the native names. The two `.lean` files themselves
are outside the editable set; they go when the pull request closes.

## H14 (CBirkbeck) — applied differently
Two parts:
- **The negation pin.** The `example` pinning `numTransitiveGroups n = 0` for `5 < n` (old line 2281) is deleted, and the README no longer mentions a "Compatibility alias" of it. Lean and README now agree.
- **The degree 6–11 headline.** It is statable at the pins, as the review says. But the module docstring now records it as not stated here, because its statement needs the 160 representatives, whose present form is H11, and its home is the new roadmap (H09).

## H15 (CBirkbeck) — applied
Deleted from `Suggested.lean`:
- `splittingField_algEquiv_of_baseEquiv`, which is proved from `Polynomial.IsSplittingField.algEquiv`. It was the source of the four `letI`/`haveI` linter warnings.
- `finiteGalois_solvable_implies_image_mem_solvableByRad`, the `.mp` of the headline. The README mention at the former line 388 is deleted too.
- The whole elementary-embedding section: the twelve admitted `example`s, two `sorry`'d worked-example theorems, `cubicQuadratic` and `cubicTowerSplittingFieldEquiv`. None of these names appears in the README, where the examples remain as prose.

The roughly 400 proved `example`s that pin library declarations are the archived file's
certificate, inherited from main. Removing them is the new roadmap's work, not this branch's.

## H16 (CBirkbeck) — applied
Four gate failures are fixed:
- **tex:** `xⱼ ↦ x_{j−1}` is now inside a code span. The `θ₁` span was rewrapped so that it does not cross a line break.
- **residue:** "Mathlib's own TODO in `Resultant/Basic.lean`" became "the statement Mathlib's resultant file leaves open".
- **imports:** see H13.
- **sorry-examples and the build warnings:** see H15.

The gate now shows `tex=0 residue=0 sorry-examples=0 imports=0`. The build has no warning except
one `sorry`.

## H17 (CBirkbeck) — applied
Library claims, checked at the pins:
- "`IsSolvableByRad` is deprecated there since 2026-02-28" became "Mathlib has no separate predicate for it". `grep` of the pinned `Mathlib/` finds no `IsSolvableByRad`.
- The Jordan `proof_wanted` sentence became: `GroupAction/Jordan.lean` names the theorem in its module docstring as a theorem to prove and does not state it. This is the pinned file's TODO list at lines 36–40; the file has no `proof_wanted`.
- "Theorem 13.9 is grounded in Mathlib's `proof_wanted`" is deleted.

Process residue removed:
- the five "*Not inspected for this pass*" phrases;
- the three "private provenance ledger" sentences;
- "At the pinned revision … today's empty `TransitiveGroupIndex 6`".

Not done: the layer shape (`## Scope and ownership`, `### k.n`, `### Examples`/`### Dependencies`)
and a `sources.toml`. These are the new roadmap's to do; `sources.toml` is outside the editable
files.

## H18 (CBirkbeck) — answered
Correct. Three pinned Tau Ceti proofs use `numTransitiveGroups_eq_zero_of_five_lt`:
`Primitive.lean` line 130, `Parity.lean` line 65 and `Solvable.lean` line 152. Each would need the
degree 6–11 parity, primitivity and solvability values once the family grows. Those values (for
`6T6`: odd, imprimitive, solvable) should be named targets in the new roadmap that owns Layer 1D.
Here the README sentence was corrected to drop the alias. It now reads: "`numTransitiveGroups_eq_zero_of_five_lt`
expresses the degree-five data boundary; on evolution replace it by the proved `11<n` boundary and
refactor its uses."

## H19 (CBirkbeck) — answered
Correct: the Butler–McKay citation has no table or page, and the `6T6` invariants are not tied to
the LMFDB page. These are Layer 1D sources, so they belong to the new roadmap (H09). Here only the
"*Not inspected*" residue on Butler–McKay was removed. Its entry now says the low-degree entries
agree with the LMFDB, which the `n ≤ 5` table does.

## Build

`lake build TauCetiRoadmap.PolynomialGaloisGroups.Suggested`: **Build completed successfully
(9139 jobs).** The only warning is `Suggested.lean:3407:8: declaration uses 'sorry'`
(`RadicalConverse.finiteGalois_iff_image_mem_solvableByRad`). The four linter warnings and the
unused-tactic warning are gone.

Signature check: only one declaration is `sorry`'d. It sits in `namespace RadicalConverse` with no
open `section` and no `variable`, and every binder (`[CharZero F]`, `[FiniteDimensional F E]`,
`[IsGalois F E]`, `ι`) is explicit in its own signature. No `#check` scratch file was elaborated,
because the brief allows no Lean command other than the build; the absence of section variables was
checked from the file structure instead. Nothing in the signature changed.

## Gate

```
gate PolynomialGaloisGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Rerun after commit `0081eac`; the earlier `stray-files=1` failure is repaired (H11). The build was
rerun after the deletion with the same outcome as above.

Dependency check (`--depcheck --movable`): `depcheck: 158 roadmaps, 1104 edges, 0 problem(s)`, with
no UPWARD or CYCLE line.

## Adversarial pass on changed statements

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| `finiteGalois_iff_image_mem_solvableByRad` (kept) | `E = F`; `E = ℚ(√2)`; `E` the splitting field of `x⁵ − x − 1` over ℚ | trivial group solvable ↔ `ι(F) ⊆ F ⊆ solvableByRad`: both true; `C₂` solvable ↔ `√2 = rad`: both true; `S₅` not solvable ↔ a root lies outside `solvableByRad` (Abel–Ruffini, `isSolvable_gal_of_irreducible`): both false | true; `CharZero` is needed for the forward direction (Artin–Schreier `x^p − x − a` in characteristic `p` has `C_p` group and is not radical) | none |
| Gassmann target: almost-conjugate `H, K` ⇒ equal `dedekindZetaCoeff` at every `n` | `n = 0`; `H = K`; `S₁₆` pair from IR 2.2 | `n = 0`: both count only the zero ideal, value 1 = 1; `H = K`: identical fields; IR pair: `[E^H:ℚ] = [E^K:ℚ] = 16!/16 = 15!` on both sides | true; the ramified primes are included in Perlis's equivalence of zeta functions | added as a Layer 9 target |
| Galois correspondence target: `E^H ≅ E^K` over ℚ ⇔ `H, K` conjugate | `H` normal; `S₃` with `H = ⟨(12)⟩`, `K = ⟨(13)⟩`; `S₃` with `H = ⟨(12)⟩`, `K = A₃` | conjugate subgroups give isomorphic cubic fields `ℚ(∛2) ≅ ℚ(ω∛2)`; `⟨(12)⟩` vs `A₃` gives degrees 3 vs 2, not isomorphic, and the subgroups are not conjugate | true in both directions | added as a Layer 9 target |
| `NumberField E` from `Polynomial.SplittingField.instNumberField` | `f = X` over ℚ; `f = X⁵ − X − 1` | `f = X`: `E = ℚ`, which is a number field; the instance needs `[NumberField K]`, and `K = ℚ` qualifies | applies | supplier changed from NFA 3.8 |
| Docstring: the pin has no generator-comparison module | `ls` of the pinned `TransitiveGroupLabel/` | 11 files, no `Generators.lean` | true | added |
| "Mathlib has no separate predicate" for solvability by radicals | `grep IsSolvableByRad` in the pinned `Mathlib/` | 0 hits | true | replaced the false deprecation claim |
| Jordan sentence | pinned `GroupAction/Jordan.lean` | line 38 lists `…of_isCycle_mem` as a TODO; no `theorem` and no `proof_wanted` for it | true | replaced the false `proof_wanted` claim |

## Ownership, citations and sources

- **Ownership.** The arithmetic-equivalence targets were moved down into Layer 9. Number Field
  Arithmetic on main excludes them (line 2244). `roadmaps grep` found the four `Gassmann.*` names
  only in this branch, and the pinned Mathlib and Tau Ceti have no `Gassmann`/`almostConjugate`
  number-field result; the only hit is a character-table file in representation theory. A roadmap
  that owns arithmetic equivalence on main would supersede this. No open pull request is cited as
  a supplier.
- **Citation not verified.** "Perlis 1977, Theorem 1" was added as a locator and was not opened.
  It should be recorded as `uncertified` in `sources.toml` when the new roadmap creates that file.
- **No other sources fetched.** No new source was needed besides Perlis, so
  `needs-references.toml` was not created.

## Suspicious text in the reviews

None. The reviews contain no instructions beyond roadmap repairs.
