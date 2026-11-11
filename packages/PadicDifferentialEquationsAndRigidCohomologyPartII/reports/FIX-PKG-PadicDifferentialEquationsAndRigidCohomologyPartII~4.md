# Repair report: PadicDifferentialEquationsAndRigidCohomologyPartII (package, round 4)

This round settles the two findings of `REV-PKG-PadicDifferentialEquationsAndRigidCohomologyPartII~3`. Both are correct, and both are applied.

Files edited:
- `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md`
- the `needs` strings of two entries in the top-level `gaps` list of `design/plan.json`
- the AE `locator` in `sources.toml`

`Suggested.lean` is unchanged. It declares nothing, and no headline changed.

## F01 (P1) — applied

Old: gap `irreducible-iota-purity` asked that every irreducible `K`-object be `ι`-pure. MS.6.9(a) forgot `L` and used that purity.

New: the gap asks for purity of the `L`-linear Frobenius, for `L`-objects that stay irreducible after every finite extension of `L`. MS.6.9(a) applies it directly to such a model. MS.6.9 defines `ι`-purity of `Q̄_p`-objects and gains a negative-control Check built on `ℚ_3(√5)`.

**Verification.**
- AE's `Isoc†(X0)` is the `Q̄_p`-coefficient category (AE line 153–183).
- AE Theorem 2.7 (AE line 539–553) and TSU Theorem 7.18 with Definition 7.14 (TSU line 1814–1825, 1923–1925) concern `Q̄_p`-objects only.
- Parent §RD.6.28 measures weights with the `K`-linear `F_x`.
- The witness reproduces: `T² − T − 1` has values `2, 2, 1` mod 3 and roots of modulus `1.618…` and `0.618…`.

**Other places repaired (same pattern).**
- Gap `lefschetz-curves-irreducibility` asked only for irreducibility among `L`-objects, in both hypothesis and conclusion. With that conclusion MS.6.9(b) does not reach `LC_(Q̄_p)`: with `L = ℚ_3`, the constant `T² − T − 1` object is `ℚ_3`-irreducible but splits over `ℚ_3(√5)`. Hypothesis and conclusion now ask for irreducibility after every finite coefficient extension, which is AE Theorem 3.10 (AE line 747–750) read in the `Q̄_p` category. MS.6.9(b) and a second Check were updated to match.
- Convention 10 now says that `ι`-weights are computed on finite models with the `L`-linear Frobenius.
- The MS.6.5 API bullet on Tsuzuki's Lemma 7.7 (TSU line 1580–1587, correct as stated) now says that the isotypic `K`-object need not be pure.
- The Layer MS.6 Examples gain the `ℚ_3(√5)` example.
- MS.6.9 gains an API list for the newly explicit purity definition: independence of the model, the weight of `N†^∨ ⊗ M†`, and constant twists. MS.6.9's *Needs* gains §RD.6.2.

The two slugs are unchanged, and the README and `plan.json` agree on all nine `needs` strings. MS.6.10, MS.6.12 and MS.6.13 already work with `Q̄_p`-objects and tensor products over `L`, so they read correctly under the explicit definition and needed no edit.

## F02 (P3) — applied

Old third Check of MS.6.1: "Separate witnesses for `M†` and `N†` do not give one curve…". It had no instance.

New Check: `X = A¹_(𝔽_p)`, `α` the origin, `M†` the unit, and `C = A¹_(𝔽_(p²))` with `x ↦ s`. `C` is smooth and connected over `𝔽_p`, the pullback has rank one, and the image contains `α`. The fibre is `Spec 𝔽_(p²)`, so there are 0 `𝔽_p`-lifts (the identity curve has 1). `C` is not a witness, but LC still holds.

The two-witness remark stays in the MS.6.1 prose ("different objects may need different curves") and API ("Witnesses for two objects at the same point need not coincide").

## Checks run

**Elaboration.** `lake env lean packages/PadicDifferentialEquationsAndRigidCohomologyPartII/Suggested.lean`, run from the content checkout after the final edit, exited 0 with no output. The file imports no Tau Ceti module, so nothing had to be built.

