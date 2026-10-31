# Review of DeformationAndDerivedPatchingAlgebra (pull request #1034 at c94eeb0)

**Verdict:** accepted

Incremental re-review of the 4 changed lines since 96614c5 (3 insertions, 1 deletion, all in `README.md`; nothing outside the folder). The change adds one Check to §7.5 (complete flat is weaker than projective: `∏_ℕ O` over a complete DVR), cites Buchweitz–Flenner (2006), Theorems 2.1 and 2.3, in the §7.5 source line, and adds the reference. Checked: the new Check against the source at its locators and by computation; the reference's journal metadata; the two notes of the previous review; the gate, the dependency check and the elaboration of the unchanged `Suggested.lean`. No blocking finding; one new note (P3) and the two previous notes, all the author's to take or leave.

## R01 (P3) — The new Check should name the index set of the free direct sum whose completion is `∏_ℕ O`

**Location:** `README.md:1448`: "the product `O[[X]]=∏_ℕ O` is torsion-free, hence flat, and separated complete, so it is the completion of a free direct sum".

**Claim:** `∏_ℕ O` is the completion of a free direct sum (true by the residue-basis comparison stated at `README.md:1439`, with `J` a basis of `∏_ℕ k`).

**Witness:** two bullets earlier (`README.md:1445–1446`) the same list says the completion of `O^(ℕ)` excludes the constant family and the full product is strictly larger. The index set here is not `ℕ`: the residue of `completion(O^(J))` is `k^(J)`, of dimension `|J|`, while `∏_ℕ O/π=∏_ℕ k` has dimension `|k|^ℵ₀ ≥ 2^ℵ₀ > ℵ₀`. So `∏_ℕ O ≅ completion(O^(J))` only for `J` of that uncountable cardinality, and `∏_ℕ O ≇ completion(O^(ℕ))`.

**Repair:** write "so it is the completion of a free direct sum on an index set of the cardinality of a basis of `∏_ℕ k`, not on `ℕ`" (one clause). Nothing else changes; the non-projectivity and the Ext vanishing are correct as stated.

## Previous findings

- R01 — not repaired: `README.md:564` still sources the regular-element reduction `pd_(A/xA)(M/xM)=pd_A M` by "Lemma 10.72.6, tag 00LX, and §10.109, tags 0CXE, 0CXF, 065R", which state the resolution comparisons but not the reduction; `README.md:13` still omits it from the list of what §§3.1–3.2 add. P3, not blocking; the inline proof is correct.
- R02 — not repaired: `README.md:1186` still says "Auslander–Buchsbaum gives freeness over the source completion" without naming PurityOfBranchLocus §0.3's `IsRegularLocalRing.free_of_isCohenMacaulay`, while `README.md:564` says the later uses cite that supplier. P3, not blocking.

## Verified sound

**Gate and dependency check.** Rerun at c94eeb0:

```text
gate DeformationAndDerivedPatchingAlgebra: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 205 roadmaps, 1426 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line for this roadmap. The worker's gate at this head additionally reports `build=0`. `git diff --stat origin/main...HEAD` outside the folder: empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml` only. The diff adds no `*Needs:*` edge, no supplier citation and no Lean name, so the 5 leads of the citation resolver are the same five supplier names (PurityOfBranchLocus §0.3, SchemeAndStackFoundations §0.17, IntegralHeckeAndGaloisDeterminants §§2.1–2.2) resolved in the previous review.

