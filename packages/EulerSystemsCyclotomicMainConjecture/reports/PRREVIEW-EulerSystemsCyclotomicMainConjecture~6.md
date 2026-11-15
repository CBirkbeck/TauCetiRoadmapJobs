# Review of EulerSystemsCyclotomicMainConjecture (pull request #1311 at e6971b4)

**Verdict:** needs changes

## R01 (P3) — Two edited *Needs* lines still leave out inputs that their own text names

**Location:** `TauCetiRoadmap/EulerSystemsCyclotomicMainConjecture/README.md:2806` (§4.8): “*Needs:* [§4.1](…); [§4.4](…); [§4.5](…); [§4.7](…); [§4.2](…); IntegralIwasawaTheory §6.3; …”. Also line 2890 (§4.10): “… [§4.8](…); IntegralIwasawaTheory §0.3; IntegralIwasawaTheory §2.8 …”.

**Claim:** Step 1 of §4.8 uses Corollary 2.12, which is stated in §4.6. The *Needs* line of §4.8 lists §§4.4, 4.5 and 4.7, but not §4.6. The statement of §4.10 takes `C(K_n^+)` from IntegralIwasawaTheory §1.7, and its *Needs* line does not list that section.

**Witness:** Line 2795: “`z_{χ^{−1}}` is a free generator (Corollary 2.12)”. Corollary 2.12 is stated at line 2637, in §4.6. Line 2837: “Sinnott's norm-generated group of IntegralIwasawaTheory §1.7”, which defines it (its README line 213, at `72d834e`).

**Repair:** In line 2806, insert `[§4.6](#44-colemans-map-over-unramified-coefficients-at-every-prime-with-its-free-character-target);` after the §4.5 link. In line 2890, insert `IntegralIwasawaTheory §1.7 (Sinnott's norm-generated circular units);` before `IntegralIwasawaTheory §2.8`.

## Previous findings

- R01 — repaired: line 3180 now reads “…for imaginary abelian `F` unramified at `p` whose `p`-Sylow subgroup `Δ_p` is cyclic: at `p = 2` for every odd character, which is then faithful on `Δ_2`, and at odd `p` for odd characters faithful on `Δ_p`.”
- R02 — repaired: line 2504 reads “Sections 4.6–4.8, 4.10, 4.12, 4.14 and 4.27 consume them.” The *Needs* lines of §4.10 (line 2890) and §4.12 (line 2959) now link §4.3.
- R03 — repaired: the description reads “Claude (Opus 5.5, Fable 5.1 and Fable 5.2) made the later repairs, as the commits' co-author lines record.” The trailers agree: five commits with Opus 5.5, `7790892` with Fable 5.2, `0ae2bbd` with Fable 5.1 and `f5a88df` with Codex.

## Verified sound

| Statement | Instances | Values computed on the two sides / competing model | Result; change |
|---|---|---|---|
| §4.20 introduction, `p=2` | `F=ℚ(√−15)`; `F=ℚ(√−3,√5)` | First field: `Δ₂=C₂`, `B_{1,χ}=−2`, `Nχ(½B)=2⁰=1`, `\|A₂(F)_χ\|=\|A/(1+j)A\|=2`. Second field: `Δ₂=C₂×C₂`, now excluded | `2≥1`, and `2=2·Nχ` as the 2-power Check says. Agrees with GREITHER-1992 lines 1162–1167 |
| §4.20 introduction, odd `p` | `p=3`: `F=ℚ(√−23)`; `F=ℚ(ζ₇)` | First field: `Δ₃=1`, `B_{1,χ}=−3`, `Nχ(½B)=3`, `h=3`. In `ℚ(ζ₇)`, `χ₋₇` is trivial on `Δ₃=C₃`, so the hypothesis excludes it | `3≥3`, with equality (Solomon) |
| “which is then faithful on `Δ_2`” | cyclic `Δ₂∋j` of order `2^k≥2` | Every nontrivial subgroup of `Δ₂` contains the unique involution `j`. Since `χ(j)=−1`, `ker χ∩Δ₂=1` | Correct. At 2, the Lean hypothesis `hfaithful` therefore excludes no character |
| `relativeClassGroup_lowerBound` (cited) | `p=3`, `K=ℚ(√−23)`, `f=23`, `E=ℚ₃` | LHS `‖N(−3/2)‖₃⁻¹=3`. RHS `#((ℤ₃⊗Cl)/(jx+x))=#ℤ/3=3`. `hcyclic` and `hfaithful` hold for the trivial Sylow subgroup | `3≤3`. The introduction and the Lean statement now both assume a cyclic Sylow subgroup at every `p` |
| §4.2 introduction | *Needs* lines citing §4.2 or §4.3 from outside the group | 4.6, 4.7, 4.8, 4.10, 4.12, 4.14, 4.27. The text uses them at lines 2837, 2916 and 3761 | Equals the stated list |
| §4.4 introduction (§4.8 now links §4.4) | *Needs* lines citing §§4.4–4.6 | 4.7, 4.8, 4.10, 4.27 | Equals “4.7, 4.8, 4.10 and 4.27” |
| §4.8 *Needs* | inputs named in §4.8 | §4.4 (line 2789); §4.5, Prop. 2.10 (2796); §4.6, Cor. 2.12 (2795); §4.7, Thm. 2.13 (2795); §4.2 | §4.6 is not listed: R01 |
| §4.10 *Needs* | inputs named in the statement | §4.3 (line 2837) is now listed; IntegralIwasawaTheory §1.7 (line 2837) is not; §§0.3, 2.8, 3.2 and 4.4 are listed | R01 |
| §4.12 *Needs* (sampled) | its use of §4.3 | Line 2916 cites §4.3. GREITHER-1992 lines 795–798 start an Euler system at every circular number via Lemma 2.3 | Correct. The p. 468 locator still matches Theorem 3.1 and Remark (c), lines 691–706 |
| §4.2 (sampled) | locators p. 455 and p. 456 | GREITHER-1992 lines 240–249 (setting), 251–261 (Lemma 2.1 and its Corollary, with `[F:F′]²`) and 272–277 (Lemma 2.2) | The statements as written agree with the source |

