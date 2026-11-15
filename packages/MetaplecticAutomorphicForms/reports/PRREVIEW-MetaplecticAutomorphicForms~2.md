# Review of MetaplecticAutomorphicForms (pull request #1063 at ebe857f)

**Verdict:** needs changes

Incremental re-review of the 36 lines changed since `22bee85` (README only; `Suggested.lean` is unchanged), plus the pull request's title and description. Five P3 findings, none blocking; the gate passes.

## R01 (P3) — Weil64 and GZ86 "PDF" page numbers do not match the linked copies

**Location:** `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md` lines 1467, 1485, 1493, 1501, 1509, 1818 (GZ86, changed) and 178, 200, 265, 311, 362, 370, 408, 482, 534, 542, 1154, 1180, 1206, 1224, 1242, 1298, 1316, 1326, 1354 (Weil64); line 3469: "Page numbers refer to the linked version. “PDF” denotes a physical page".

**Claim:** in the linked copies, GZ86 printed 270 is PDF 46, 273–275 is PDF 49–51; Weil64 printed 147 is PDF 5, 149 is PDF 7, 157 is PDF 15.

**Witness:** the newly linked GZ86 copy has 122 physical pages for 96 printed: printed 270 heads PDF 55 (GZ86 line 1787), 273 PDF 58 (line 1896), 274 PDF 60 (line 1937), 275 PDF 61 (line 1968). Weil64: printed 147 heads PDF 6 (line 172), 149 PDF 9 (line 232), 157 PDF 18, 193 PDF 65.

**Repair:** delete every `PDFn` from the Weil64 and GZ86 locators and keep the printed pages, which are right everywhere I checked (only GZ86 `printed229, PDF5` is correct as it stands). Neither copy has a constant offset, so shifting the numbers does not repair them.

## R02 (P3) — 0.14 omits the section of Weil64 that carries the symplectic invariance

**Location:** `README.md` line 265: "(Weil64, I.§2, printed147, PDF5 and I.§4, printed149, PDF7 (self-dual Haar measures, the module of an automorphism, the group `A(G)`); Kudla96, I.2 pp.6–10 (measure conventions on `X` and `Y`))".

**Claim:** I.§2 and I.§4 support "every symplectic automorphism preserves it".

**Witness:** Weil64 lines 173–200 (§2) define the dual measure and the module; lines 233–249 (§4) define `A(G)` as a locally compact group. That a symplectic automorphism has module 1 is in §3, printed 148 (lines 225–227).

**Repair:** write "(Weil64, I.§§2–4, printed 147–149 (dual Haar measures, the module of an automorphism, module one for symplectic automorphisms, the group `A(G)`); Kudla96, I.2 pp.6–10 (measure conventions on `X` and `Y`))".

## R03 (P3) — Layer 7 `*Needs:*` lines still carry `5.5` on classical targets

**Location:** `README.md` lines 1838, 1854, 1872, 1878, 1910, 1922, 1928, 1944, 1960, 2007, 2041, 2049, 2065, 2071, 2115, 2121, 2127, 2133, 2139, 2145, 2159, 2213, 2279, 2291, 2299, 2305, 2317, 2323, 2329, 2343, 2349, 2359.

**Claim:** each target's statement or route needs 5.5, the adelic metaplectic Whittaker coefficient over `U(F)\U(A)`.

**Witness:** 7.1 (line 1838) is the cocycle law and `|J|=1` for `J(γ,z)=θ(γz)/θ(z)` on `Γ₀(4)`; 7.9 (line 1928) is a subspace cut out by classical Fourier coefficients; 7.18 (line 2049) is a Bessel–Kloosterman series. None mentions an adelic integral. The change deleted `5.5` at 7.5, 7.7, 7.16 and 7.28a only.

**Repair:** delete `5.5` from the 32 lines listed; keep it at 7.49 (line 2384), the adelic comparison, and add it back only at a target whose route passes through 7.49 or 7.29a, saying so in that line.

## R04 (P3) — Lean form: docstring title and layer comments

**Location:** `TauCetiRoadmap/MetaplecticAutomorphicForms/Suggested.lean` lines 6, 77, 187.

**Claim:** the module docstring is titled "<title>: target signatures" and a file stating targets of several layers carries `/-! ## Layer k: <title> -/` comments in README order.

**Witness:** line 6 reads `# Metaplectic groups, Weil representations and automorphic theta kernels`; lines 77 and 187 open `namespace StoneVonNeumann` (Layer 1) and `namespace GenusTwo` (Layer 8) with no section comment. The file is unchanged since `22bee85`.

**Repair:** line 6: `# Metaplectic groups, Weil representations and automorphic theta kernels: target signatures`; before line 77 add `/-! ## Layer 1: Stone–von Neumann and the oscillator normalizer -/`; before line 187 add `/-! ## Layer 8: Genus-two Jacobi and Eisenstein analysis -/`.

## R05 (P3) — the description announces red-team passes that the branch already contains

**Location:** pull request description, Validation paragraph: "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package, with author-side red-team passes to follow."

**Claim:** the red-team passes have not been made at this head.

**Witness:** the branch has four commits titled "red-team repairs" (`4dec7f47`, `cb11c64b`, `f91c5dd6`, `297a40c9`), then `22bee85d` "state the headline theorems in Suggested.lean" and `ebe857f1` "apply the review's P3 repairs".

**Repair:** replace the sentence's end by "…, followed by author-side red-team passes and one round of review repairs; `Suggested.lean` states three headline theorems (smooth and unitary Stone–von Neumann, genus-two theta inversion) and names the others as not statable at the pins."

## Previous findings

