# FIX-PKG-ModpRepresentationsOfGL2OverLocalFields~6

Repair of the four findings of `REV-PKG-ModpRepresentationsOfGL2OverLocalFields~5`. Files changed:
`packages/ModpRepresentationsOfGL2OverLocalFields/README.md` and
`packages/ModpRepresentationsOfGL2OverLocalFields/sources.toml`. `Suggested.lean`, `metadata.toml`
and `design/plan.json` are unchanged.

## F01 (P1) — applied

Verified. With `𝔽₂₅ = 𝔽₅[t]/(t² − 2)`, `t⁵ = t·(t²)² = 4t = −t`, so `χ = ac∘det` and `χ⁵` take the
values `t` and `−t` at `diag(t̃, 1) ∈ K`; a `K`-map `χ|_K → χ⁵|_K` is a scalar `c` with `2tc = 0`,
so `c = 0`, and `Hom_{G′}(I(χ|_K), χ⁵) = 0` by Frobenius reciprocity.

§1.2, last Check: "each a quotient of `I(χ|_K)`" → "quotients of `I(χ|_K)` and of `I(χ⁵|_K)`
respectively, and not of a common one", with the computation above, and the two-step filtration
`W₁ = χ|_K`, `W₂ = χ⁵|_K` of `V ⊗ 𝔽₂₅`. The `𝔽₅` one-step filtration and the dimension count `2 = 1 + 1`
are kept. Pattern search: no other place says two Galois-conjugate characters are quotients of one
compact induction. §2.3 refers to this example only as a module that must be split first, which
remains true.

## F02 (P1) — applied

Verified against LE19 (arXiv:1809.10247v3, fetched through the sources service and added to the
manifest under `LE19`). For `p > 2` and `F = ℚ_{p³}`: LE19 line 30 (Theorem 1.1), lines 46–47 (central
characters and supersingular Hecke eigenvalues, p. 2), line 118 (the `K`-action on `D₀(ρ̄)` factors
through `GL₂(𝔽_q)`), line 165 (`D₀ = ⊕_{i∈ℤ} D₀,i`, §2.2, p. 4), lines 231–237 (Theorem 3.2:
`D(λ) ⊂ π`, defined over `𝔽_q` if `λ ∈ ∏𝔽_q^×`), and lines 269–271 (Theorem 3.4: irreducible over
`𝔽̄_p` if `λ₀ ∈ 𝔽_q` and `λ_i ≠ λ₀` for `i ≠ 0`). So `π^{K₁} ⊇ ⊕_{i∈ℤ} D₀(ρ̄)` is
infinite-dimensional. CDN23 line 273–276 (Remarque 0.13(ii)) also says supersingular irreducibles
need not be admissible.

§2.4, third Check: "a supersingular irreducible representation over `k̄` with central character is
admissible and not in `𝒞`" → "an **admissible** absolutely irreducible `k[G]`-module whose scalar
extension to `k̄` is supersingular is not in `𝒞`, not being finitely presented". The argument is that
a finite presentation over `k` base-changes to one over `k̄`, and CDN23 Théorème 1.27, p. 19, applies.
The Check now has finite coefficients, as `𝒞_𝒪` needs. A new Check adds Le's non-admissible
representation as the negative control (`λ₀ = 1`, `λ_i = 2`). The `c-Ind σ` clause is kept.

Pattern search: README lines on admissibility of irreducibles (§0.6, §2.3 route, §2.4 `F = ℚ_p`
sentence) all assume admissibility or `F = ℚ_p`. The §0.4 and §1.3 Checks and the worked example
"Coherence in action" claim only that supersingulars are not finitely presented. That is the supplier
contract PadicLocalLanglandsForGL2Qp §2.9(i), and CDN23 Théorème 1.27 states it without an
admissibility hypothesis. These need no change. The main theorem of §2.4 already assumes
admissibility.

## F03 (P2) — applied

