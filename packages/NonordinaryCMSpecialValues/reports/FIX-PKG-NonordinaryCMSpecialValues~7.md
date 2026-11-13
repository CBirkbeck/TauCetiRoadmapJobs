# FIX-PKG-NonordinaryCMSpecialValues~7

This round settles the four findings of the review `REV-PKG-NonordinaryCMSpecialValues~6`, all P3. I edited two files, `packages/NonordinaryCMSpecialValues/README.md` and `packages/NonordinaryCMSpecialValues/sources.toml`. `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged, because no statement and no Lean name changed.

## F01 (P3) — applied

Both claims are right.
- KATO04 line 5495 applies [KK3, Thm. 4.3.1] with `h = 1` (lines 5495–5503). Its bibliography entry is at lines 6648–6649.
- FINIS06 line 529 quotes [Y, p. 43, (2.19)]. Its bibliography entry is at line 1800.

Yang's paper was fetched through the sources service from GDZ (open repository; an image-only scan read by OCR). It is now `YANG97`. Its Theorem 2.6 and (2.19) are on printed p.43 (YANG97 lines 691–702), and the explicit test function is in Theorem 2.15, p.48 (lines 874–878).

No legal copy of Kato 1999 exists: the service found nothing, and a web search found no open or author copy. It is recorded as `KATO99` with status `uncertified`. Its locator is the one Kato 2004 gives, and nothing in the roadmap depends on its text beyond what KATO04 states.

Changed (old → new):
- §2.5, "Kato's generalised explicit reciprocity law" → "…, Kato 1999, Theorem 4.3.1, as cited at KATO04 lines 5495–5503".
- §4.2, "reformulating Yang's theta-lifting formula" → "…, Yang 1997, Theorem 2.6, (2.19), p.43, for the test function of Theorem 2.15, p.48, YANG97 lines 691–702 and 874–878; Finis quotes it at FINIS06 line 529".
- Two `## References` entries and two manifest entries (`cited_for` `2.5` and `4.2`).

Pattern search. I looked for named deep results: "Yang's formula", "Finis's theorem", "Kronecker's formula", "Ridout's inequality", "Shimura", Néron–Ogg–Shafarevich, Honda–Lubin–Tate and Fröhlich–Queyrut.
- Kronecker's limit formula (§2.2) is classical and cited at Kato 2004, (15.5.1), p.253, which is enough for a standard fact.
- Ridout, Néron–Ogg–Shafarevich, Honda–Lubin–Tate and Shimura (§6.3) each come from a named supplier section.
- Fröhlich–Queyrut has `QUEYRUT74`.

No other named input lacked a source.

## F02 (P3) — applied

The claim is right. By §0.1, `φ((n)) = κ_K(n) n` for integers `n` prime to `f`. A ring-class `ρ` is trivial on `(n)` for such `n`, because `nO_c` is principal in `O_c`. So `η((n)) = κ_K(n) n`. Type `(1, 0)` gives `η((n)) = n` when `n ≡ 1 mod cond η ∩ Z`. Hence `κ_K`, of conductor `7`, is periodic modulo `cond η ∩ Z`, and `7 ∈ R` for every `η`. The support `{5}` occurs for no `η` over `Q(√−7)`.

Changed (old → new): "support `{5}`: the rational term omits multiples of `5` …" → "`P = {5}`, support `{5, 7}`", with the reason `7` lies in every support and the full factor `(1 − κ_K(5)/5)(1 − κ_K(7)/7) = (1 + 1/5)·1`. The printed value is unchanged.

Pattern search: the only other passage naming a support for `Q(√−7)` is the Worked example, which says "the canonical character with conductor supported at `7`". That is consistent with this repair, and §§0.1 and 6.2 name no other support.

## F03 (P3) — applied

The claim is right. `−7 ≡ 2 mod 3` is a nonsquare, so `3` is inert in `Q(√−7)`. §0.6 and the Conventions ("Indices") require `l ≥ 5` split. The only primes dividing `p² − 1 = 24` are `2` and `3`, so no admissible `l` exists for `p = 5`.

Changed (old → new): the `p = 5`, `l = 3` bullet → `p = 47`, `l = 23`. `47` is inert, `23` splits, `23 ∤ h_K N(f) = 7`, `47 ∤ 22`, and `23 | 46`, so `23` divides both `[F_n : H] = 2208 · 47^{2n}` and `[L[r] : K] = 23^r`. The bullet also adds a negative control: for `p = 5` no admissible `l` divides `24`.

Pattern search: every other numerical Check with specific `p` and `l` was rechecked: §§0.2, 0.5, 0.6, 1.3, 2.3, 2.5, 3.5, 5.7, the Layer 0, 1 and 5 Examples, §6.5 and the Worked example. All use admissible primes, or name an excluded one as a negative control (§0.5 `l = 11, 13`; §6.5 `p = 2`). §1.3's `Q(√−31)`, `p = 3` lies outside the BKO setting by design, since Layer 1 does not assume `p ∤ h_K`. In §4.2, `l = 1` is a different object, an ideal.