- R01 — partly repaired: "(Weil64, I.§2, printed147, PDF5 and I.§4, printed149, PDF7 (self-dual Haar measures, the module of an automorphism, the group `A(G)`); Kudla96, I.2 pp.6–10 (measure conventions on `X` and `Y`))"; §3 is missing (R02).
- R02 — repaired: "(EZ85, §6 (Fourier–Jacobi coefficients); BFH90, §2 `equations(2.2)–(2.3)`, printed551–552, PDF10–11 (Fourier extraction in the elliptic variable))", with EZ85 added to the References.
- R03 — not repaired: Weil64 PDF numbers are unchanged; GZ86 is relinked to the text copy but its new numbers ("printed270, PDF46", "printed274–275, PDF50–51") are wrong for that copy (R01).
- R04 — repaired: "8.73–8.74 identify `L(s,D₀)=…` … with the Rankin–Selberg factors from AutomorphicLFunctionsAndLocalFactors AL.3 and the symmetric-square L-function from GL2AutomorphicRepresentationsAndTransfer R17.4.13."
- R05 — partly repaired: the duplicated AL.0 items at 0.14, 0.17 and 2.1 are merged and `5.5` is gone from 7.5, 7.7, 7.16, 7.28a; 32 classical Layer 7 targets still list it (R03).
- R06 — partly repaired: line 11 now reads "RepresentationTheory/ClassicalGroups Layer 0"; `Suggested.lean` is unchanged (R04).

## Verified sound

| # | Statement | Instance | Left | Right | Result | Change |
|---|---|---|---|---|---|---|
| 1 | 8.85 identification against 8.73, `D₀` fundamental | `X=p^{−(2s+k−4)}`, `σσ′=p^{k−1}` | `Sym²` factor `(1−σ²X)(1−σσ′X)(1−σ′²X)`, middle term `p^{k−1}·p^{4−k−2s}=p^{3−2s}` | 8.73 numerator `(1−σ²p^{4−k−2s})(1−σ′²p^{4−k−2s})(1−p^{3−2s})` | agree | none |
| 2 | 8.85 identification, `D=0` | `X=p^{−(2s+k−5)}` | middle term `p^{k−1}·p^{5−k−2s}=p^{4−2s}` | 8.73 denominator factor `(1−p^{4−2s})` | agree | none |
| 3 | 8.85 twist factor | argument `s+k/2−2` | `χ(p)σ·p^{−(s+k/2−2)}` | 8.73 `χ_{D₀}(p)σ_p p^{2−k/2−s}` | agree | none |
| 4 | 0.14 symplectic invariance | Weil64 §3 | `|σ^I|=|σ|` and `σσ^I=1` give `|σ|²=1`, so `|σ|=1` | README: every symplectic automorphism preserves the measure | agree; locator incomplete | R02 |
| 5 | GZ86 page map (linked copy) | printed 229, 270, 273, 274, 275 | PDF 5, 55, 58, 60, 61 | README 5, 46, 49, 50, 51 | one of five agrees | R01 |
| 6 | Weil64 page map (linked copy) | printed 147, 148, 149, 157, 161, 193 | PDF 6, 8, 9, 18, 24, 65 | README 5, 6, 7, 15, 19, 51 | none agrees | R01 |
| 7 | 6.19 locator split | BFH90 (2.2)–(2.3) as read by the review of `22bee85` | elliptic-variable extraction only | README now attaches exactly that clause to BFH90 | agree | none |

The rows for untouched statements stand as in the previous review, of `22bee85`.

- Source locators checked against the text: 11 (Weil64 §§2, 3, 4 and six page headers; GZ86 (5.2), (1.1), Lemma (2.3) and its proof, five page headers).
- Library declarations: none touched by the change; `lake env lean` on `Suggested.lean` gives four `declaration uses sorry` warnings (lines 108, 145, 167, 211) and nothing else.
- Cross-roadmap citations resolved for the changed passages: RepresentationTheory/ClassicalGroups Layer 0 (main, README line 327); AutomorphicLFunctionsAndLocalFactors AL.0, AL.1, AL.3 (its head, lines 261, 644, 1431); GL2AutomorphicRepresentationsAndTransfer R17.4.13 (its head, line 2646).
- Gate at this head: every check 0, `OK`. Dependency check: `depcheck: 247 roadmaps, 2247 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- No file outside the roadmap folder is changed (`git diff --stat origin/main...HEAD` outside the folder is empty).
- Pull request text: title, summary block and the remaining prose agree with the head (consumers as in "Downstream consumers"; 2.4b for the kernel-of-`λ₂` topology; 3.7 for the characteristic and dyadic claims), except R05.
- Overlap check: the overlap tool lists no shared roadmap, dropped id or second copy; the scopes of the closest roadmaps were not read again in this round and stand as in the review of `22bee85`.
- Source independence: changed passages only; 3 passages compared with 2 sources (Weil64 lines 173–249, GZ86 lines 1787–1998), none shared; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- EZ85 §6: the linked DOI is paywalled and no legal copy was found; the citation stands by its locator alone.
- BFH90 (2.2)–(2.3) was not opened again; row 7 relies on the reading recorded in the previous review.

## Source issues

- none

## For the human reviewers

- Licence: Weil64 is linked at a third party's personal page on an Edinburgh university host (`README.md` line 3473); the host's right to carry the Acta Mathematica scan was not established.
- Licence: BFH90 is linked at a third party's site, wstein.org (`README.md` line 3495), as a scan of a Springer journal article; its status there was not established.
- Not tested: the source with the largest share of the locators was not recomputed and the arrangement was not compared in this incremental round.