Verified. PadicLocalLanglandsForGL2Qp §2.9(iii) (at the head of its open pull request) asserts only
that `I(σ)/(T)` is not irreducible. CDN23 lines 702–705 (Remarque 1.18) state Emerton's conjecture,
not infinite length. BP12 §10, p. 64 (lines 2597–2607), does assert infinitely many non-isomorphic
irreducible quotients of `(c-Ind 1)/(T)` for `F = ℚ_{p²}`, but it rests on Proposition 10.2, whose
proof the authors omit (line 2595–2596). So no verified locator supports the Check.

§1.1, third Check (deleted): "`F = ℚ_p` is essential: for `F ≠ ℚ_p` the quotient `I(σ)/T I(σ)` has
infinite length …". The correct part of that Check moves into the §1.1 route as one sentence: the
hypothesis `F = ℚ_p` enters through the finite length of `I(σ)/P(T)I(σ)`, and CDN23, Remarque 1.18,
p. 16, records only Emerton's conjecture for general `F`. No length claim is made. Pattern search: no
other place claims infinite length of `I(σ)/(T)` away from `ℚ_p`. The design note in `design/plan.json`
("F=Q_p is essential") is design guidance outside this job's editable fields and asserts no length.

## F04 (P3) — applied

Verified: VIGNERAS11 line 723 (Théorème 6, p. 19, proof to p. 21), line 783 (Proposition 8, p. 21),
line 808 (Lemme 11, p. 21), lines 827 and 835 (Propositions 9 and 10, p. 22; page marker line 824).

