# GATE-PolynomialGaloisGroups~4: answers to the review of 82f088f

Commit `93a48322` on the PR branch (not pushed). Both files were rewritten as a continuation of the
completed base (`Completed/PolynomialGaloisGroups/` on main): README 2026 → 310 lines,
Suggested.lean 204 → 82 lines.

## H01 (CBirkbeck) — applied differently

Correct: main has archived the base as `Completed/PolynomialGaloisGroups/`, and this branch put its Layers 0–9 back as work still to build. `TauCetiRoadmap/PolynomialGaloisGroups/README.md` is now only the continuation: "Roadmap: radical solvability for Galois groups of polynomials". The Summary says where the completed base stops, base Layers 0–6 and 9 are imported by layer and by their Tau Ceti names (Scope and ownership, Exact supplier contracts), and the new work is Layers 1–3 (the radical criterion for finite Galois extensions, then for polynomials, then Dummit's criterion).

What these two files cannot fix: the folder is still `TauCetiRoadmap/PolynomialGaloisGroups/` with namespace `TauCetiRoadmap.PolynomialGaloisGroups`, so it shares its name with the completed base. Renaming it is a human decision outside this job's files. A human also has to pick one vehicle: the open #763 (same author, namespace `TauCetiRoadmap.PolynomialGaloisGroupsPartIII`) plans the same radical criterion and Dummit separation in its Layer 3, alongside degree 6–11 classification and arithmetic equivalence. Polynomial Galois Groups Part II (the open checkout) has no radical content (0 matches for "radical" or `solvableByRad`).

## H02 (CBirkbeck) — applied differently

Correct: ℚ(√2) and ℚ(√3) both give the regular action of C₂, and `(a+b√3)² = 2` has no rational solution. The sentence is base text (main `Completed/PolynomialGaloisGroups/README.md:527`, copied into this branch at 613). The rewrite deletes it from this folder, so the repair is still owed in the completed base's README, which this PR does not touch.

## H03 (CBirkbeck) — applied differently

Correct: for `n = 0`, `X⁰ = 1` has trivial Galois group and `S₀` is trivial, so the predicate holds; for `n = 1` it holds as well. The negative control needs `2 ≤ n`, as in `not_hasFullSymmetricGaloisGroup_X_pow`. The sentence is base Layer 6/9 text (main `Completed/PolynomialGaloisGroups/README.md:1393`) and is deleted here; the repair is owed in the completed base.

## H04 (CBirkbeck) — applied differently

Correct: for `g = X − 1`, `n = k = 1`, the left side is `e₂(1) = 0` and the right side is `(−1)²·g.coeff (1 − 2) = g.coeff 0 = −1`. The formula is base Layer 4 text (main `Completed/PolynomialGaloisGroups/README.md:831`) and is deleted here; the repair (`k < n`) is owed in the completed base.

## H05 (CBirkbeck) — applied differently

Correct: `2X² − 4` is irreducible and separable over ℚ with `minpoly ℚ √2 = X² − 2 ≠ 2X² − 4`. The sentence is base Layer 2 text (main `Completed/PolynomialGaloisGroups/README.md:673`) and is deleted here; the repair (normalise by `p.leadingCoeff⁻¹`) is owed in the completed base.

## H06 (CBirkbeck) — applied

New Layer 3.1 `separable_specialize_quinticF20Spec`: `f` monic and irreducible of degree 5 with `(5 : F) ≠ 0` implies `(TauCeti.quinticF20Spec.specialize F f).Separable` (`chapman-quintics` lines 8–30). New 3.2 `isSolvable_gal_iff_exists_isRoot_quinticF20Spec`: the group form with no `hres`, for `(5 : F) ≠ 0`. Also new: `forall_rootSet_mem_solvableByRad_iff_exists_isRoot_quinticF20Spec`, the radical form in characteristic zero (`dummit-quintics` Theorem 1, p. 389).

Chapman's factorisation was checked for Tau Ceti's own invariant `∑ₐ xₐ²(xₐ₊₁xₐ₋₁ + xₐ₊₂xₐ₋₂)` by exact evaluation at random integer points, for all 10 pairs of non-fixed orbit values. The hypothesis `5 ≠ 0` is needed, and this is recorded as a Check: over 𝔽₅, `X⁵ − X − 1` has roots `α + k`, and the difference for the labelling (0,4,2,1,3) is `(−4)(1)[(3)(−1) − (1)(2)] = 20 = 0`, so the sextic is inseparable.

## H07 (CBirkbeck) — applied differently

Correct: the native theorem holds over any field, and the reviewer's 𝔽₂ witness `X⁵ + X² + 1` (group C₅) satisfies both sides. The conditional theorem is no longer restated. The supplier contract cites `TauCeti.isSolvable_gal_iff_exists_isRoot_specialize_quinticF20Spec` "over an arbitrary field", the new Layer 3 statements assume only `(5 : F) ≠ 0`, and the 𝔽₂ case is a Layer 3 Check. The phrase `ringChar F ∉ {2,5}` is still in the completed base's README (main line 1034).

## H08 (CBirkbeck) — applied

All ten one-step wrappers are deleted from `Suggested.lean`. So is the sorry'd `existsUnique_hasGaloisLabel_of_natDegree_le_five` (base Layer 6, a proved result at the pin: `TauCeti.existsUnique_transitiveGroupLabel_five`), together with the `#check @TauCeti.rootSetEquivAlgHomAdjoin` and twelve imports. The file now states five `sorry` headlines: two from Layer 1/2 and three from Layer 3. None of their fully qualified names occurs in the completed base's file or in #763's file.

## H09 (CBirkbeck) — applied

The README now has the house shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, `## Layer k` with `### k.n` prose subsections, and every layer ends with `### Examples` and `### Dependencies`. The continuation introduces no definitions, so the Checks are theorem-level computed examples, three to six per layer. The Tschirnhaus controls belong to the base and are not restated here.

## H10 (CBirkbeck) — applied differently

Locators corrected and checked against the texts:
- `dummit-quintics`: invariant and `F₂₀` stabiliser §2, p. 388 (lines 46–52); sextic (2) and the trinomial case p. 389 (lines 84–101); Theorem 1 p. 389 (line 102); characteristic remark p. 387 (lines 31–32).
- `milne-fields` v5.10: Theorem 5.34 p. 77 (line 3409), Lemma 5.33 p. 76 (line 3400), Proposition 5.27 p. 74 (line 3267), Proposition 4.16 p. 52 (line 2217).

The stale `IsSolvableByRad` sentence is deleted. Not done: `sources.toml` is not a file this job may create. The three works were fetched legally (Milne from jmilne.org, open repository; Dummit and Chapman from Dummit's page site.uvm.edu/ddummit, author page) and still need manifest entries: `milne-fields`, `dummit-quintics` (DOI 10.1090/S0025-5718-1991-1079014-X), `chapman-quintics`.

## H11 (CBirkbeck) — applied

The certificate milestone (`QuinticCertificate`, `check`) and its wrapper `quinticCertificate_check_sound` are deleted with the base material. The continuation has no certificate or checker interface; its quintic examples are mathematical implications only.

## Signature check

All five declarations were elaborated with `#check @name` lines added temporarily to Suggested.lean (removed before commit). The elaborated types match the README statements:
- Layer 1: `[CharZero F] [FiniteDimensional F E] [IsGalois F E] (ι : E →ₐ[F] AlgebraicClosure F)`.
- Layer 2: `[CharZero F] (q : F[X])`.
- Layer 3.1 and the group form: `f.Monic → Irreducible f → f.natDegree = 5 → 5 ≠ 0`.
- Radical form: `[CharZero F]`, monic, irreducible, degree 5.

No binder was dropped.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| L1 finite-Galois criterion | `E = F`; splitting field of `X⁵−2`; of `X⁵−4X+2`; real cubic subfield of ℚ(ζ₇) with `solvableByRad ℚ E` | trivial group / both sides hold; `F₂₀`, order 20, both hold; `S₅`, both fail; C₃ solvable but `solvableByRad ℚ E = ℚ` | holds with the radical closure taken in `AlgebraicClosure F`; false with `solvableByRad F E` | negative control kept as a Check |
| L2 polynomial criterion | `q = 0`, `q = 1`, `X²−2`, `(X⁵−4X+2)(X−1)` | empty root sets / trivial groups; C₂ with radical `±√2`; root 1 radical but the group maps onto `S₅` | all roots needed; some root suffices only for irreducible q | 2.2 restricted to irreducible q |
| L2.3 prime degree | `X⁵−4X+2` (3 real roots: signs at −2,−1,0,1,2 are −,+,+,−,+; `5X⁴−4` has 2 real zeros); `X³−2` | `S₅` not solvable; `S₃` solvable, roots radical | needs `p ≥ 5` | stated with `p ≥ 5` |
| L3.1 separation | `X⁵−2`/ℚ; `X⁵−X`/ℚ; `X⁵−X−1`/𝔽₅; char 2 | sextic `X⁶−50000X`, separable; `(X−2)⁴(X²+16)`, reducible input; Chapman difference `= 20 ≡ 0` in 𝔽₅; `u = v` forces `x_a = x_b` in char 2 | holds under monic, irreducible, `5 ≠ 0`; separability of f follows (degree 5 not divisible by char) | `hsep` dropped; `5 ≠ 0` added |
| L3.2 group form | `X⁵−2`, `X⁵−5X−12`, `X⁵−X−1` over ℚ; `X⁵+X²+1` over 𝔽₂ | sextic roots: 0 (`F₂₀`); 40 (`D₅`); none, since 9631 is prime and ±1, ±9631 are not roots (`S₅`); fixed value in 𝔽₂ (C₅) | consistent with Dummit's Theorem 1 | new |
| L3.2 radical form | the same three over ℚ | radical / radical / not radical, matching root / root / no root | consistent | new; char 0 only, since radicals in char p are out of scope |
| Normalisation of the sextic | Tau Ceti's sextic of `X⁵−X` against Dummit (2′) with `a = −1, b = 0` | `x⁶−8x⁵+40x⁴−160x³+400x²−512x+256 = (x−2)⁴(x²+16)` | Tau Ceti and Dummit agree | none |

## Ownership, citations, Mathlib

- **Ownership.** Searched with `roadmaps grep` for `solvableByRad`, "solvable by radicals" and Dummit across main and the open heads. Only #763's Layer 3 overlaps (see H01). The radical converse is absent at the Mathlib pin: `Mathlib/FieldTheory/AbelRuffini.lean` proves only the direction from radicals to a solvable group (`isSolvable_gal_minpoly` line 301, `isSolvable_gal_of_irreducible` line 313).
- **Citations.** `roadmaps resolve` on the new README: no cross-roadmap citation and no Lean name found nowhere.
- **Library names.** Every Mathlib and Tau Ceti name the README cites was located at the pins. Corrected along the way: `IsSepClosed.hasEnoughRootsOfUnity` replaces `AlgebraicClosure.hasEnoughRootsOfUnity`, and `Polynomial.Splits.adjoin_rootSet_eq_range` replaces the `IsSplittingField` form.

## Build and gate

- `lake build TauCetiRoadmap.PolynomialGaloisGroups.Suggested`: Build completed successfully (9001 jobs); the only warnings are the five `declaration uses 'sorry'` (lines 32, 46, 58, 67, 76).
- Depcheck: `depcheck: 208 roadmaps, 1451 edges, 0 problem(s)` (no UPWARD or CYCLE line).
- Gate: `gate PolynomialGaloisGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
