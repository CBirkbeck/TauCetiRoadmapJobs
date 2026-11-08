# Review of InstantonFloerTheory (pull request #1083 at 0b47a8f)

**Verdict:** accepted

Incremental re-review of the 15 changed lines since 4f6a153 (README only; `Suggested.lean` and `metadata.toml` are byte-identical to the head the previous review read). All three previous findings are repaired, and the repairs introduce no new problem: the tensor differential now carries the sign `(−1)^|x|` and gives a complex, the universal-coefficient attribution matches the pinned binders, and the cyclically graded Künneth sequence is stated for `ZMod (2m)` over a principal ideal domain with one free factor, which is exactly what its written proof uses. The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates. No finding.

## Previous findings

- R01 — repaired: line 194 "the differential `d(x⊗y)=dx⊗y+(−1)^|x| x⊗dy`, the parity of `|x|` being well defined modulo 8" with an absolute lift chosen per component, the shift-by-`k` isomorphism `x⊗y↦(−1)^(k|y|)x⊗y`, and `(−1)^(|x||y|)` reserved for the symmetry; the sign Check at line 204 and the named generators `e`, `f` in the Tor witness at line 203 are as the repair asked.
- R02 — repaired: line 17 "the universal-coefficient sequence for chain complexes `ChainComplex C α` whose index `α` is an additive right-cancellative semigroup with `1`, which includes `ZMod 8` with `d:C_i→C_(i−1)`"; line 292 the same, with the hypotheses "the cycles are projective and split off the terms" and the PID file's supply "on any complex shape".
- R03 — repaired: line 196 "Let R be a principal ideal domain, `m≥1`, and C, C' complexes of R-modules graded by `ZMod (2m)` … C degreewise free and C' arbitrary", with `2m=8`, `2m=4`, `Z[1/2]` and `C` named as instances, the odd-modulus Check at line 205 and the freeness Check at line 206.

## Verified sound

**Gate, build, dependency check, scope.** My run of the gate at 0b47a8f reports `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate on the same head also reports `build=0`. The dependency check prints:

    depcheck: 244 roadmaps, 2462 edges, 0 problem(s)

with no UPWARD, CYCLE or `moved:` line. `lake env lean` on `Suggested.lean` exits 0 with no output. `git diff --stat origin/main...HEAD` outside the folder is empty; `git diff --stat 4f6a153..HEAD` touches only `TauCetiRoadmap/InstantonFloerTheory/README.md` (10 insertions, 5 deletions). The changed lines contain no process words, no pull-request numbers and no LaTeX.

**Suggested.lean.** Unchanged since the previous two reviews: module form, one `public import Mathlib`, one module docstring and an empty namespace. It declares nothing, so there is nothing to `#check` or to probe with one tactic. The five headline theorems it names (IF5 homology; IF6 cobordism maps and `u²−64=0`; IF7 reduced and framed groups; IF8 triangle, excision and nilpotence; IF9–IF10 Atiyah–Floer) are still the README's headlines, and none is statable at the pins for the reasons the docstring gives (no principal bundles, gauge groups, curvature or Sobolev completions in Mathlib 1b1ccf4b; no surface moduli or mixed equation). The new `ZMod (2m)`-graded Künneth sequence is statable in principle, but it is homological algebra naming none of the roadmap's objects, so it is rightly not a headline of this file.

**Library declarations opened at the pins** (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9), for every library claim in the changed lines:

- Mathlib `Mathlib/Algebra/Homology/ComplexShapeSigns.lean` lines 117–124: `class TensorSigns` over `[AddMonoid I]` with `ε' : Multiplicative I →* ℤˣ`, `rel_add`, `add_rel` and `ε'_succ : c.Rel p q → ε' q = −ε' p`; lines 168 and 182, the only two instances in Mathlib (`down ℕ`, `up ℤ`; a grep for `instance.*TensorSigns` over all of Mathlib finds no other, line 268 being the `Associative` instance). This bears out line 208 "exists at the pin for `ComplexShape.down ℕ` and `ComplexShape.up ℤ` only". Tau Ceti declares no `TensorSigns` instance (grep over `TauCeti/`: only two docstring mentions), and `TauCeti/Algebra/Homology/Periodic/` has no tensor product, so "constructed here on `ZMod (2m)`" duplicates nothing.
- Tau Ceti `Algebra/Homology/UniversalCoefficient/Basic.lean` line 79 `{α : Type*} [AddRightCancelSemigroup α] [One α]`, line 83 `{X : ChainComplex C α}`, line 180 `exact_extToHomology_kronecker … [Projective (X.cycles j)] [IsSplitMono (X.iCycles j)]`: lines 17 and 292 now state exactly these binders and hypotheses.
- Tau Ceti `Algebra/Homology/PrincipalIdealRing.lean` lines 55–56 `[IsPrincipalIdealRing k] [NoZeroDivisors k] {c : ComplexShape ι}` and instances at lines 60, 68, 83 (free cycles, split cycles, free cokernel of cycles, each needing only projectivity of the term or of the next term): line 292 "on any complex shape for complexes of projective modules over a principal ideal domain" is right.
- Tau Ceti `Monoidal/Homology/Cross.lean` lines 53–54 `[AddMonoid I] {c : ComplexShape I} [c.TensorSigns]` and line 153 `homologyCross`: line 17 "on any shape carrying `ComplexShape.TensorSigns`" is right.
- Tau Ceti `Monoidal/Homology/Kunneth/Sequence.lean` docstring lines 16–34 and `homologyKunnethShortComplex_shortExact` at line 729 on `ChainComplex (ModuleCat R) ℕ`, hypotheses `[∀ q, Projective (cokernel (L.iCycles q))]` (line 270) and `[∀ q, Projective (L.cycles q)]` (line 307), "No hypothesis is imposed on `K`"; splitting at line 793 under `[∀ p, IsSplitMono (K.iCycles p)]`. The README's sequence puts the free factor first and the arbitrary factor second, the mirror of the library's; the argument is symmetric up to the symmetry isomorphism the README names.
- Tau Ceti `Algebra/Homology/Split.lean` line 357 `exists_homotopyEquiv_d_eq_zero` on any shape, for the complex-coefficient comparison.