`sources.toml` VIGNERAS11 locator: "§5, Lemme 11, Propositions 8-10 and Théorème 6, pp. 19-21" →
"§5, Théorème 6, pp. 19-21; Proposition 8 and Lemme 11, p. 21; Propositions 9-10, p. 22 (arXiv
numbering)". The key, fetched fields and version note (with its warning on Propositions 9–10) are
kept. Same pattern repaired in the README References entry and in §0.8 ("Lemme 11, p. 21, and
Proposition 9, p. 22"). §§2.3–2.4 already had correct pages.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result; change |
| --- | --- | --- | --- |
| §1.2 Check, `V ⊗ 𝔽₂₅ = χ ⊕ χ⁵` | `𝔽₂₅ ⊗_{𝔽₅} 𝔽₂₅ → 𝔽₂₅ × 𝔽₂₅`, `a⊗b ↦ (ab, a⁵b)`; `h = diag(t̃,1)`; scalar `5` | Action of `c`: `(cab, c⁵a⁵b)`, so the factors are `χ, χ⁵`. `χ(h) = t`, `χ⁵(h) = t⁵ = −t`. `Hom(χ,χ) = Hom(χ⁵,χ⁵) = 1`, `Hom(χ,χ⁵) = Hom(χ⁵,χ) = 0` (`2t ≠ 0`). `χ(5I) = ac(25) = 1`, `χ⁵(5I) = 1`. | Old "each a quotient of `I(χ|_K)`" fails; corrected Check holds; dimension `2 = 1 + 1`. |
| §1.2 Check, irreducibility over `𝔽₅` | `X² − 2` over `𝔽₅` | Squares mod 5: `0,1,4`; `2` is not a square, so no root; `End_K(V) = 𝔽₂₅`, dimension 2. | Unchanged; pass. |
| §2.4 Check, admissible supersingular not in `𝒞` | `F = ℚ_{p²}`, BP12 Theorem 19.8 admissible supersingular `π`; `F = ℚ_p` supersingular `Π(r,0,χ)`; base change of invariants | `(π ⊗ k̄)^U = π^U ⊗ k̄`, e.g. trivial `k²` gives `2 = 2`. A presentation `c-Ind W → π` with kernel generated by `n` elements base-changes to `c-Ind(W ⊗ k̄)` with `n` generators. For `F = ℚ_p` supersingulars are finitely presented (§2.7) and lie in `𝒞`. | Holds for `F ≠ ℚ_p`. The `F ≠ ℚ_p` hypothesis is necessary (`ℚ_p` case is in `𝒞`). |
| §2.4 negative control (Le) | `p = 5`, `q = 125`, `λ₀ = 1`, `λ_i = 2`; `p = 3`; `p = 2` | `2 ≠ 1` in `𝔽₁₂₅`, both in `𝔽_q^×`, so Theorems 3.2 and 3.4 apply. `|D(ρ̄)| = 2³ = 8` socle weights, so `D₀(ρ̄) ≠ 0` and `dim π^{K₁} ≥ Σ_{i∈ℤ} dim D₀(ρ̄) = ∞`. `Π² = pI` acts trivially (`G′`-module). `p = 3` allowed (`p > 2`); `p = 2` excluded (no generic `ρ̄`, LE19 line 107). | Non-admissible irreducible with central character; the old universal admissibility claim is false. Check added. |
| §2.4 negative control, supersingularity | Classes of irreducibles with central character over `k̄` | Characters and principal series are admissible: their `K₁`-invariants have dimension `1` and `|ℙ¹(𝔽_q)| = q + 1`. Steinberg twists are quotients of principal series, hence admissible (CDN23 line 830). Le's `π` has infinite-dimensional `K₁`-invariants. LE19 p. 2 gives supersingular Hecke eigenvalues. | Consistent; `π` is supersingular. |
| §1.1 deleted Check | `I(1)/(T−1)` | Reducible = true, length = 2: "not irreducible" does not imply infinite length. | Deleted; route sentence cites only Emerton's conjecture (CDN23 lines 702–705). |
| §1.1 new route sentence | `F = ℚ_p` vs general `F` | Barthel–Livné finite codimension and `End = k[T]` hold for every `F` (supplier contracts R07.5.15 and the gap), while finite length of `I(σ)/P(T)` uses the `ℚ_p` classification (PadicLocalLanglandsForGL2Qp §2.7). | Accurate; no new target. |
| VIGNERAS11 locators | Page markers lines 693, 733, 774, 824 | Théorème 6 at line 723 (p. 19), Proposition 8 at 783 and Lemme 11 at 808 (p. 21), Propositions 9 and 10 at 827 and 835 (p. 22). | Old range omitted p. 22; corrected in manifest, References and §0.8. |

## Checks run

- Elaboration: `lake env lean packages/ModpRepresentationsOfGL2OverLocalFields/Suggested.lean`, run
  from the content checkout. Exit 0, seven `declaration uses 'sorry'` warnings, at lines 104, 121,
  133, 151, 166, 180 and 202, and no errors. No `TauCeti.*` import, so nothing needed building.
- Signatures: a scratch copy of `Suggested.lean` with `#check @name` for all 12 declarations
  elaborated with exit 0. Its elaborated types are byte-identical, after whitespace and namespace
  normalisation, to the worker's `signatures.md`. No binder changed and nothing was changed in the
  Lean file, as no finding touches it.
- Dependency direction: the `gate --depcheck … --movable` command returned
  `depcheck: 206 roadmaps, 1907 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line).
- `roadmaps resolve` on the README: no unresolved cross-roadmap citation and no unknown Lean name.

## Sources

- `LE19` added through the sources service (arXiv:1809.10247v3, open repository, certified). Its
  manifest entry has the title "for GL2", published year 2019, locators "Theorem 1.1, p. 1; central
  characters and Hecke eigenvalues, p. 2; §§2.1-2.2, pp. 3-4; Theorems 3.2 and 3.4, pp. 5-6" and a
  version note on the published Math. Res. Lett. 26 (2019) version. It also has a README References
  entry.
- No text is missing, so no `needs-references.toml` was written.

## Notes for the maintainer

- No Lean name, section number or target id changed; no consumer citation is affected.
- No new construction was introduced, so no ownership question arises. The negative control cites a
  source (LE19) and the existing supplier sections PadicLocalLanglandsForGL2Qp §2.9(i) and
  FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15 (Barthel–Livné classification). Both already
  appear in the supplier contracts.
- PadicLocalLanglandsForGL2Qp §2.9(i) states non-finite-presentation of supersingulars without an
  admissibility hypothesis, as CDN23 Théorème 1.27 does. The corrected §2.4 Check adds "admissible"
  only because a non-admissible representation is outside `𝒞` anyway.
- The review text was read as data; it contains no instruction outside the job.