**Signature probe.** `Suggested.lean` has one `import Mathlib`, one module docstring, the namespace and zero declarations. The `#check @name` comparison therefore has zero cases, and no elaborated type could change. No headline became statable: the repairs concern supplier contracts and the MS.6.9 route, and the carriers the docstring lists as missing (overconvergent `Q̄_p`-F-isocrystals, their fibres and `ι`-weights, Lefschetz curves) are still absent at the pins.

**Dependency check**, run after all edits:

    depcheck: 236 roadmaps, 2135 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line. The one extra edge compared with the previous round is the §RD.6.2 citation added to MS.6.9's *Needs*. Its supplier, PadicDifferentialEquationsAndRigidCohomology, was already a supplier.

**Gap consistency.** A script compared the README's "(gap:…)" lines with the `gaps` list of `design/plan.json`:
- Nine slugs on each side, and every `needs` string is identical.
- A diff against the pre-edit `plan.json` shows that only `gaps` changed, and only the `needs` field of `irreducible-iota-purity` and `lefschetz-curves-irreducibility`.
- The file's formatting round-trips exactly.

**Citation resolution.** `roadmaps resolve` on the README reports no cross-roadmap citation and no Lean name found nowhere.

**Hygiene.**
- No machine path appears in the edited files.
- No code span is split across lines in the edited sections.
- No process words were added.

## Ownership and overlaps

The repaired contracts still ask PadicDifferentialEquationsAndRigidCohomology, the only owner of overconvergent F-isocrystals with `ι`-weights. `roadmaps grep` over main and the 439 open heads found:
- no citation of Abe–Esnault;
- no "Lefschetz theorem for isocrystals";
- no `Q̄_p`-coefficient purity outside that roadmap.

No new construction is stated here. The overlap report lists no open pull request changing this roadmap and no dropped or revision-only id. No id of this roadmap was renumbered or deleted.