**Ownership.** `tauceti-roadmap roadmaps grep` for Künneth with a cyclic or `ZMod` grading over main and the 478 open heads finds only ordinary (ℕ- or ℤ-graded) Künneth citations and Künneth applied to cyclic groups (GroupActionsOnRiemannSurfaces, StableHomotopyKTheoryPartII, DGFloer), none a Künneth sequence for cyclically graded chain complexes. `scratch/overlaps.md`: no other open pull request changes this roadmap, none drops an id it cites, and none of its ids is defined only by an open revision. The citation resolver found nothing unresolved.

**Sources.** The diff adds no source locator: the two touched `*Needs:*` lines keep the Donaldson, Kronheimer–Mrowka, Frøyshov and Scaduto locators the previous two reviews opened (km0807 §7.1 pp. 52–53 at lines 1770–1782 and 1801; scaduto1401 §7.1 p. 29 at lines 1258–1271; froyshov9903 §2 p. 4 at lines 118–127; km0807 Definition 7.3 p. 55 at lines 1859–1867), and the seeded sample falls outside the changed passages. The new Checks are computed, not cited, and are recomputed below.

**Adversarial table.** Rows 1–53 of the previous report (PRREVIEW-InstantonFloerTheory~4 at 4f6a153, which itself carried rows 1–26 and 29–40 from PRREVIEW-InstantonFloerTheory~3) cover statements this diff leaves untouched and are carried forward with their computed values; row 43 (the sign) and row 47 (the Künneth generality) are superseded by rows 54 and 61 below. The rows below are mine, computed at this head.

