# FIX-PKG-SpectralSequencesAndConvergencePartII~2

The review has four findings: one P2 and three P3. All four were checked against the main branch, the pinned Mathlib and the cached sources. All four are correct, and all were applied. Only `README.md` and `sources.toml` changed. `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged.

## REV-PKG-SpectralSequencesAndConvergencePartII/F01 (P2) — applied

The finding is correct. On main, `TauCetiRoadmap/KhovanovHomology/README.md` §K5 states, for bounded finite free `ℤ`-complexes:
- both universal-coefficient sequences (lines 541–542);
- the Künneth sequence (lines 553–554);
- the `Tor'`/`Tor` comparison through two-term free presentations (lines 562–565).

Our README never named that roadmap. I recomputed the indices: §K5's `Hⁱ⁺¹` Tor term, its `H¹⁻ⁱ`/`H⁻ⁱ` Ext form and its `p+q=i+1` Künneth term match 4.2(a), 4.2(c) and 4.3 at `n = i`.

Changes (old → new):
- *Scope and ownership*: new bullet **KhovanovHomology, §K5** after the Tau Ceti bullet. It says these are the integral two-column cases of 4.2(a), 4.2(c) and 4.3, and the length-one case of 4.1, compared in Checks.
- One new Check each in 4.1, 4.2 and 4.3, each with a computed witness.

## REV-PKG-SpectralSequencesAndConvergencePartII/F02 (P3) — applied

The finding is correct. `Mathlib/Algebra/Homology/DerivedCategory/RightDerivedFunctorPlus.lean:28` has only "TODO(@joelriou): refactor the definition of `Functor.rightDerived`". `Mathlib/CategoryTheory/Abelian/RightDerived.lean:41–46` plans to redefine `F.rightDerived` through `rightDerivedFunctorPlus`. Neither records a comparison as missing. `rightDerivedFunctorPlus` occurs in exactly these two Mathlib files and in no Tau Ceti file, so the claim that no comparison exists at the pin stands.

Old → new, in Exact supplier contracts: "(the file's documentation records that one as missing)" → "(none is proved at the pin; the documentation of this file and of `Mathlib/CategoryTheory/Abelian/RightDerived.lean` records only the intention to redefine `Functor.rightDerived` through `rightDerivedFunctorPlus`)".