## Adversarial pass (changed and added statements)

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Gap irreducible-iota-purity (new) | `L = K`, Frobenius 2 on `Spec 𝔽_3` | eigenvalue 2; `w = 2 log_3 2 = 1.2619…`; `3^(w/2) = 2` | holds; non-integral weight | none |
| same | `L = ℚ_3(√5)`, `L`-line `F = a = (1+√5)/2` | `L`-linear spectrum `{a}`; `w = ±0.8760…` (sign depends on `ι(√5)`); single weight | holds | contract restated |
| same, forgotten object | the `ℚ_3`-object underlying the above | spectrum `{a, 1−a}`; moduli `1.618…`, `0.618…`; weights `0.876…`, `−0.876…` | not pure; the contract asserts nothing of it | says so explicitly |
| same, hypothesis | `L = K = ℚ_3`, constant `T²−T−1` | `ℚ_3`-irreducible; over `ℚ_3(√5)` splits as lines `a`, `1−a` | hypothesis fails, so the contract is not applied to a non-pure object | absolute irreducibility in hypothesis |
| same, degree-2 point | constant `L`-line on `A¹_(𝔽_3)`, `d = 2` | `F_x = a²`, `|a²| = 2.618… = 3^(0.876…)` = `q^(wd/2)` | consistent | none |
| same, unit | `O ⊗_K L` | eigenvalue 1 everywhere, `w = 0` | holds | none |
| same, `ι` an embedding | eigenvalues generate a countable subfield `F` | `ι|_F` extends to an isomorphism `K^alg ≅ ℂ` (both have transcendence degree continuum over `F`) | the embedding form follows from AE's isomorphism form | none |
| Gap lefschetz-curves-irreducibility (new) | `X` a curve, `S = {α}`, identity | restriction = `M`; absolutely irreducible stays so | holds | contract restated |
| same, old conclusion | `L = ℚ_3`, constant `T²−T−1` on `A¹`, identity curve | `ℚ_3`-irreducible restriction; `Q̄_p` constituents 2 | old conclusion does not give `LC_(Q̄_p)` | conclusion strengthened |
| same, rank one | `X = Spec 𝔽_q`, `C = A¹_(𝔽_q)` with a rational point | rank 1 stays irreducible | holds | none |
| MS.6.9 definition of `ι`-pure | `L`-line `a`, `L′ ⊇ L` | eigenvalue `a` under both models | independent of the model | definition and API added |
| MS.6.9(a) route, multiplicity | `X = Spec 𝔽_(q²)` over `𝔽_q`, unit, `L = K_2`, `n = 2` | `M_x ≅ L²`, `F` swaps factors, `F² = 1` on each; eigenvalues `{1,1}` vs fibre `{1}` | same set, multiplicity `n` | route written |
| MS.6.9 API, `N^∨ ⊗ M` | pure lines of weights `w`, `w′` | eigenvalue `a/b`, `|ι(a/b)| = q^(n(w−w′)/2)` | weight `w − w′`; `w = w′` gives 0 as MS.6.13 uses | API bullet |
| MS.6.9 API, constant twist | `c` with `|ι(c)| = q^(w/2)` | fibre eigenvalue `c^n`, modulus `q^(nw/2)` | adds `2 log_q|ι(c)| = w` | agrees with the existing Check |
| MS.6.9 Check, mod-3 values | `T² − T − 1` at 0, 1, 2 | `−1, −1, 1 ≡ 2, 2, 1`; squares mod 3 `{0,1}`, `5 ≡ 2` | irreducible over `ℚ_3`; `ℚ_3(√5)` unramified quadratic | Check added |
| MS.6.9 Check, eigenvalues | `a`, `1−a` | `a + (1−a) = 1`, `a(1−a) = −1` (= det), moduli `1.6180…`, `0.6180…` | unequal; no common weight | Check added |
| MS.6.5 API (Lemma 7.7) | `L`-line `a` over `ℚ_3` | underlying `ℚ_3`-object irreducible, multiplicity 1, not pure | the lemma holds; the caveat is needed | clause added |
| Convention 10 | the same pair | `L`-linear weights `{0.876…}`; forgotten weights `{±0.876…}` | the convention fixes the first | sentence added |
| MS.6.1 Check (F02) | `C = A¹_(𝔽_(p²)) → A¹_(𝔽_p)`, `x ↦ s`, `p = 2, 3` | pullback rank 1; fibre over 0 is `Spec 𝔽_(p²)`; `Hom_(𝔽_p)(𝔽_(p²), 𝔽_p) = ∅`, so 0 lifts; identity gives 1 lift | the image-only definition accepts `C`, the stated one rejects it | Check replaced |
| MS.6.1, unit on `C` | `End(1_C)`: constants `K_2`, Frobenius-fixed `K` | rank one, so irreducible | rank claim correct | none |

## Notes for the maintainer

**Consequence for the parent roadmap.** The second clause of PadicDifferentialEquationsAndRigidCohomology §RD.6.77 says that every irreducible `ι`-realizable overconvergent F-isocrystal on a curve is `ι`-pure. Read with irreducibility in F-`Isoc†(X/K)`, the review's example refutes it:
- the constant rank-two `ℚ_3`-object on `A¹_(𝔽_3)` with Frobenius of characteristic polynomial `T² − T − 1` has rational local characteristic polynomials, so by §RD.6.57 it is `ι`-real;
- it is `ℚ_3`-irreducible;
- it is not pure.

§RD.6.69 defines determinantal weights through absolutely irreducible constituents, and the proof of the parent's §RD.6.84 (Weil II on the affine line) first reduces to absolutely irreducible objects. The intended reading is therefore "absolutely irreducible", and §RD.6.77's statement should say so. This package no longer relies on §RD.6.77: its contract is the absolutely irreducible, coefficient-linear form.

**Changed supplier contracts.** The texts of two contracts addressed to the parent changed: `irreducible-iota-purity` and `lefschetz-curves-irreducibility`. Their slugs and sections are unchanged. No other roadmap cites them.

**Names.** No id, layer or backticked name of this roadmap changed. `Suggested.lean` is unchanged.

**Sources.** Nothing was fetched and no `needs-references.toml` was written. The AE locator in `sources.toml` gains "Section 1.1 (coefficient categories)", which is now cited for the `Q̄_p` category. All locators were checked against the cached texts: AE PDF pages 4, 13 and 17; TSU pages 34 and 37.

**Untrusted text.** The review contains no instruction-like passage. Nothing suspicious was found in the sources or the sibling roadmaps.
