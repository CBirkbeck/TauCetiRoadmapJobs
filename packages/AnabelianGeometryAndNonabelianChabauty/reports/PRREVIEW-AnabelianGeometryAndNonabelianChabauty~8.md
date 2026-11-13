# Review of AnabelianGeometryAndNonabelianChabauty (pull request #1021 at 4a7e05e)

**Verdict:** needs changes

Incremental re-review of the 33 lines changed since 227f000 (the §7.0 Chern comparison now built on KTheoryFiniteLocalFields §1.8, its scope sentence, supplier contract, `*Needs:*` lines and two new references). Two P3 findings; the gate fails on one of them.

## R01 (P3) — gate `statement-hygiene`: `letI` in the signature of `anabelian_isom`

**Location:** `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/Suggested.lean:64–68`: "let P : MorphismProperty Scheme.{u} := @AlgebraicGeometry.IsFinite ⊓ @AlgebraicGeometry.Etale / letI : P.IsStableUnderBaseChange := { of_isPullback := … }".

**Claim:** The headline's conclusion carries a `let` and a `letI` with a hand-built instance; the gate refuses a `letI` in a signature (`statement-hygiene=1 … FAIL`), so the folder cannot be accepted at this head.

**Witness:** Gate line: "line 65: P3 `letI` in the signature of theorem `anabelian_isom`; repair: use an instance binder or a named instance in the signature". At the pin `inferInstance` does not find `(@IsFinite ⊓ @Etale).IsStableUnderBaseChange` (scratch probe), so a named instance is needed.

**Repair:** Replace lines 64–68 by two declarations before the theorem and use them in the conclusion (elaborated on a scratch copy from the worktree: `declaration uses sorry` the only message, every other binder unchanged):

```lean
open AlgebraicGeometry CategoryTheory in
/-- Finite étale morphisms of schemes. -/
abbrev finiteEtale : MorphismProperty Scheme.{u} :=
  @AlgebraicGeometry.IsFinite ⊓ @AlgebraicGeometry.Etale

open AlgebraicGeometry CategoryTheory in
/-- Finite étale morphisms are stable under base change. -/
instance finiteEtale_isStableUnderBaseChange : finiteEtale.{u}.IsStableUnderBaseChange :=
  MorphismProperty.IsStableUnderBaseChange.inf
```

and, in `anabelian_isom`, after `(hX …) (hY …) :`

```lean
    ∀ e : (finiteEtale.{u}).Over ⊤ X ≌ (finiteEtale.{u}).Over ⊤ Y,
      Nonempty (MorphismProperty.Over.pullback finiteEtale.{u} ⊤ (X ↘ Spec (.of K)) ⋙ e.functor ≅
        MorphismProperty.Over.pullback finiteEtale.{u} ⊤ (Y ↘ Spec (.of K))) →
      ∃! f : X ≅ Y, f.hom.IsOver (Spec (.of K)) ∧
        Nonempty (e.functor ≅ MorphismProperty.Over.pullback finiteEtale.{u} ⊤ f.inv) := by
  sorry
```

Name `finiteEtale` and `finiteEtale_isStableUnderBaseChange` in the sentence of `README.md:6483` that describes the property used by `anabelian_isom`.

## R02 (P3) — Layer 7 `### Dependencies` does not list the supplier the change adds