Same pattern elsewhere: the README's other documentation claim is that `Mathlib/CategoryTheory/Monoidal/Tor.lean` "records `Tor ≅ Tor'` as missing". It is correct: lines 18–21 of that file say the isomorphism still needs to be shown.

## REV-PKG-SpectralSequencesAndConvergencePartII/F03 (P3) — applied differently

The finding is correct: 4.2(c) and the 6.2 items *Higher Bocksteins*, *Stabilisation* and *Convergence* had no locator. I placed each locator at its claim rather than in one parenthesis. For 4.2(c) I preferred readable sources to the uncertified ones the finding proposed.

- **4.2(c), the spectral sequence:** grothendieck1957 line 1304–1308 (the contravariant variant of (2.4.2), the text 2.6 already cites) and cartan-eilenberg1956 Ch. XVII, uncertified.
- **4.2(c), the two-column sequence:** hatcher-at line 8476–8479, Theorem 3.2, for `R = ℤ` and free complexes; its `Ext(H_{n−1})`/`Hom(H_n)` is our `H^{1−n}`/`H^{−n}`. Also weibel1994 §3.6, uncertified.
- **6.2 *Higher Bocksteins*:** mccleary2001 Ch. 10, uncertified, for `A = ℤ`.
- **6.2 *Stabilisation*:** may-primer line 161–168 (it computes `E_r = 0` for `r > s` on a summand `ℤ/p^s`, and `E_∞ ≅ (H/T) ⊗ 𝔽_p`), plus mccleary2001 Ch. 10.
- **6.2 *Convergence*:** mccleary2001 Ch. 10. The general pair `(A, f)` is proved by the route.

`sources.toml` changes:
- `cited_for` gains "4.2" for grothendieck1957, hatcher-at, weibel1994 and cartan-eilenberg1956, and "6.2" for mccleary2001.
- The hatcher-at locator gains Theorem 3.2 (line 8476–8479), and the weibel1994 locator gains §3.6.
- In References, hatcher-at gains §3.1, Theorem 3.2, and weibel1994 gains §3.6.

Same pattern elsewhere: I scanned every Layer subsection mechanically for blocks with "Prove", "there is a" or "there are" and no source id. The other hits (1.4, 2.1(a)/(a′), 3.4, 5.2) carry their locator in the lead paragraph of the subsection. There were no other gaps.

## REV-PKG-SpectralSequencesAndConvergencePartII/F04 (P3) — applied

The finding is correct. douady1959 line 143–166 is §II A: the definition of a spectral product and Théorème II A, whose proof is omitted. The body never wrote the key.

Old → new:
- *Scope and ownership*: "Douady's products of spectral systems" → "… (douady1959 line 143–166, §II A)".
- References: "(products of spectral systems, not used)" → "(products of spectral systems, named in *Scope and ownership* as outside this roadmap)".

`cited_for = ["Scope and ownership"]` in the manifest is now accurate.

## Checks run

**Elaboration.** `lake env lean packages/SpectralSequencesAndConvergencePartII/Suggested.lean`, run from the content repository, gave nine warnings, all `declaration uses 'sorry'`, at lines 73, 87, 102, 118, 138, 163, 181, 211 and 225. There was no other output. The file was not changed.

**Signatures.** I copied `Suggested.lean` to a scratch file and added `#check @name` for all 11 declarations, then elaborated it once. Every binder is explicit in each signature and no section variable is used. Each type agrees with `signatures.md` and with its README statement. Nothing changed.

**Dependency check** (the command in the brief), exact output:

```text
depcheck: 242 roadmaps, 2195 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. KhovanovHomology is on main, so citing it adds no forbidden edge.

**Citations.** `roadmaps resolve` on the README found no cross-roadmap citation and no Lean name missing anywhere. KhovanovHomology §K5 was read on main at e1cd6a5.

## Adversarial pass on the new and changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 4.1 Check, length-one resolutions | `X = ℤ/2 ⊕ ℤ` presented by `ℤ →(2,0) ℤ²`, `M = ℤ/2` | `B ⊗ M → Z ⊗ M` is `ℤ/2 → (ℤ/2)²`, `1 ↦ (0,0)`: kernel `ℤ/2` (`Tor'_1`). Resolving `M`: `ker(×2 on ℤ/2 ⊕ ℤ) = ℤ/2` (`Tor_1`). Cokernel `(ℤ/2)² = X ⊗ M` (`Tor_0`). `Tor_2 = 0` both ways | agrees with 4.1 | the cokernel value is written into the Check as the wrong model |
| 4.1 Check, degenerate | `X = ℤ` (`B = 0`); `X = 0` | `Tor_1 = 0` on both sides | agrees | none |
| 4.2 Check (a), integral finite free | `C = (ℤ →(×2) ℤ)` in degrees `−1, 0`, `M = ℤ/2`, `n = −1, 0` | `n = −1`: `0 → 0 → H^{−1}(C ⊗ ℤ/2) = ℤ/2 → Tor_1(ℤ/2, ℤ/2) = ℤ/2 → 0`. `n = 0`: `0 → ℤ/2 → ℤ/2 → Tor_1(H^1 = 0) = 0 → 0`. With `Hⁿ` instead of `Hⁿ⁺¹` in the Tor term, `n = −1` gives `0`, against `ℤ/2` | agrees; the wrong index is refuted | wrong index written into the Check |
| 4.2 Check (c), integral finite free | same `C`, `M = ℤ`, `n = 0, 1` | `Hom(C, ℤ) = (ℤ →(±2) ℤ)` in degrees `0, 1`. `n = 1`: `Ext¹(ℤ/2, ℤ) = ℤ/2 → H¹ = ℤ/2 → Hom(0, ℤ) = 0`. `n = 0`: `0 → H⁰ = 0 → Hom(ℤ/2, ℤ) = 0` | agrees with the existing contravariant Check | none |
| 4.2 Check, `C ⊗^L M = C ⊗ M`, `Hom_D(C, M[n]) = Hⁿ Hom(C, M)` | bounded complexes of free modules | bounded above and flat (DerivedModuleAlgebra §0.2); bounded and projective, hence K-projective | true | none |
| 4.3 Check, integral finite free | `C = D = (ℤ →(×2) ℤ)` in degrees `−1, 0`, Koszul sign of 5.2 | `d(e⊗e) = 2f⊗e − 2e⊗f`, i.e. `(−2, 2)` on `(e⊗f, f⊗e)`; `d(a, b) = 2a + 2b`; composite `−4 + 4 = 0`. `H^{−2} = 0`, `H^{−1} = ℤ/2`, `H^0 = ℤ/2`. `n = −1`: `0 → 0 → ℤ/2 → Tor_1(ℤ/2, ℤ/2) → 0`. `n = 0`: `ℤ/2 → ℤ/2 → 0`. `n = −2`: all `0`. Summing over `i + j = n` gives `0` at `n = −1` | agrees; the wrong index is refuted | basis and sign written out in the Check |
| Scope bullet, KhovanovHomology §K5 | §K5 lines 541–542, 553–554, 562–565 against 4.1–4.3 | the three index conventions agree at `n = i`; §K5's comparison is 4.1 for a resolution `B → Z` of length one | instance, not a duplicate: ours is general (any ring, any complex, monoidal abelian balancing) | none |
| 4.2(c) two-column locator, hatcher-at Theorem 3.2 | `R = ℤ`, `C` free, cohomological reindexing `K^{−n} = C_n` | `Ext(H_{n−1}(C), G) = Ext¹(H^{1−n}(K), G)`, `Hom(H_n(C), G) = Hom(H^{−n}(K), G)` | the source statement is a special case of ours (ℤ hereditary; a complex of free abelian groups splits into two-term pieces and is K-projective) | none |
| 6.2 stabilisation locator, may-primer | summand `ℤ/p^s` | `E_r = 𝔽_p` in two degrees for `r ≤ s`, `0` for `r > s`; `E_∞ = (H/T) ⊗ 𝔽_p = H̄ ⊗ 𝔽_p` (prime-to-`p` torsion dies under `⊗ 𝔽_p`) | agrees with *Stabilisation* and with the Check "The ℤ/p^r complex" | none |
| F02 library claim | grep of the pinned Mathlib and Tau Ceti for `rightDerivedFunctorPlus` | 2 Mathlib files, 0 Tau Ceti files; no declaration mentions both names | "none is proved at the pin" holds | none |

## Notes for the maintainer

- **Names.** No Lean name, section number or target id changed, so no other roadmap's citation is affected.
- **Ownership.** KhovanovHomology is on main and is cited as the owner of integral instances, not as a supplier, so nothing moves. No new construction was added, so no ownership check against open pull requests was needed beyond the existing citations, which still resolve.
- **The plan and the README now disagree on two locators.**
  - The 6.2 entry under the plan's targets does not list mccleary2001 Ch. 10. An earlier design round removed it there when the README did not cite it; the README's 6.2 now does.
  - The plan's 4.2 locator lacks the new 4.2(c) locators.

  I can edit only the plan's top-level `gaps`, so both target locators stay as they are. Whoever next revises the plan's targets should add them.
- **For the human reviewers.** The review's two questions (the scope of headline 2.2(i) after Mathlib's planned redefinition, and the `resolution` field of grothendieck1957 in `sources.toml`) were left as they are, as the brief requires.
- **Untrusted text.** The review contains no instruction-like text.