**Elaboration.** `Suggested.lean` is byte-identical to 96614c5. The two `TauCeti.*` imports were built first (`TauCeti.Algebra.Homology.LinearHomComplex.Basic`, `TauCeti.AlgebraicGeometry.LineBundle.Basic`; the object file of the first was missing from the worker's shared build directory, which is why its signature extraction printed nothing). `lake env lean` on `Suggested.lean`: exit 0, exactly 18 `declaration uses sorry` warnings (lines 120–419), nothing else. A scratch copy with `#check @name` for all 32 declarations (14 definitions and abbreviations, 18 theorems) elaborated with exit 0 and no error; `balanced_module_patching` keeps `IsAdicComplete (maximalIdeal O) O`, `Finite (ResidueField O)`, `CharP (ResidueField O) p`, `IsLocalHom (algebraMap O R)`, `IsAdicComplete (maximalIdeal R) R` and both scalar towers, and the other 31 types agree with the README as recorded in the previous review. The one-tactic probe of all 18 theorems and the headline coverage stand as recorded in the previous review, since the file did not change.

**Sources read this round.** Buchweitz–Flenner, arXiv:math/0509180v2 (bf2006 in this review's cache, 7 pages): the abstract (line 8–14: `A[[X]]` over Noetherian `A` is not projective unless `A` is Artinian; over any local `(A,m)`, `Ext^p_A(A[[X]],M)=0` for `m`-adically complete `M`, more generally for any flat `B`); Theorem 2.1 (line 47–48, PDF p. 2: `A` commutative Noetherian of dimension `≥1` ⇒ `A[[X]]` not projective; the proof, line 49–107, reduces to a domain and uses the submodule of series with coefficients tending to zero); Theorem 2.3 (line 113–114, PDF p. 3: `A` any ring, `m` a maximal ideal, `B` flat ⇒ `Ext^p_A(B,M)=0` for `p≥1` and every `m`-adically complete `M`); Lemma 2.4 (line 117–118, flat is free over a local ring with nilpotent maximal ideal); the proof of 2.3 (line 152–180: `M≅lim M/m^(n+1)M` is used through the Mittag-Leffler sequence `0→M→∏M_n→∏M_n→0`, so "complete" includes separated); Corollary 2.7 and Remarks 2.8.1–3 (line 181–198). The README's two uses match: a complete DVR has dimension `1`, and `O[[X]]=∏_ℕ O` is flat. Locator "arXiv v2 pp. 2–3": Theorem 2.1 is on page 2 and Theorem 2.3 on page 3 of the PDF. Reference line `README.md:1947`: Crossref record for DOI 10.1007/s00229-005-0608-8 gives manuscripta mathematica 119 (1), 107–114, print 2006; the arXiv listing dates v2 2 November 2005 with comment "to appear in Manuscripta Mathematica". All as the README writes. Of the seeded sample (§§1.1, 1.9, 1.13, 1.16, 3.7, 4.4, 5.7, 6.7, 7.2, 7.3, 7.8, 8.3, 8.4, 8.6, 9.6), none falls in the diff; they stand as verified at dc87c78 and 96614c5.

**Computed adversarial pass.** `k` a field, `O` a complete DVR with uniformizer `π`, residue field `k`. New rows first (the changed Check); every other row is carried from the review at 96614c5, where its values are recorded.

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| 7.5 Check: `∏_ℕ O` torsion-free, separated, complete | `(a_j)π=0`; `∩_n π^n∏O`; Cauchy `(x^(m))` | `a_jπ=0 ⇒ a_j=0` each `j`; `∩_n π^n∏O=∏_j ∩_n π^nO=0`; componentwise limits exist and `x^(m)→x` in `∏π^nO`; so flat (torsion-free over a PID), separated, complete | Retain |
| 7.5 Check: not free, not projective | `J` infinite: `Σ_n π^n e_(j_n)`; `J` finite; `O=k` (dim `0`); `O/π²` | partial sums Cauchy in `O^(J)`, no limit there, so `O^(J)` is not complete while `∏_ℕ O` is: `∏_ℕ O≇O^(J)`; finite `J` excluded by residue dimension `ℵ₀ ≤ dim ∏_ℕ k`; over a PID projective = free, so not projective, agreeing with Theorem 2.1 at `dim O=1≥1`; controls: `k[[X]]` is a free `k`-module and `(O/π²)[[X]]` is free by Lemma 2.4, so the hypothesis `dim≥1` is used | Retain |
| 7.5 Check: `Ext^p_O(∏_ℕ O,M)=0`, `p≥1`, `M` complete | `p≥2`; `p=1`, `M=O`; `M=k`; `M=O^(ℕ)` | `gl.dim O=1` gives `p≥2` for free; `M=O` and `M=k` are `π`-adically complete, so `Ext¹=0` by Theorem 2.3; `O^(ℕ)` is not complete and Theorem 2.3 does not apply (Remark 2.8.3 says this case is set-theoretic), so the Check's "complete" hypothesis is load-bearing | Retain |
| 7.5 Check: "completion of a free direct sum" | residues of `completion(O^(J))` and of `∏_ℕ O` | `k^(J)` of dimension `|J|` versus `∏_ℕ k` of dimension `|k|^ℵ₀ ≥ 2^ℵ₀`; `J=ℕ` gives `ℵ₀<2^ℵ₀`, consistent with `README.md:1445–1446` (constant family excluded; product strictly larger) | Retain; R01 clause |
| 3.1, 3.2, 3.14, 5.5, 9.2, 9.5 (changed at 96614c5) | as at 96614c5 | associated-prime bound `0≤1`, `0≤0`, `1≤1`; syzygy bound `1≥1`, `2≥2`; `pd` reduction `1=1` and `0≠1` control; F-finite rank `p²`; `p=2` patching ranks `(1,1)`; `χ` additivity `0=−1+1` | Retain (96614c5) |
| Cochain convention, Tor index; §7.6 dual signs | as at dc87c78 | `Tor₁=k` in degree `−1`; dual `+2`, bidual `−2` | Retain (dc87c78) |
| 1.1, 1.2, 1.4, 1.5, 1.7, 1.8, 1.9, 1.12–1.15 | as at dc87c78 | Rees pieces `(A,0,…)`; `t⁵` class; colength `2`; `ℤ/4`, `ℤ/8`; `O→O[[x]]` fails `hcotangent`; `O/π^s` both sides; `I^(2n−1)⊂(xⁿ,yⁿ)` | Retain (dc87c78) |
| 2.1, 2.3, 2.6, 2.8 | as at dc87c78 | `J=(π)⊄m_S²`; `[X²]↦t²≠0`; `k[[X]]/X²` vs `X(2+X)`; `t²` coefficient fixed | Retain (dc87c78) |
| 3.3, 3.4, 3.6, 3.7, 3.8–3.13, 3.15 | as at dc87c78 | `dim 2≠1` excluded; height `1`; top degrees `0,1,1`; `Ô[1]≠O[1]`; socle `1`; `T²+2T`; `(n+1)(n+2)/2`; `e=2` not regular, `e=1` regular; defects `3,1,0` | Retain (dc87c78) |
| 4.1, 4.2, 4.4, 4.5, 4.6 | as at dc87c78 | finite not flat; `ℤ_(5)[i]` semilocal; `Ω_(ℚ_p/ℚ)` infinite; `L[ε]/ε^p≠L`; no `O`-point | Retain (dc87c78) |
| 5.1, 5.6 | as at dc87c78 | `r−dim(Tor₁/π)`; `finrank=s`; `R=O/π^k` forces `R=O` | Retain (dc87c78) |
| 6.4, 6.6, 6.7, 6.8, 6.9 | as at dc87c78 | `ann⊋I`; `2[(x)]`, `2[(ε)]`; multiplicity `4`; `(x,z)` nontrivial in dim `3` | Retain (dc87c78) |
| 7.2, 7.3, 7.5 retract, 7.6, 7.8, 7.9 | as at dc87c78 | ranks `(1,1)`; `∩πⁿE=E` excluded; `ℤ₂=completion(ℤ_(2))`; `Hom_D(k,O)=0`; exponent `2` | Retain (dc87c78) |
| 8.1, 8.3, 8.4, 8.6 | as at dc87c78 | `H⁰=H¹=k` vs `0`; `4` endomorphisms; `[[x,0],[1,x]]`; `H⁰=H¹=k` after | Retain (dc87c78) |
| 9.1–9.3, 9.5–9.7 | as at dc87c78 | `max(1,2)=2`; `pd=depth=1`; `H⁰(D)=O/π`; `Ext¹_O(k,O)=k`; `2=1·2`; `ℚ((X))` killed by `π⁻¹` | Retain (dc87c78) |

**Pinned declarations and cross-roadmap citations.** The diff names no library declaration and no roadmap; the declarations and citations resolved in the previous two reviews are unchanged (Tau Ceti `a91d3aaf`, main at fa41b37). Ownership: the new Check cites Buchweitz–Flenner for a negative example only; it plans no construction, so there is nothing to own. Ownership against the open pull requests whose files this brief lists was not re-searched, since the diff adds no object.

## Not verifiable

- The Springer page of DOI 10.1007/s00229-005-0608-8 redirects to a sign-in; the journal volume, issue, pages and year were taken from the Crossref record of the DOI, not from the publisher page. The arXiv v2 text is the version the README's locators use and was read in full at the cited theorems.
- The items of the previous reviews' Not verifiable lists (Calegari–Geraghty Lemma 6.1 at p. 385, Avramov's book chapter, the Calegari–Geraghty correction, the untouched locators) are unchanged by the diff and were not re-read.
- The universal statements are not Lean proofs: elaboration and the table record instances, not proofs of the eighteen theorems.

## Source issues

- none