## F04 (P3) — applied

The claim is right. §0.2 cites "Jia, Introduction, p.1, JIA24 line 18" (line 18 is in the Introduction on p.1), and §6.1 cites "Jia, §4, pp.18–20".

Changed (old → new): JIA24 `cited_for` gains `0.2` and `6.1`, and its locator gains the prefix "Introduction, p.1; ".

Pattern search: I scanned the README section by section for every key. All other entries match the sections that cite them by locator. Three name-only hits are cross-references, not citations, and are left out of `cited_for`:
- §0.4 "Kato's reciprocity law (§2.6)";
- §5.4 "Finis's theorem is the input";
- §4.3 "the arithmetic form of Yang's formula", which refers to §4.2.

## Adversarial pass on the changed text

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §3.2 Check: `47` inert in `Q(√−7)` | Legendre symbol, by reciprocity and by Euler's criterion | `−7 ≡ 40`; `(2/47) = 1` (`47 ≡ 7 mod 8`), `(5/47) = (47/5) = (2/5) = −1`; `40^{23} ≡ −1 mod 47` | inert | new bullet |
| §3.2 Check: `23` admissible | split, `≥ 5`, `∤ h_K N(f)`, `p ∤ l − 1` | `4² = 16 ≡ −7 mod 23`; `h_K N(f) = 7`; `22 mod 47 = 22 ≠ 0` | admissible | new bullet |
| §3.2 Check: degrees not coprime | `[F_n : H]` against `[L[r] : K]` | `47² − 1 = 2208 = 46·48 = 23·96`; `[L[r] : K] = 23^r` | `23` divides both | new bullet |
| §3.2 negative control | `p = 5` | prime factors of `24`: `2, 3`; `−7 ≡ 2 mod 3` is a nonsquare | no admissible `l` | new sentence |
| §6.2 Check: `7 ∈ R` | `P = ∅` (then `L_∅ = H = K` and `ρ = 1`); `P = {5}` | `cond φ = (√−7)`, `R = {7}`; for `P = {5}`, `R = {5, 7}` | the ramified prime is always present | support corrected |
| §6.2 Check: limit | `κ_K(5)`, `κ_K(7)` | `(−7/5) = (3/5) = −1`, so `1 + 1/5 = 6/5`; `κ_K(7) = 0`, so factor `1` | value `2L(1, κ_K)·6/5` unchanged | none |
| §2.5 and §4.2 citations | locators at the source | KATO04 lines 5495–5503 (`[KK3, Thm 4.3.1]`, `h = 1`); YANG97 p.43 header line 681, (2.19) lines 698–702, Theorem 2.15 p.48 lines 850, 874–878; FINIS06 line 529 | match | citations added |

## Checks run

- **Elaboration.** `lake env lean packages/NonordinaryCMSpecialValues/Suggested.lean`, run from the content checkout, exited 0. The output was exactly three warnings, "declaration uses `sorry`", at lines 130, 140 and 166. Both `TauCeti.*` object files were present.
- **Signatures.** I wrote a scratch copy with `#check @name` for all ten declarations and elaborated it once (exit 0). Each elaborated type matches its README statement and the existing signature record:
  - the six definitions keep `[Field K] [NumberField K]`, and `[IsCMField K]` where it is used;
  - the two Rohrlich theorems keep algebraicity, the nonzero direction and the exponent ranges;
  - `centralValue_parity_dichotomy` keeps all of its hypotheses.

  Nothing changed, since the Lean file was not edited.
- **Manifest.** `sources check` on the manifest reports 0 problems. The sources service also moved `cited_for` lines below other fields in four entries, with no change of value.
- **Missing sources.** None outstanding. The service wrote two `[[missing]]` tables while it tried to fetch the new works. Both are settled: `YANG97` was fetched from GDZ, and `KATO99` is `uncertified`. No `needs-references.toml` is left for this job.
- **Dependency check** (as prescribed, with `--movable`):

```text
depcheck: 208 roadmaps, 1906 edges, 0 problem(s)
```

  It reports no UPWARD, CYCLE or moved line.
- **Citation resolver.** It has one lead: "LubinTateFormalModulesAndQuasiCanonicalLifts §2.1: no roadmap … on main or in an open pull request". This is a false positive. That roadmap is the board package at merge-order line 344, immediately before this one at line 345, and its §§2.1–2.4, 4.3 and 4.4 exist under those headings in `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md`.

## Gate failures

None were listed for this round.

## For the maintainer

- No construction, target or Lean name was added or renamed, so other roadmaps that cite this one are unaffected. No ownership question arises, because the edits add citations and correct two Checks.
- `KATO99` is recorded as `uncertified` with licence class `none`, although no paywalled copy was found either. The work is a printed proceedings volume with no online copy that the service or a web search could find. It is cited only by the locator that KATO04 itself gives. If a human prefers to treat it as a missing text instead, the entry should become a request.
- The `YANG97` text is an OCR extraction of an image-only scan. The cited lines were read and match Finis's quotation, but the OCR is garbled in places, for example the display of (2.19).