The rows for the untouched statements stand as in the previous review, of `8eeb3ed`.

- **Gate:** run on this head against `origin/main`, every check is 0 and the result is `OK`. This run prints no `build=` field; the worker's run at the same head records `build=0`. Nothing changes outside the folder.
- **Elaboration:** `lake env lean` gives only the five `sorry` warnings (lines 126, 151, 166, 182, 199). `Suggested.lean` is unchanged since `c386732`. The tool flags `globalUnitImage` for lacking `[NumberField K]`; this is harmless, because `𝓞 K` needs only a field.
- **Dependency check:** `depcheck: 247 roadmaps, 2241 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Links:** there are 197 `[§x.y](#…)` links, three of them new. Each resolves to the group heading that holds its label.
- **Sources:** GREITHER-1992 was read from Numdam through the sources service, at pp. 455, 456, 468, 471 and 482 (5 locators).
- **Citations in the changed lines:**
  - IntegralIwasawaTheory at `72d834e`: §§0.3, 1.7, 2.2, 2.8, 3.2 and 4.4 exist (its README lines 92, 213, 311, 413, 443 and 725).
  - Tau Ceti: `TauCeti.TateCohomology.herbrandQuotient` exists (`HerbrandQuotient.lean:123`).
  - ClassFieldTheory Layer 0, on main, is the layer of Tau Ceti's Tate-cohomology suppliers (its README line 776).
- Overlap check: read the scopes of IntegralIwasawaTheory, CyclotomicClassGroupsAndStickelberger and EulerSystemsAndKolyvaginSystems at their heads; ClassicalArithmeticCompletion stands as in the previous review. The diff moves no ownership. IntegralIwasawaTheory §1.7 owns the circular lattice. Greither's semilocal limits (§§4.2–4.3) and his Theorem 4.1 bound (§§4.20–4.21) belong to this roadmap, and a search found no second owner.
- **Remark on untouched text (no change asked):** the *See* line of §4.2 names only “the setting, p. 455” and Lemma 2.2. Lemma 2.1 and its Corollary are on p. 455 (GREITHER-1992 lines 251–261) but are not named there.

Source independence: changed passages only. 5 passages were compared with 1 source, GREITHER-1992 at pp. 455–456, 468, 471 and 482: the §4.20 and §4.2 introductions and the *Needs* lines of §§4.8, 4.10 and 4.12. The longest shared run is 3 words (“every odd character”), which the mathematics forces. The largest share is RUBIN-ES, with 80 of the 197 bold source-id mentions before the References (GREITHER-1992 has 69). The contents were not re-compared, because no layer was added, removed or reordered.

## Not verifiable

- **Sampled targets outside the changed passages** (0.1, 0.2, 0.6, 0.20, 0.29, 1.3, 2.1, 3.1, 4.1, 4.7, 4.23, 4.26, 5.1) were not re-read, because their text is unchanged since the reviews that checked them.
- **MORITA-1975** is still uncertified, carried from earlier rounds.
- **The five Lean theorems** are admitted by design: their types and the tested instances are checked, not proofs.

## Source issues

- none

## For the human reviewers

- none