**Location:** `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:9015`: "This layer uses [EtaleCohomologyFoundations](…) §F.0.A2 (the arithmetic exact sequence); …" (the paragraph under Layer 7's `### Dependencies`).

**Claim:** §7.0 now takes its Chern classes, their inverse-limit description and the transfer formula from KTheoryFiniteLocalFields §1.8 (`README.md:8441`, `8461`, `8477`), but the layer's dependency paragraph names no KTheoryFiniteLocalFields section.

**Witness:** `KTheoryFiniteLocalFields` occurs in the README only at lines 21, 63, 65, 8441, 8443, 8455, 8461 and 8477; line 9015 has no occurrence.

**Repair:** Append to the paragraph at `README.md:9015`: "[KTheoryFiniteLocalFields](../KTheoryFiniteLocalFields/README.md) §1.8 (ℓ-adic étale Chern classes, their inverse-limit description over rings of S-integers and the transfer formula with the weight factor)".

## Previous findings

- none: the previous report (at 227f000) was an acceptance without findings.

## Verified sound

### Adversarial pass (statements the diff changes or a finding touches)

| Statement | Instance | Values on each side | Result/change |
|---|---|---|---|
| §7.0 `ch_(k,j)` well defined on `K_(2k−j)(𝒪_F)` | `k=2`, `j=1,2` | K-degrees 3 and 2; supplier §1.8 needs `i≥1`, `2i−j≥0`, `ℓ` invertible on `X`: `X=Spec 𝒪_F[1/p]`, `ℓ=p` | In range; `p` odd, so the degree-2 class is additive (supplier: correction only for even `m`) |
| §7.0 localization step | `v∣p`, `k≥2` | `K_(2k−2)(𝔽_v)=0`; `K_(2k−3)(𝔽_v)=ℤ/(q^(k−1)−1)`, prime to `p` | `K_(2k−j)(𝒪_F)⊗ℤ_p→K_(2k−j)(𝒪_F[1/p])⊗ℤ_p` onto for `j=1,2`; kernel finite |
| Check `F=ℚ, k=3` | Euler characteristic of `ℚ_p(3)` over `ℚ` | `c` acts by `(−1)³`: `dim V⁺=0`, `χ=0−1=−1`, `h⁰=h²=0`, `h¹=1`; `rank K₅(ℤ)=r₁+r₂=1` | Both sides 1; Check correct |
| Check `F=ℚ, k=2` | same, `ℚ_p(2)` | `dim V⁺=1`, `χ=0`, `h¹=h²=0`; `rank K₃(ℤ)=r₂=0` (`K₃(ℤ)=ℤ/48≠0`) | Check correct, including "no assertion that the integral groups vanish" |
| "surjective for `k<p`" against the finite-field factor | `p=3`: `k=2,3,4` | `(k−1)! = 1, 2, 6`; mod 3: `1, 2, 0` | Factor a unit for `k≤p`, zero at `k=p+1`; "once p divides (k−1)!" exact; bound `k<p` is Soulé's (`soule` line 700) |
| Finite-field Check | `𝔽_q`, `H¹(𝔽_q,ℤ/p^ν(k))` cyclic `≠0`, `p∣(k−1)!` | multiplication by a multiple of `p` on `ℤ/p^a`, `a≥1`: image of index `≥p` | Not onto; agrees with supplier Check (`𝔽₃`, `m=2`, weight 3: `2!≡0`) |
| Transfer identity `k·(ch(Nx)−N ch(x))=0` | `p=3,k=3` versus `p=5,k=3` | `k` non-unit in `ℤ₃`; unit in `ℤ₅` | Integral commutation only for `p∤k`; rational always; matches API bullet and Check |
| Route of the transfer identity | inflation `H¹(G_(F,T₀),ℤ_p(k))→H¹(F,ℤ_p(k))` | kernel `=0` (inflation–restriction; the kernel subgroup acts trivially on `ℤ_p(k)`); field formula needs `2i−j≥2`: `2k−1≥3` | Step valid; `L/F` separable (number fields) as the supplier requires |
| "`j=2`: target finite" | `H²(G_(F,T₀),ℤ_p(k))` | finitely generated over `ℤ_p` with `⊗ℚ_p=0` ⇒ finite; `soule` line 706–707 states the same | Consistent; "finite cokernel" for `j=2` then automatic |
| R01 repair | scratch copy with `finiteEtale` and the named instance | elaborates, `sorry` the only warning; `#check` prints the head's binders, with `P` replaced by `finiteEtale` | Repair tested |
| Headline `anabelian_isom` (unchanged statement) | head file elaborated from the worktree | one message: `declaration uses sorry` at line 49 | Stands |

Rows for statements the diff leaves untouched stand as in the previous review, of `227f000`.

- Source locators checked against the text, 4 of 6 in the changed passages: `soule` lines 692–701 (§6.1, printed p. 246: surjectivity "[23] if i<p, [9] in general", finite kernel) and 705–707 (p. 247: `H²` finite, ranks); `soule` line 783 (§6.4, p. 249: product and transfer cited to [9], Dwyer–Friedlander, line 965); Weibel Proposition 4.4, preprint p. 22 (text lines 979–986, any `q`, finite separable extension, factor `i`); Weibel Proposition 5.1, p. 24 (lines 1046–1047, `±(i−1)!` on `ℤ/(q, rⁱ−1)`).
- Cross-roadmap citations resolved, 3: KTheoryFiniteLocalFields §1.8 at its open head (heading "1.8 Étale Chern maps before rigidity"; the ℓ-adic paragraph gives `c_(i,j):K_(2i−j)(X)→H^j_cont(X,ℤ_ℓ(i))`, the inverse-limit description for rings of S-integers in degrees 1 and 2, and the transfer identity with factor `i` for `2i−j≥2`); SchemeKTheoryOperations §7.3a at its open head ("Chern classes with values in a cohomology theory"); ArithmeticKTheory §§3.2–3.4 at its open head (headings 3.2, 3.3, 3.4). Index convention in the contract (`README.md:65`) agrees with the supplier's.
- Merge order: KTheoryFiniteLocalFields (line 90) and SchemeKTheoryOperations (line 37) precede this roadmap (line 177). Dependency check: `depcheck: 223 roadmaps, 1997 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Gate (my run on this head): every counter 0 except `statement-hygiene=1`: FAIL (R01); the worker's run adds `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty; `Suggested.lean` and `metadata.toml` are unchanged since 227f000.
- Seeded sample (0.32, 0.33, 0.37, 1.5, 2.11, 2.12, 3.3, 4.2, 4.5, 5.0, 5.9, 5.12, 6.4, 6.7, 7.3): none falls in the changed passages; not re-examined.
- Pull request text against this head: the dependency sentence already names KTheoryFiniteLocalFields and SchemeKTheoryOperations; no sentence describes the construction §7.0 no longer makes; nothing contradicted.
- Ownership: a search of main and the open heads for Soulé's comparison on number rings finds no second owner (PadicHodgeRegulators states a field regulator as a supplier contract; ArithmeticKTheory §3.4 states ranks only). Overlap check: read EffectiveDiophantineMethods, PadicDifferentialEquationsAndRigidCohomology, HeightsRationalPointsAndObstructions, InverseGaloisAndArithmeticFundamentalGroups, ModularCurvesPartII (scope sections); nothing shared with the changed passages.
- Remarks on untouched text: the link anchor `#layer-4-the-tame-quotient-of-the-absolute-galois-group` (`README.md:5808`, `5925`, `6538`) resolves on main; the open revision of LocalFieldsRamification drops that heading but maps "Layer 4" in its table of former layer numbers. The paragraph at `README.md:9015` also omits ArithmeticKTheory §§3.2–3.4.

Source independence: changed passages only; 4 passages compared with 2 sources (`soule`, Weibel), none shared (longest common run under 6 words, formulas apart); the six locators of the changed passages are two each for `soule`, Huber–Wildeshaus and Weibel; no layer added, removed or reordered, so the contents were not compared again; Huber–Wildeshaus could not be read.

## Not verifiable

- Huber–Wildeshaus, Lemma B.4.7 (pp. 120–121) and Theorem B.4.8 (pp. 121–122): the text could not be fetched (the README's EMIS link timed out twice; the journal's Bielefeld address redirects to a missing page; emis.de answered 403; the DOI landing page is on an unclassified host). The statements attributed to it agree with `soule` lines 692–707 after tensoring with ℚ.
- The passages the diff does not touch were not re-examined; the earlier reports' unverifiable items stand (Hadian's thesis, Labute 1967, the published Achinger, Serre Chapter V, Stix 2013, Kim 2008's published pagination).
- Ownership against open pull requests whose files the brief does not supply was checked only through the index search above.

## Source issues

- none

## For the human reviewers

- **Not tested.** Huber–Wildeshaus (Documenta Mathematica 3, 1998), cited at `README.md:8459` for Lemma B.4.7 and Theorem B.4.8, could not be read; its two locators and wording were not compared.
- **Licence.** The Weibel reference (`README.md:9067`) is cited from the author-hosted preprint with the preprint's pagination, not from the published version.