| # | Statement | Instances | Values on each side | Result |
|---|---|---|---|---|
| 54 | `d(x⊗y)=dx⊗y+(−1)^|x| x⊗dy` is a differential (line 194) | general `x`, `y` | `d²(x⊗y)=d²x⊗y+(−1)^(|x|−1)dx⊗dy+(−1)^|x|dx⊗dy+x⊗d²y=0`, the two middle terms cancelling | holds |
| 55 | shifting the first lift by `k` is the isomorphism `x⊗y↦(−1)^(k|y|)x⊗y` (line 194) | `d'` with `|x|+k` | `φd(x⊗y)=(−1)^(k|y|)dx⊗y+(−1)^(|x|+k|y|−k)x⊗dy`; `d'φ(x⊗y)=(−1)^(k|y|)dx⊗y+(−1)^(|x|+k+k|y|)x⊗dy`; exponents differ by `2k` | holds; second-factor shift changes no sign since `d` reads only `|x|` |
| 56 | sign Check (line 204), `(−1)^|x|` | `e↦f` (1→0), `g↦h` (2→1) | `d(e⊗g)=f⊗g−e⊗h`, `d(f⊗g)=f⊗h`, `d(e⊗h)=f⊗h`; `d²(e⊗g)=f⊗h−f⊗h=0` | holds |
| 57 | sign Check, `(−1)^(|x||y|)` | same | `d(e⊗g)=f⊗g+(−1)^2 e⊗h=f⊗g+e⊗h`; `d(f⊗g)=f⊗h`; `d(e⊗h)=f⊗h`; `d²(e⊗g)=2f⊗h` | holds (negative control) |
| 58 | sign Check, lift of `C` shifted by 1 | `e` in 2, `f` in 1 | `d(e⊗g)=f⊗g+e⊗h`, `d(f⊗g)=−f⊗h`, `d(e⊗h)=f⊗h`; `φ=(−1)^|y|` fixes `e⊗g,f⊗g`, negates `e⊗h,f⊗h`; `φd₁(e⊗g)=f⊗g+e⊗h=d₂φ(e⊗g)`, `φd₁(f⊗g)=−f⊗h=d₂(f⊗g)`, `φd₁(e⊗h)=−f⊗h=d₂(−e⊗h)` | holds |
| 59 | Tor witness (line 203) | `C`: `de=2f`, `C⊗C` | `d(e⊗e)=2f⊗e−2e⊗f`, `d(e⊗f)=2f⊗f`, `d(f⊗e)=(−1)^0 f⊗2f=2f⊗f`; `Z₁=Z(e⊗f−f⊗e)`, `B₁=2Z₁`, `H₁=Z/2`; `H₀=Z/2`; tensor term in degree 1 `H₁⊗H₀⊕H₀⊗H₁=0`; `Tor₁(Z/2,Z/2)=Z/2` | holds |
| 60 | "the signs agree on this complex" (line 203) | terms `x⊗dy≠0` | need `y=e`, `|y|=1`, so `(−1)^(|x|·1)=(−1)^|x|` | holds |
| 61 | `ZMod (2m)` Künneth sequence (line 196) | PID `R`, `C` free, `C'` arbitrary | `0→Z_p→C_p→B_(p−1)→0` splits (`B` free); `0→Z⊗C'→C⊗C'→B[−1]⊗C'→0` degreewise split; `d⊗1` is a chain map since `(d⊗1)d(x⊗y)=(−1)^|x|dx⊗dy=d_(B[−1]⊗C')(dx⊗y)`; long exact sequence `⊕_(p+q=n)B_p⊗H_q→⊕_(p+q=n)Z_p⊗H_q→H_n(C⊗C')→⊕_(p+q=n−1)B_p⊗H_q→⊕_(p+q=n−1)Z_p⊗H_q`; `0→Tor₁(H_p,H_q)→B_p⊗H_q→Z_p⊗H_q→H_p⊗H_q→0` from the free resolution `B_p→Z_p` | holds; degrees `n` and `n−1` as stated, no finiteness used, `C'` unrestricted |
| 62 | tensor signs on `ZMod (2m)` | `ε(p)=(−1)^p` | additive through `ZMod (2m)→ZMod 2`, which exists exactly for an even modulus; `Rel p q ↔ q+1=p` is translation-invariant; `ε(q)=−ε(p)` when `q+1=p` | holds; matches the `TensorSigns` fields at the pin |
| 63 | odd modulus, first argument (line 205) | `ZMod 3` | `ε(1)=−ε(0)`, `ε(2)=ε(0)`, `ε(0)=ε(3)=−ε(2)=−ε(0)` | holds (impossible in `ℤˣ`) |
| 64 | odd modulus, general sign rule (line 205) | `(Z/3)²` torus grid | `d²=0` on `C_(p−1)⊗C'_(q−1)` forces the four edge signs of each unit square to multiply to `−1`; 9 squares, 18 edges, each edge in exactly 2 squares; product of the 9 square products `=(∏ edges)²=+1≠(−1)^9` | holds |
| 65 | freeness Check, free `C`, non-free `C'` (line 206) | `C'=Z/2` in degree 0 | `d(e⊗1)=2f⊗1=0`; `H₁=Z/2=Tor₁(Z/2,Z/2)` (tensor term `H₁(C)⊗H₀(C')=0`); `H₀=Z/2=Z/2⊗Z/2` (Tor term `p+q=−1` vanishes, `H₇(C)=0`) | holds |
| 66 | freeness Check, both non-free | `C=C'=Z/2` in degree 0 | `C⊗C'=Z/2` in degree 0, `H₁=0`; the sequence would need `Tor₁(Z/2,Z/2)=Z/2` as a quotient of `H₁` | holds (negative control) |
| 67 | unrolling (line 196) | `(C⊗C')_n` | `2m` pairs `(p,q)` with `p+q=n` in `ZMod (2m)`; tensor of unrollings `⊕_(a+b=k, a,b∈Z)` infinitely many | holds |
| 68 | instances named at line 196 | `2m=8`, `2m=4`, `Z[1/2]`, `C` | admissible complexes relatively `Z/8`-graded (line 68), folded extended-gauge complexes relatively `Z/4`-graded (line 68), both direct sums of orientation lines hence free; `Z[1/2]` is used at line 272 and is a PID, as is `C` | holds |
| 69 | universal-coefficient binders (lines 17, 292) | `α=ZMod 8` | `ZMod 8` is an additive group with `1`, so `[AddRightCancelSemigroup α] [One α]` hold; `ChainComplex C α` is `ComplexShape.down α`, `d:C_i→C_(i−1)` | holds |

## Not verifiable

- Donaldson, *Floer Homology Groups in Yang–Mills Theory*, §§5.2–5.3 (pp. 122–129), §5.6 (p. 145) and §7.1 (p. 168), cited unchanged in the two touched `*Needs:*` lines. The book is not in an open repository; carried from the previous reports.

## Source issues

- none
